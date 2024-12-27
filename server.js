require("dotenv").config();
const express = require("express");
const sql = require("mssql");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Configuración de conexión a la base de datos
const dbConfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  database: process.env.DB_NAME,
  options: {
    encrypt: true,
    trustServerCertificate: false, // Certificado necesario para Azure
  },
};

// Probar conexión a la base de datos
const testConnection = async () => {
  try {
    const pool = await sql.connect(dbConfig);
    console.log("Conexión exitosa a la base de datos en Azure");
  } catch (error) {
    console.error("Error al conectar a la base de datos:", error.message);
  }
};

testConnection();

// Endpoint para filtrar gastos
app.get("/api/gastos", async (req, res) => {
  const { fechaInicio, fechaFin } = req.query;

  if (!fechaInicio || !fechaFin) {
    return res
      .status(400)
      .send("Por favor, proporciona fechas de inicio y fin.");
  }

  try {
    const pool = await sql.connect(dbConfig);
    const result = await pool
      .request()
      .input("FechaInicio", sql.Date, fechaInicio)
      .input("FechaFin", sql.Date, fechaFin).query(`
                SELECT 
                    d.NombreDepartamento AS Departamento, 
                    SUM(g.MontoGasto) AS TotalGasto
                FROM Gastos g
                INNER JOIN Departamento d ON g.IdDepartamento = d.IdDepartamento
                WHERE g.FechaGasto BETWEEN @FechaInicio AND @FechaFin
                GROUP BY d.NombreDepartamento
                ORDER BY d.NombreDepartamento
            `);

    const totalGeneral = result.recordset.reduce(
      (sum, row) => sum + row.TotalGasto,
      0
    );
    result.recordset.push({
      Departamento: "Total General",
      TotalGasto: totalGeneral,
    });

    res.json(result.recordset);
  } catch (error) {
    console.error("Error al ejecutar la consulta:", error.message);
    res.status(500).send("Error al conectar a la base de datos");
  }
});

// Puerto de escucha
const PORT = process.env.PORT || 5000;
app.listen(PORT, () =>
  console.log(`Servidor corriendo en http://localhost:${PORT}`)
);

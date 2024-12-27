# Backend - Filtrar Gastos

Este es el proyecto de backend desarrollado en Node.js con ExpressJS para gestionar y proporcionar los datos de gastos a través de una API REST.

## Características
- API REST para filtrar los gastos por rango de fechas.
- Conexión a una base de datos SQL Azure.
- Estructura modular y escalable.

## Requisitos
- Node.js (v16 o superior)
- npm (v7 o superior)
- Base de datos SQL en Azure

## Instalación
1. Clonar este repositorio:
   ```
   git clone <repositorio-backend-url>
   cd express-backend
   ```

2. Instalar las dependencias:
   ```
   npm install
   ```

3. Crear un archivo `.env` en la raíz del proyecto con las siguientes variables:
   ```
   DB_USER=<tu_usuario>
   DB_PASSWORD=<tu_contraseña>
   DB_SERVER=<tu_servidor>.database.windows.net
   DB_NAME=<tu_base_de_datos>
   ```

4. Iniciar el servidor:
   ```
   npm start
   ```

## Endpoints Disponibles
### `GET /api/gastos`
- **Descripción**: Filtra los gastos por rango de fechas.
- **Parámetros**:
  - `fechaInicio`: Fecha de inicio (YYYY-MM-DD).
  - `fechaFin`: Fecha de fin (YYYY-MM-DD).
- **Ejemplo**:
  ```
  GET http://localhost:5000/api/gastos?fechaInicio=2024-01-01&fechaFin=2024-03-31
  ```
- **Respuesta**:
  ```json
  [
    {
      "departamento": "Producción Musical",
      "totalGasto": 1030000.00
    },
    {
      "departamento": "Marketing y Publicidad",
      "totalGasto": 890000.00
    },
    {
      "departamento": "Giras Internacionales",
      "totalGasto": 175000.00
    },
    {
      "departamento": "Composición y Letras",
      "totalGasto": 50000.00
    },
    {
      "departamento": "Total General",
      "totalGasto": 2145000.00
    }
  ]
  ```

## Estructura del Proyecto
```
express-backend/
├── server.js          # Servidor principal
├── .env               # Configuración de variables de entorno
├── package.json       # Configuración del proyecto
```

## Scripts Disponibles
- `npm start`: Inicia el servidor en modo producción.
- `npm run dev`: Inicia el servidor en modo desarrollo (con nodemon).

## Configuración
Asegúrate de que la base de datos está configurada correctamente y accesible desde el servidor.

---

### Autor
Desarrollado por [Tu Nombre].

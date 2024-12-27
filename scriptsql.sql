-- Crear tabla Empleados
CREATE TABLE Empleados (
    IdEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    NombreEmpleado NVARCHAR(100) NOT NULL
);

-- Crear tabla Departamento
CREATE TABLE Departamento (
    IdDepartamento INT IDENTITY(1,1) PRIMARY KEY,
    NombreDepartamento NVARCHAR(100) NOT NULL
);

-- Crear tabla Gastos
CREATE TABLE Gastos (
    IdGasto INT IDENTITY(1,1) PRIMARY KEY,
    DescripcionGasto NVARCHAR(255) NOT NULL,
    FechaGasto DATE NOT NULL,
    MontoGasto DECIMAL(18, 2) NOT NULL,
    IdEmpleado INT NOT NULL,
    IdDepartamento INT NOT NULL,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado),
    FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
);

INSERT INTO Empleados (NombreEmpleado)
VALUES 
('Shakira Mebarak'),
('Taylor Swift'),
('Harry Styles'),
('Ross Lynch'),
('Rocky Lynch');

INSERT INTO Departamento (NombreDepartamento)
VALUES 
('Producción Musical'),
('Giras Internacionales'),
('Marketing y Publicidad'),
('Composición y Letras');

INSERT INTO Gastos (DescripcionGasto, FechaGasto, MontoGasto, IdEmpleado, IdDepartamento)
VALUES 
-- Shakira
('Producción del álbum El Dorado', '2024-01-10', 200000.00, 1, 1),
('Promoción de concierto en Barcelona', '2024-02-15', 150000.00, 1, 3),
('Alquiler de estudio en Miami', '2024-03-01', 50000.00, 1, 1),

-- Taylor Swift
('Producción del álbum Midnights', '2024-01-20', 300000.00, 2, 1),
('Marketing para el tour The Eras', '2024-02-25', 400000.00, 2, 3),
('Gastos de vestuario para gira', '2024-03-10', 100000.00, 2, 2),

-- Harry Styles
('Producción del álbum Harry’s House', '2024-01-05', 250000.00, 3, 1),
('Campaña de publicidad global', '2024-02-10', 200000.00, 3, 3),
('Contratación de músicos para gira', '2024-03-20', 75000.00, 3, 2),

-- The Driver Era 
('Producción del álbum Girlfriend', '2024-01-15', 120000.00, 4, 1),
('Diseño y promoción del tour Summer Tour', '2024-02-05', 80000.00, 4, 3),
('Composición de nuevas canciones', '2024-03-12', 50000.00, 4, 4),
('Producción del álbum X', '2024-01-30', 110000.00, 5, 1),
('Promoción digital en redes sociales', '2024-02-20', 60000.00, 5, 3);

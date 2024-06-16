CREATE DATABASE Systech_DB;

-- Seleccionar la base de datos
USE Systech_DB;


-- Creación de la tabla Departamentos
CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100),
    telefono VARCHAR(20)
);

-- Creación de la tabla Cargos
CREATE TABLE Cargos (
    cargo_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cargo VARCHAR(100)
);

-- Creación de la tabla Niveles
CREATE TABLE Niveles (
    nivel_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_nivel VARCHAR(50)
);

-- Creación de la tabla Empleados
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    fecha_contratacion DATE,
    departamento_id INT,
    cargo_id INT,
    nivel_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id),
    FOREIGN KEY (cargo_id) REFERENCES Cargos(cargo_id),
    FOREIGN KEY (nivel_id) REFERENCES Niveles(nivel_id)
);

-- Creación de la tabla Proyectos
CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);

-- Creación de la tabla Asignaciones
CREATE TABLE Asignaciones (
    asignacion_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    proyecto_id INT,
    fecha_asignacion DATE,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

-- Creación de la tabla Contratos
CREATE TABLE Contratos (
    contrato_id INT PRIMARY KEY AUTO_INCREMENT,
    proyecto_id INT,
    cliente_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Creación de la tabla Roles
CREATE TABLE Roles (
    rol_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(100)
);

-- Creación de la tabla Empleados_Roles
CREATE TABLE Empleados_Roles (
    empleado_id INT,
    rol_id INT,
    PRIMARY KEY (empleado_id, rol_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (rol_id) REFERENCES Roles(rol_id)
);






--   #################################################333333333

-- Inserción de datos en la tabla Departamentos
INSERT INTO Departamentos (nombre, ubicacion, telefono) VALUES
    ('Tecnología', 'São Paulo', '(11) 555-1234'),
    ('Recursos Humanos', 'Rio de Janeiro', '(21) 555-5678'),
    ('Ventas', 'Brasília', '(61) 555-9012');

-- Inserción de datos en la tabla Cargos
INSERT INTO Cargos (nombre_cargo) VALUES
    ('Consultor'),
    ('Analista'),
    ('Gerente'),
    ('Director'),
    ('CEO');

-- Inserción de datos en la tabla Niveles
INSERT INTO Niveles (nombre_nivel) VALUES
    ('Junior'),
    ('Pleno'),
    ('Senior');

-- Inserción de datos en la tabla Empleados
INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id) VALUES
    ('Juan', 'González', '1990-05-15', '2020-03-01', 1, 1, 2),
    ('María', 'Silva', '1985-08-20', '2018-06-15', 2, 3, 3),
    ('Pedro', 'Santos', '1982-12-10', '2010-01-05', 3, 4, 3);

-- Inserción de datos en la tabla Proyectos
INSERT INTO Proyectos (nombre, descripcion, fecha_inicio, fecha_fin, departamento_id) VALUES
    ('Implementación de Sistema CRM', 'Desarrollo e implementación de un sistema CRM para gestionar relaciones con clientes.', '2023-01-15', '2023-12-31', 1),
    ('Estrategia de Talentos 2023', 'Diseño e implementación de estrategias de talento para el próximo año.', '2022-11-01', '2023-06-30', 2),
    ('Expansión de Mercado', 'Planificación y ejecución de estrategias para la expansión de mercado en nuevas regiones.', '2023-03-01', '2024-02-29', 3);

-- Inserción de datos en la tabla Asignaciones
INSERT INTO Asignaciones (empleado_id, proyecto_id, fecha_asignacion) VALUES
    (1, 1, '2023-01-20'),
    (2, 2, '2022-12-01'),
    (3, 3, '2023-04-15');

-- Inserción de datos en la tabla Clientes
INSERT INTO Clientes (nombre, direccion, telefono) VALUES
    ('Empresa A', 'Av. Paulista 123, São Paulo', '(11) 999-8765'),
    ('Empresa B', 'Av. Rio Branco 456, Rio de Janeiro', '(21) 888-4321'),
    ('Empresa C', 'SCN Quadra 1, Brasília', '(61) 777-5432');

-- Inserción de datos en la tabla Contratos
INSERT INTO Contratos (proyecto_id, cliente_id, fecha_inicio, fecha_fin) VALUES
    (1, 1, '2023-02-01', '2023-12-31'),
    (2, 2, '2022-12-15', '2023-06-30'),
    (3, 3, '2023-05-01', '2024-02-29');

-- Inserción de datos en la tabla Roles
INSERT INTO Roles (nombre_rol) VALUES
    ('Administrador'),
    ('Desarrollador'),
    ('Analista de Negocios');

-- Inserción de datos en la tabla Empleados_Roles
INSERT INTO Empleados_Roles (empleado_id, rol_id) VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 2),
    (3, 3);


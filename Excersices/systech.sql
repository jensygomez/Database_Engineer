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

-- Crear la base de datos
CREATE DATABASE LigaEspanola;

-- Usar la base de datos
USE LigaEspanola;

-- Crear tabla de Presidentes
CREATE TABLE Presidentes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear tabla de Directivos
CREATE TABLE Directivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear tabla de Staff Tecnico
CREATE TABLE StaffTecnico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear tabla de Entrenadores
CREATE TABLE Entrenadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50),
    experiencia INT -- años de experiencia
);

-- Crear tabla de Posiciones
CREATE TABLE Posiciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL -- e.g., Portero, Defensa, Mediocampista, Delantero
);

-- Crear tabla de Equipos
CREATE TABLE Equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presidente_id INT,
    entrenador_id INT,
    FOREIGN KEY (presidente_id) REFERENCES Presidentes(id),
    FOREIGN KEY (entrenador_id) REFERENCES Entrenadores(id)
);

-- Crear tabla de Jugadores
CREATE TABLE Jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50),
    posicion_id INT,
    equipo_id INT,
    FOREIGN KEY (posicion_id) REFERENCES Posiciones(id),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
);

-- Insertar presidente
INSERT INTO Presidentes (nombre, fecha_nacimiento, nacionalidad) VALUES ('Joan Laporta', '1962-06-29', 'Española');

-- Insertar directivos
INSERT INTO Directivos (nombre, cargo, fecha_nacimiento, nacionalidad) VALUES 
('Mateu Alemany', 'Director de Fútbol', '1963-02-24', 'Española'),
('Ramon Planes', 'Secretario Técnico', '1967-09-16', 'Española');

-- Insertar staff técnico
INSERT INTO StaffTecnico (nombre, rol, fecha_nacimiento, nacionalidad) VALUES 
('Xavi Hernández', 'Asistente Técnico', '1980-01-25', 'Española');

-- Insertar entrenador
INSERT INTO Entrenadores (nombre, fecha_nacimiento, nacionalidad, experiencia) VALUES 
('Xavi Hernández', '1980-01-25', 'Española', 5);

-- Insertar posiciones
INSERT INTO Posiciones (nombre) VALUES 
('Portero'), 
('Defensa'), 
('Mediocampista'), 
('Delantero');

-- Insertar equipo FC Barcelona
INSERT INTO Equipos (nombre, presidente_id, entrenador_id) VALUES 
('FC Barcelona', 1, 1);

-- Insertar jugadores
INSERT INTO Jugadores (nombre, fecha_nacimiento, nacionalidad, posicion_id, equipo_id) VALUES 
('Marc-André ter Stegen', '1992-04-30', 'Alemana', 1, 1),
('Gerard Piqué', '1987-02-02', 'Española', 2, 1),
('Sergio Busquets', '1988-07-16', 'Española', 3, 1),
('Lionel Messi', '1987-06-24', 'Argentina', 4, 1);

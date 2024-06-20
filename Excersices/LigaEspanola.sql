-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS LigaEspanola;

USE LigaEspanola;

-- Crear tabla de Presidentes
CREATE TABLE IF NOT EXISTS Presidentes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear tabla de Directivos
CREATE TABLE IF NOT EXISTS Directivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear tabla de Staff Tecnico
CREATE TABLE IF NOT EXISTS StaffTecnico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear tabla de Entrenadores
CREATE TABLE IF NOT EXISTS Entrenadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50),
    experiencia INT -- años de experiencia
);

-- Crear tabla de Posiciones
CREATE TABLE IF NOT EXISTS Posiciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL -- e.g., Portero, Defensa, Mediocampista, Delantero
);

-- Crear tabla de Equipos
CREATE TABLE IF NOT EXISTS Equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presidente_id INT,
    entrenador_id INT,
    FOREIGN KEY (presidente_id) REFERENCES Presidentes(id),
    FOREIGN KEY (entrenador_id) REFERENCES Entrenadores(id)
);

-- Crear tabla de Jugadores
CREATE TABLE IF NOT EXISTS Jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50),
    posicion_id INT,
    equipo_id INT,
    FOREIGN KEY (posicion_id) REFERENCES Posiciones(id),
    FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
);

-- Insertar presidentes
INSERT INTO Presidentes (nombre, fecha_nacimiento, nacionalidad) VALUES 
('Joan Laporta', '1962-06-29', 'Española'),        -- Presidente del FC Barcelona
('Florentino Pérez', '1947-03-08', 'Española'),    -- Presidente del Real Madrid
('Enrique Cerezo', '1948-02-27', 'Española'),      -- Presidente del Atlético de Madrid
('María Rodríguez', '1982-07-10', 'Española'),     -- Presidente del Athletic Club
('Luis Martínez', '1955-11-25', 'Española'),       -- Presidente del Real Betis
('Elena Gómez', '1978-04-30', 'Española'),         -- Presidente del Real Sociedad
('Antonio García', '1965-03-20', 'Española'),      -- Presidente del Getafe CF
('Sandra López', '1970-09-15', 'Española');        -- Presidente del SD Eibar


-- Insertar entrenadores
INSERT INTO Entrenadores (nombre, fecha_nacimiento, nacionalidad, experiencia) VALUES 
('Xavi Hernández', '1980-01-25', 'Española', 5),
('Carlo Ancelotti', '1959-06-10', 'Italiana', 25),
('Diego Simeone', '1970-04-28', 'Argentina', 15),
('Luis García', '1972-04-05', 'Española', 10),
('Julia Martínez', '1981-12-20', 'Española', 8),
('José Ramón Sánchez', '1965-08-15', 'Española', 15),
('Eva Gutiérrez', '1979-06-25', 'Española', 12),
('Manuel Pérez', '1969-03-18', 'Española', 18);

-- Insertar equipos
INSERT INTO Equipos (nombre, presidente_id, entrenador_id) VALUES 
('FC Barcelona', 1, 1),             -- Joan Laporta como presidente
('Real Madrid', 2, 2),              -- Florentino Pérez como presidente
('Atlético de Madrid', 3, 3),       -- Enrique Cerezo como presidente
('Athletic Club', 4, 4),            -- María Rodríguez como presidente
('Real Betis', 5, 5),               -- Luis Martínez como presidente
('Real Sociedad', 6, 6),            -- Elena Gómez como presidente
('Getafe CF', 7, 7),                -- Antonio García como presidente
('SD Eibar', 8, 8);                 -- Sandra López como presidente


-- Insertar directivos
INSERT INTO Directivos (nombre, cargo, fecha_nacimiento, nacionalidad) VALUES 
('Mateu Alemany', 'Director de Fútbol', '1963-02-24', 'Española'),
('Ramon Planes', 'Secretario Técnico', '1967-09-16', 'Española'),
('Emilio Butragueño', 'Director de Relaciones Institucionales', '1963-07-22', 'Española'),
('Miguel Ángel Gil Marín', 'Consejero Delegado', '1963-11-25', 'Española'),
('Carlos Ruiz', 'Vicepresidente Deportivo', '1975-02-12', 'Española'),
('Laura Fernández', 'Directora de Comunicación', '1980-06-18', 'Española'),
('Pedro Sánchez', 'Director Financiero', '1968-11-30', 'Española'),
('Marta Jiménez', 'Directora de Marketing', '1973-09-22', 'Española'),
('Javier Pérez', 'Secretario General', '1971-08-05', 'Española');

-- Insertar staff técnico
INSERT INTO StaffTecnico (nombre, rol, fecha_nacimiento, nacionalidad) VALUES 
('Xavi Hernández', 'Asistente Técnico', '1980-01-25', 'Española'),
('David Bettoni', 'Asistente Técnico', '1971-11-23', 'Francesa'),
('Oscar Ortega', 'Preparador Físico', '1958-03-11', 'Uruguaya'),
('Laura García', 'Fisioterapeuta', '1985-01-08', 'Española'),
('Carlos Martín', 'Analista Táctico', '1983-03-15', 'Española'),
('Andrea Rodríguez', 'Nutricionista', '1987-05-20', 'Española'),
('Juan Pérez', 'Psicólogo Deportivo', '1980-09-10', 'Española'),
('Ana López', 'Entrenadora de Porteros', '1977-11-12', 'Española');



-- Insertar posiciones
INSERT INTO Posiciones (nombre) VALUES 
('Portero'),
('Defensa'),
('Centrocampista'),
('Delantero'),
('Lateral');



-- Insertar jugadores
INSERT INTO Jugadores (nombre, fecha_nacimiento, nacionalidad, posicion_id, equipo_id) VALUES 
    ('Marc-André ter Stegen', '1992-04-30', 'Alemana', 1, 1),      -- FC Barcelona, Portero
    ('Gerard Piqué', '1987-02-02', 'Española', 2, 1),              -- FC Barcelona, Defensa
    ('Sergio Busquets', '1988-07-16', 'Española', 3, 1),           -- FC Barcelona, Centrocampista
    ('Lionel Messi', '1987-06-24', 'Argentina', 4, 1),             -- FC Barcelona, Delantero
    ('Frenkie de Jong', '1997-05-12', 'Holandesa', 3, 1),          -- FC Barcelona, Centrocampista
    ('Antoine Griezmann', '1991-03-21', 'Francesa', 4, 1),         -- FC Barcelona, Delantero
    
    ('Thibaut Courtois', '1992-05-11', 'Belga', 1, 2),             -- Real Madrid, Portero
    ('Sergio Ramos', '1986-03-30', 'Española', 2, 2),              -- Real Madrid, Defensa
    ('Luka Modrić', '1985-09-09', 'Croata', 3, 2),                 -- Real Madrid, Centrocampista
    ('Karim Benzema', '1987-12-19', 'Francesa', 4, 2),             -- Real Madrid, Delantero
    ('Vinícius Júnior', '2000-07-12', 'Brasilera', 4, 2),          -- Real Madrid, Delantero
    ('Éder Militão', '1998-01-18', 'Brasilera', 2, 2),             -- Real Madrid, Defensa
    
    ('Jan Oblak', '1993-01-07', 'Eslovena', 1, 3),                 -- Atlético de Madrid, Portero
    ('Stefan Savić', '1991-01-08', 'Montenegrina', 2, 3),          -- Atlético de Madrid, Defensa
    ('Koke', '1992-01-08', 'Española', 3, 3),                      -- Atlético de Madrid, Centrocampista
    ('Luis Suárez', '1987-01-24', 'Uruguaya', 4, 3),               -- Atlético de Madrid, Delantero
    ('João Félix', '1999-11-10', 'Portuguesa', 4, 3),              -- Atlético de Madrid, Delantero
    ('Saúl Ñíguez', '1994-11-21', 'Española', 3, 3),              -- Atlético de Madrid, Centrocampista
    
    ('Iñaki Williams', '1994-06-15', 'Española', 4, 4),            -- Athletic Club, Delantero
    
    ('Joaquín', '1981-07-21', 'Española', 4, 5),                   -- Real Betis, Delantero
    
    ('David Silva', '1986-01-08', 'Española', 3, 6),               -- Real Sociedad, Centrocampista
    
    ('Ángel Rodríguez', '1987-10-22', 'Española', 4, 7),           -- Getafe CF, Delantero
    
    ('Pape Diop', '1986-09-19', 'Senegalesa', 3, 8);               -- SD Eibar, Centrocampista



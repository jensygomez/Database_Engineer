CREATE DATABASE Systech_DB;

-- Seleccionar la base de datos
USE Systech_DB;

-- Creación de la tabla Ubicaciones
CREATE TABLE Ubicaciones (
    ubicacion_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100)
);

-- Creación de la tabla Departamentos
CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    ubicacion_id INT,
    telefono VARCHAR(20),
    FOREIGN KEY (ubicacion_id) REFERENCES Ubicaciones(ubicacion_id)
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
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id),
    FOREIGN KEY (cargo_id) REFERENCES Cargos(cargo_id),
    FOREIGN KEY (nivel_id) REFERENCES Niveles(nivel_id),
    CONSTRAINT chk_fecha_nacimiento CHECK (fecha_nacimiento < CURDATE())
);

-- Creación de la tabla Proyectos
CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    departamento_id INT,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id),
    CONSTRAINT chk_fechas_proyecto CHECK (fecha_inicio < fecha_fin)
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

-- Índices adicionales
CREATE INDEX idx_empleados_departamento ON Empleados(departamento_id);
CREATE INDEX idx_empleados_cargo ON Empleados(cargo_id);
CREATE INDEX idx_proyectos_departamento ON Proyectos(departamento_id);
CREATE INDEX idx_asignaciones_empleado ON Asignaciones(empleado_id);
CREATE INDEX idx_asignaciones_proyecto ON Asignaciones(proyecto_id);

-- Insertar datos en la tabla Ubicaciones
INSERT INTO Ubicaciones (descripcion) VALUES
('Edificio Principal, Piso 1'),
('Edificio Principal, Piso 2'),
('Edificio Principal, Piso 3'),
('Edificio Principal, Piso 4'),
('Edificio Principal, Piso 5'),
('Edificio Principal, Piso 6');

-- Insertar datos en la tabla Departamentos con la ubicación en un edificio de 6 pisos
INSERT INTO Departamentos (nombre, ubicacion_id, telefono) VALUES
('Recursos Humanos', 1, '555-1001'),
('Finanzas', 1, '555-1002'),
('TI', 2, '555-2001'),
('Marketing', 2, '555-2002'),
('Ventas', 3, '555-3001'),
('Operaciones', 3, '555-3002'),
('Investigación y Desarrollo', 4, '555-4001'),
('Servicio al Cliente', 4, '555-4002'),
('Legal', 5, '555-5001'),
('Compras', 5, '555-5002'),
('Calidad', 6, '555-6001'),
('Administración', 6, '555-6002'),
('Estrategia y Planificación', 6, '555-6003'),
('Comunicación Corporativa', 6, '555-6004');

-- Insertar datos en la tabla Cargos
INSERT INTO Cargos (nombre_cargo) VALUES
('Director General'),
('Director de Recursos Humanos'),
('Director Financiero'),
('Director de Tecnologías de la Información (TI)'),
('Director Comercial'),
('Gerente de Operaciones'),
('Gerente de Marketing'),
('Gerente de Ventas'),
('Gerente de Proyectos'),
('Gerente de Servicio al Cliente'),
('Gerente de Desarrollo de Productos'),
('Gerente Legal'),
('Especialista en Recursos Humanos'),
('Especialista Financiero'),
('Especialista en Tecnologías de la Información'),
('Especialista en Marketing Digital'),
('Especialista en Ventas'),
('Técnico de Soporte IT'),
('Analista de Datos'),
('Asistente Administrativo'),
('Asistente de Marketing'),
('Asistente de Ventas'),
('Auxiliar Administrativo'),
('Auxiliar de Almacén'),
('Recepcionista'),
('Operador de Producción'),
('Auxiliar de Servicio al Cliente'),
('Auxiliar Legal'),
('Auxiliar de Compras'),
('Inspector de Calidad');

-- Insertar datos en la tabla Niveles
INSERT INTO Niveles (nombre_nivel) VALUES
('Junior'),
('Pleno'),
('Senior');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id) VALUES
('Juan', 'González', '1990-05-15', '2020-03-01', 1, 1, 2),
('María', 'Silva', '1985-08-20', '2018-06-15', 2, 3, 3),
('Pedro', 'Santos', '1982-12-10', '2010-01-05', 3, 4, 3),
('Ana', 'Pérez', '1992-03-25', '2019-07-01', 4, 5, 2),
('Carlos', 'Ramírez', '1988-11-13', '2015-09-15', 5, 6, 3),
('Luisa', 'Fernández', '1994-06-18', '2021-04-01', 6, 7, 1);

-- Insertar datos en la tabla Proyectos
INSERT INTO Proyectos (nombre, descripcion, fecha_inicio, fecha_fin, departamento_id) VALUES
('Implementación de Sistema CRM', 'Desarrollo e implementación de un sistema CRM para gestionar relaciones con clientes.', '2023-01-15', '2023-12-31', 1),
('Estrategia de Talentos 2023', 'Diseño e implementación de estrategias de talento para el próximo año.', '2022-11-01', '2023-06-30', 2),
('Expansión de Mercado', 'Planificación y ejecución de estrategias para la expansión de mercado en nuevas regiones.', '2023-03-01', '2024-02-29', 3);

-- Insertar datos en la tabla Asignaciones
INSERT INTO Asignaciones (empleado_id, proyecto_id, fecha_asignacion) VALUES
(1, 1, '2023-01-20'),
(2, 2, '2022-12-01'),
(3, 3, '2023-04-15');

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombre, direccion, telefono) VALUES
('Empresa A', 'Av. Paulista 123, São Paulo', '(11) 999-8765'),
('Empresa B', 'Av. Rio Branco 456, Rio de Janeiro', '(21) 888-4321'),
('Empresa C', 'SCN Quadra 1, Brasília', '(61) 777-5432');

-- Insertar datos en la tabla Contratos
INSERT INTO Contratos (proyecto_id, cliente_id, fecha_inicio, fecha_fin) VALUES
(1, 1, '2023-02-01', '2023-12-31'),
(2, 2, '2022-12-15', '2023-06-30'),
(3, 3, '2023-05-01', '2024-02-29');

-- Insertar datos en la tabla Roles
INSERT INTO Roles (nombre_rol) VALUES
('Administrador'),
('Desarrollador'),
('Analista de Negocios');

-- Insertar datos en la tabla Empleados_Roles
INSERT INTO Empleados_Roles (empleado_id, rol_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(3, 3);

-- Trigger para actualizar la fecha de actualización automáticamente
CREATE TRIGGER before_update_empleados
BEFORE UPDATE ON Empleados
FOR EACH ROW
SET NEW.actualizado_en = CURRENT_TIMESTAMP;

-- Crear un usuario con permisos de solo lectura
CREATE USER 'lector'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT ON Systech_DB.* TO 'lector'@'localhost';

-- Generar 100 empleados con nombres ficticios brasileños (nombre compuesto por dos nombres y un apellido)
-- Debe ejecutarse como un bloque de código en MySQL (por ejemplo, en un procedimiento almacenado)
DELIMITER //

CREATE PROCEDURE generar_empleados_ficticios()
BEGIN
    DECLARE num INT DEFAULT 0;
    DECLARE nombre1 VARCHAR(50);
    DECLARE nombre2 VARCHAR(50);
    DECLARE apellido VARCHAR(50);
    DECLARE fecha_nacimiento DATE;
    DECLARE fecha_contratacion DATE;
    DECLARE departamento_id INT;
    DECLARE cargo_id INT;
    DECLARE nivel_id INT;

    -- Lista de nombres y apellidos ficticios brasileños
    DECLARE nombres CURSOR FOR 
    SELECT nombre1, nombre2, apellido FROM (
        SELECT 'Adriana' AS nombre1, 'Roberta' AS nombre2, 'Silva' AS apellido UNION ALL
        SELECT 'Alexandre', 'Ricardo', 'Santos' UNION ALL
        SELECT 'Aline', 'Luciana', 'Oliveira' UNION ALL
        SELECT 'André', 'Paulo', 'Souza' UNION ALL
        SELECT 'Beatriz', 'Carla', 'Pereira' UNION ALL
        SELECT 'Bruno', 'Marcos', 'Rodrigues' UNION ALL
        SELECT 'Camila', 'Fernanda', 'Almeida' UNION ALL
        SELECT 'Carlos', 'Eduardo', 'Nascimento' UNION ALL
        SELECT 'Carolina', 'Gabriela', 'Lima' UNION ALL
        SELECT 'Cristiane', 'Silvana', 'Araújo' UNION ALL
        SELECT 'Daniel', 'Rodrigo', 'Ferreira' UNION ALL
        SELECT 'Débora', 'Mariana', 'Gomes' UNION ALL
        SELECT 'Diego', 'Felipe', 'Carvalho' UNION ALL
        SELECT 'Eduardo', 'Vinícius', 'Martins' UNION ALL
        SELECT 'Fabiana', 'Renata', 'Rocha' UNION ALL
        SELECT 'Felipe', 'Gustavo', 'Ribeiro' UNION ALL
        SELECT 'Fernanda', 'Patrícia', 'Barbosa' UNION ALL
        SELECT 'Fernando', 'Rafael', 'Melo' UNION ALL
        SELECT 'Flávia', 'Larissa', 'Costa' UNION ALL
        SELECT 'Gabriel', 'Leonardo', 'Pinto' UNION ALL
        SELECT 'Giovanna', 'Ana', 'Castro' UNION ALL
        SELECT 'Gustavo', 'Tiago', 'Monteiro' UNION ALL
        SELECT 'Isabela', 'Joana', 'Dias' UNION ALL
        SELECT 'João', 'Pedro', 'Cavalcanti' UNION ALL
        SELECT 'Juliana', 'Maria', 'Cardoso' UNION ALL
        SELECT 'Leonardo', 'Guilherme', 'Correia' UNION ALL
        SELECT 'Letícia', 'Caroline', 'Mendes' UNION ALL
        SELECT 'Lucas', 'Gabriel', 'Moura' UNION ALL
        SELECT 'Luisa', 'Patrícia', 'Barros' UNION ALL
        SELECT 'Marcelo', 'Antônio', 'Bezerra' UNION ALL
        SELECT 'Mariana', 'Silva', 'Cruz' UNION ALL
        SELECT 'Mário', 'Luiz', 'Borges' UNION ALL
        SELECT 'Natália', 'Carolina', 'Batista' UNION ALL
        SELECT 'Paulo', 'Sérgio', 'Fernandes' UNION ALL
        SELECT 'Priscila', 'Camila', 'Sousa' UNION ALL
        SELECT 'Rafael', 'Freitas', 'Silva' UNION ALL
        SELECT 'Renata', 'Bianca', 'Machado' UNION ALL
        SELECT 'Rodrigo', 'Fernando', 'Brito' UNION ALL
        SELECT 'Sabrina', 'Carla', 'Moreira' UNION ALL
        SELECT 'Samuel', 'Eduardo', 'Lopes' UNION ALL
        SELECT 'Sandra', 'Aparecida', 'Nunes' UNION ALL
        SELECT 'Thiago', 'Henrique', 'Lima' UNION ALL
        SELECT 'Valéria', 'Cristina', 'Azevedo' UNION ALL
        SELECT 'Vinícius', 'José', 'Silva' UNION ALL
        SELECT 'Viviane', 'Patrícia', 'Santos'
    ) nombres_temp;

    OPEN nombres;

    WHILE num < 100 DO
        -- Obtener datos aleatorios de la lista
        FETCH nombres INTO nombre1, nombre2, apellido;
        SET fecha_nacimiento = DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 40 + 20) YEAR); -- Entre 20 y 59 años
        SET fecha_contratacion = DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 10) YEAR); -- Entre 0 y 9 años de antigüedad
        SET departamento_id = FLOOR(RAND() * 14) + 1; -- Números entre 1 y 14 (cantidad de departamentos)
        SET cargo_id = FLOOR(RAND() * 30) + 1; -- Números entre 1 y 30 (cantidad de cargos)
        SET nivel_id = FLOOR(RAND() * 3) + 1; -- Números entre 1 y 3 (cantidad de niveles)

        -- Insertar el empleado generado en la tabla
        INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id)
        VALUES (CONCAT(nombre1, ' ', nombre2), apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id);

        -- Incrementar el contador
        SET num = num + 1;
    END WHILE;

    CLOSE nombres;
END //

DELIMITER ;

-- Llamar al procedimiento para generar los empleados ficticios
CALL generar_empleados_ficticios();


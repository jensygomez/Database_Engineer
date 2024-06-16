
-- Generar 100 empleados con nombres ficticios brasileños (nombre compuesto por dos nombres y un apellido)

SET @num := 0;

-- Lista de nombres y apellidos ficticios brasileños
DECLARE nombres TABLE (nombre1 VARCHAR(50), nombre2 VARCHAR(50), apellido VARCHAR(50));

INSERT INTO nombres (nombre1, nombre2, apellido) VALUES
('Adriana', 'Roberta', 'Silva'), ('Alexandre', 'Ricardo', 'Santos'), ('Aline', 'Luciana', 'Oliveira'), 
('André', 'Paulo', 'Souza'), ('Beatriz', 'Carla', 'Pereira'), ('Bruno', 'Marcos', 'Rodrigues'), 
('Camila', 'Fernanda', 'Almeida'), ('Carlos', 'Eduardo', 'Nascimento'), ('Carolina', 'Gabriela', 'Lima'), 
('Cristiane', 'Silvana', 'Araújo'), ('Daniel', 'Rodrigo', 'Ferreira'), ('Débora', 'Mariana', 'Gomes'), 
('Diego', 'Felipe', 'Carvalho'), ('Eduardo', 'Vinícius', 'Martins'), ('Fabiana', 'Renata', 'Rocha'), 
('Felipe', 'Gustavo', 'Ribeiro'), ('Fernanda', 'Patrícia', 'Barbosa'), ('Fernando', 'Rafael', 'Melo'), 
('Flávia', 'Larissa', 'Costa'), ('Gabriel', 'Leonardo', 'Pinto'), ('Giovanna', 'Ana', 'Castro'), 
('Gustavo', 'Tiago', 'Monteiro'), ('Isabela', 'Joana', 'Dias'), ('João', 'Pedro', 'Cavalcanti'), 
('Juliana', 'Maria', 'Cardoso'), ('Leonardo', 'Guilherme', 'Correia'), ('Letícia', 'Caroline', 'Mendes'), 
('Lucas', 'Gabriel', 'Moura'), ('Luisa', 'Patrícia', 'Barros'), ('Marcelo', 'Antônio', 'Bezerra'), 
('Mariana', 'Silva', 'Cruz'), ('Mário', 'Luiz', 'Borges'), ('Natália', 'Carolina', 'Batista'), 
('Paulo', 'Sérgio', 'Fernandes'), ('Priscila', 'Camila', 'Sousa'), ('Rafael', 'Freitas', 'Silva'), 
('Renata', 'Bianca', 'Machado'), ('Rodrigo', 'Fernando', 'Brito'), ('Sabrina', 'Carla', 'Moreira'), 
('Samuel', 'Eduardo', 'Lopes'), ('Sandra', 'Aparecida', 'Nunes'), ('Thiago', 'Henrique', 'Lima'), 
('Valéria', 'Cristina', 'Azevedo'), ('Vinícius', 'José', 'Silva'), ('Viviane', 'Patrícia', 'Santos');

-- Crear un loop para insertar 100 empleados
WHILE @num < 100 DO
    -- Generar datos aleatorios
    SET @nombre1 := (SELECT nombre1 FROM nombres ORDER BY RAND() LIMIT 1);
    SET @nombre2 := (SELECT nombre2 FROM nombres ORDER BY RAND() LIMIT 1);
    SET @apellido := (SELECT apellido FROM nombres ORDER BY RAND() LIMIT 1);
    SET @fecha_nacimiento := DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 40 + 20) YEAR); -- Entre 20 y 59 años
    SET @fecha_contratacion := DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 10) YEAR); -- Entre 0 y 9 años de antigüedad

    -- Seleccionar aleatoriamente un departamento, cargo y nivel
    SET @departamento_id := FLOOR(RAND() * 13) + 1; -- Números entre 1 y 13 (cantidad de departamentos)
    SET @cargo_id := FLOOR(RAND() * 29) + 1; -- Números entre 1 y 29 (cantidad de cargos)
    SET @nivel_id := FLOOR(RAND() * 3) + 1; -- Números entre 1 y 3 (cantidad de niveles)

    -- Insertar el empleado generado en la tabla
    INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id)
    VALUES (CONCAT(@nombre1, ' ', @nombre2), @apellido, @fecha_nacimiento, @fecha_contratacion, @departamento_id, @cargo_id, @nivel_id);

    -- Incrementar el contador
    SET @num := @num + 1;
END WHILE;

CREATE DATABASE SalesDB;

-- Seleccionar la base de datos
USE SalesDB;

-- Crear la tabla de condados
CREATE TABLE Counties (
    CountyID INT PRIMARY KEY,
    CountyName VARCHAR(100)
);

-- Insertar datos de condados
INSERT INTO Counties (CountyID, CountyName) VALUES
(1, 'County A'),
(2, 'County B'),
(3, 'County C'),
(4, 'County D');

-- Crear la tabla de empleados
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    JobTitle VARCHAR(100),
    CountyID INT,
    LineManagerID INT,
    FOREIGN KEY (CountyID) REFERENCES Counties(CountyID)
);

-- Insertar datos de empleados
INSERT INTO Employees (EmployeeID, FullName, JobTitle, CountyID, LineManagerID) VALUES
(1, 'Simon', 'Manager', 1, NULL),
(2, 'Seamus', 'Assistant Manager', 1, 1),
(3, 'Greta', 'Senior Developer', 2, 1),
(4, 'Liam', 'Developer', 2, 2),
(5, 'Emma', 'Junior Developer', 3, 2),
(6, 'Ava', 'Intern', 4, 3);

-- Crear la tabla de clientes
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    FullName VARCHAR(100),
    ContactNumber VARCHAR(30),
    Address VARCHAR(255)
);

-- Insertar datos de clientes
INSERT INTO Clients (ClientID, FullName, ContactNumber, Address) VALUES
(1, 'Ana Maria Silva', '+55 11 91234-5678', 'Rua das Flores, 123, São Paulo, SP'),
(2, 'Carlos Eduardo Souza', '+55 21 98765-4321', 'Avenida Brasil, 456, Rio de Janeiro, RJ'),
(3, 'Mariana Oliveira', '+55 31 99876-5432', 'Rua da Harmonia, 789, Belo Horizonte, MG'),
(4, 'Pedro Henrique Lima', '+55 51 97654-3210', 'Praça da Liberdade, 101, Porto Alegre, RS'),
(5, 'Juliana Costa', '+55 71 93456-7890', 'Avenida Sete de Setembro, 202, Salvador, BA'),
(6, 'Roberto da Silva', '+55 11 91234-5679', 'Avenida Paulista, 500, São Paulo, SP'),
(7, 'Fernanda Silva Costa', '+55 21 98765-4322', 'Rua das Laranjeiras, 150, Rio de Janeiro, RJ');

-- Crear la tabla de productos
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Insertar datos de productos
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(101, 'Producto A', 75.00),
(102, 'Producto B', 75.50),
(103, 'Producto C', 60.00),
(104, 'Producto D', 40.00),
(105, 'Producto E', 100.00),
(106, 'Producto F', 50.00),
(107, 'Producto G', 55.00),
(108, 'Producto H', 65.00);

-- Crear la tabla de pedidos
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    ProductID INT,
    Quantity INT,
    Cost DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insertar datos de pedidos
INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, EmployeeID) VALUES
(1, 1, 101, 2, 150.00, 2),
(2, 2, 102, 1, 75.50, 3),
(3, 3, 103, 5, 300.00, 4),
(4, 4, 104, 3, 120.00, 5),
(5, 5, 105, 2, 200.00, 6),
(6, 1, 106, 1, 50.00, 2),
(7, 3, 107, 4, 220.00, 3),
(8, 2, 108, 2, 130.00, 4);

-- Criação do banco de dados
CREATE DATABASE EcommerceDB;

-- Seleciona o banco de dados
USE EcommerceDB;

-- Tabela de Usuários
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Produtos
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Pedidos
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Tabela de Itens do Pedido
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



-- Inserir um novo usuário
INSERT INTO Users (Name, Email, PasswordHash) 
VALUES ('John Doe', 'john.doe@example.com', 'hashed_password');


--Adicionar um novo produto
INSERT INTO Products (Name, Description, Price, Stock) 
VALUES ('Notebook', 'Notebook de última geração', 3500.00, 20);


--Criar um pedido
INSERT INTO Orders (UserID, TotalAmount) 
VALUES (1, 7000.00);


--Adicionar um item ao pedido
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) 
VALUES (1, 1, 2, 3500.00);

-- Buscar produtos disponíveis
SELECT * FROM Products WHERE Stock > 0;

-- Buscar pedidos de um usuário
SELECT * FROM Orders WHERE UserID = 1;


-- Buscar itens de um pedido
SELECT OI.OrderItemID, P.Name, OI.Quantity, OI.Price
FROM OrderItems OI
JOIN Products P ON OI.ProductID = P.ProductID
WHERE OI.OrderID = 1;


-- Atualizar o estoque
UPDATE Products 
SET Stock = Stock - 2
WHERE ProductID = 1;


-- Calcular o total de vendas
SELECT SUM(TotalAmount) AS TotalVendas FROM Orders;

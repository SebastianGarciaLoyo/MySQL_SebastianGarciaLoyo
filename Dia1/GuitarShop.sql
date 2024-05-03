/********************************************************
* This script creates the database named my_guitar_shop 
Last updated 4/23/2015 by John Bodden
*********************************************************/

--     Added 4/23/2014
--  this section closes all existing connections to MyGuitarShop database 
---and drops the database

USE [master]
GO
ALTER DATABASE myguitarshop SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [MyGuitarShop]
GO
USE master;
GO

--section commented out 4/23/2014  not needed
--IF  DB_ID('MyGuitarShop') IS NOT NULL
--DROP DATABASE MyGuitarShop;
--GO

CREATE DATABASE MyGuitarShop;
GO

USE MyGuitarShop;

-- create the tables for the database
CREATE TABLE Categories (
  CategoryID        INT            PRIMARY KEY   ,
  CategoryName      VARCHAR(255)   NOT NULL      UNIQUE
);

CREATE TABLE Products (
  ProductID         INT            PRIMARY KEY   ,
  CategoryID        INT            , 
  ProductCode       VARCHAR(10)    NOT NULL      UNIQUE,
  ProductName       VARCHAR(255)   NOT NULL,
  Description       TEXT           NOT NULL,
  ListPrice         FLOAT          NOT NULL,
  DiscountPercent   FLOAT          NOT NULL      DEFAULT 0.00,
  DateAdded         DATETIME                     DEFAULT NULL,
  FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY   ,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,
  ShippingAddressID    INT                          DEFAULT NULL,
  BillingAddressID     INT                          DEFAULT NULL
);

CREATE TABLE Addresses (
  AddressID          INT            PRIMARY KEY   ,
  CustomerID         INT            ,
  Line1              VARCHAR(60)    NOT NULL,
  Line2              VARCHAR(60)                  DEFAULT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,
  Disabled           INT            NOT NULL      DEFAULT 0,
  FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Orders (
  OrderID           INT            PRIMARY KEY  ,
  CustomerID        INT            				,
  OrderDate         DATETIME       NOT NULL,
  ShipAmount        FLOAT          NOT NULL,
  TaxAmount         FLOAT          NOT NULL,
  ShipDate          DATETIME                    DEFAULT NULL,
  ShipAddressID     INT            NOT NULL,
  CardType          VARCHAR(50)    NOT NULL,
  CardNumber        CHAR(16)       NOT NULL,
  CardExpires       CHAR(7)        NOT NULL,
  BillingAddressID  INT            NOT NULL,
  FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
  ItemID             INT            ,
  OrderID            INT            ,
  ProductID          INT        	,
  ItemPrice          FLOAT  NOT NULL,
  DiscountAmount     FLOAT  NOT NULL,
  Quantity           INT            NOT NULL,
  FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
  Primary key(OrderId,ProductID)    
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY   ,
  EmailAddress      VARCHAR(255)   NOT NULL,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);

select * from Categories;
select * from Customers;
select * from Administrators;
select * from OrderItems;
select * from Orders;
select * from Products;
select * from Addresses;

-- Insert data into the tables

SET IDENTITY_INSERT Categories ON;

-- Datos de ejemplo para la tabla Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Guitarras eléctricas'),
(2, 'Guitarras acústicas'),
(3, 'Amplificadores'),
(4, 'Pedales de efectos'),
(5, 'Accesorios'),
(6, 'Bajos eléctricos'),
(7, 'Baterías'),
(8, 'Teclados'),
(9, 'Micrófonos'),
(10, 'Cables');

-- Datos de ejemplo para la tabla Products
INSERT INTO Products (ProductID, CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded) VALUES
(1, 1, 'ELECGT001', 'Guitarra eléctrica Fender Stratocaster', 'Guitarra eléctrica clásica con sonido potente y versátil.', 899.99, 0.05, '2024-04-30'),
(2, 1, 'ELECGT002', 'Guitarra eléctrica Gibson Les Paul', 'Guitarra eléctrica icónica con un sonido cálido y potente.', 1099.99, 0.05, '2024-04-30'),
(3, 2, 'ACOGT001', 'Guitarra acústica Yamaha FG800', 'Guitarra acústica de alta calidad con un sonido claro y brillante.', 299.99, 0.05, '2024-04-30'),
(4, 3, 'AMP001', 'Amplificador Fender Champion 40', 'Amplificador versátil con excelentes tonos limpios y distorsionados.', 199.99, 0.05, '2024-04-30'),
(5, 4, 'PEDAL001', 'Pedal de efectos Boss DS-1', 'Pedal de distorsión clásico utilizado por músicos de todo el mundo.', 49.99, 0.05, '2024-04-30'),
(6, 5, 'ACC001', 'Correa para guitarra', 'Correa de cuero ajustable para guitarra.', 19.99, 0.05, '2024-04-30'),
(7, 6, 'BAS001', 'Bajo eléctrico Ibanez SR300', 'Bajo eléctrico de 4 cuerdas con un sonido potente y versátil.', 399.99, 0.05, '2024-04-30'),
(8, 7, 'BAT001', 'Batería Pearl Export Series', 'Kit de batería completo con platillos y hardware incluidos.', 899.99, 0.05, '2024-04-30'),
(9, 8, 'TEC001', 'Teclado Yamaha PSR-E363', 'Teclado portátil con una amplia variedad de sonidos y funciones.', 299.99, 0.05, '2024-04-30'),
(10, 9, 'MIC001', 'Micrófono Shure SM58', 'Micrófono dinámico de mano con una calidad de sonido excepcional.', 99.99, 0.05, '2024-04-30');

-- Datos de ejemplo para la tabla Customers
INSERT INTO Customers (CustomerID, EmailAddress, Password, FirstName, LastName) VALUES
(1, 'cliente1@example.com', 'contraseña123', 'Juan', 'Pérez'),
(2, 'cliente2@example.com', 'abcde12345', 'María', 'González'),
(3, 'cliente3@example.com', 'qwerty67890', 'Carlos', 'Martínez'),
(4, 'cliente4@example.com', 'password123', 'Laura', 'López'),
(5, 'cliente5@example.com', 'securepassword', 'Pedro', 'Ramírez'),
(6, 'cliente6@example.com', 'mypassword', 'Ana', 'Sánchez'),
(7, 'cliente7@example.com', 'password1234', 'Miguel', 'Fernández'),
(8, 'cliente8@example.com', 'password12345', 'Sofía', 'Martínez'),
(9, 'cliente9@example.com', 'qwerty123', 'Elena', 'Gómez'),
(10, 'cliente10@example.com', 'abcde67890', 'Diego', 'Díaz');

-- Datos de ejemplo para la tabla Addresses
INSERT INTO Addresses (AddressID, CustomerID, Line1, City, State, ZipCode, Phone) VALUES
(1, 1, 'Calle Principal 123', 'Ciudad de Ejemplo', 'EX', '12345', '555-123-4567'),
(2, 2, 'Avenida Central 456', 'Otra Ciudad', 'OC', '54321', '555-987-6543'),
(3, 3, 'Calle Secundaria 789', 'Ciudad Alternativa', 'CA', '67890', '555-321-7890'),
(4, 4, 'Calle Uno 1', 'Ciudad Uno', 'CU', '11111', '555-111-1111'),
(5, 5, 'Avenida Dos 2', 'Ciudad Dos', 'CD', '22222', '555-222-2222'),
(6, 6, 'Calle Tres 3', 'Ciudad Tres', 'CT', '33333', '555-333-3333'),
(7, 7, 'Calle Cuatro 4', 'Ciudad Cuatro', 'CC', '44444', '555-444-4444'),
(8, 8, 'Avenida Cinco 5', 'Ciudad Cinco', 'CI', '55555', '555-555-5555'),
(9, 9, 'Calle Seis 6', 'Ciudad Seis', 'CS', '66666', '555-666-6666'),
(10, 10, 'Avenida Siete 7', 'Ciudad Siete', 'CS', '77777', '555-777-7777');

-- Datos de ejemplo para la tabla Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipAmount, TaxAmount, ShipAddressID, CardType, CardNumber, CardExpires, BillingAddressID) VALUES
(1, 1, '2024-04-30', 10.00, 5.00, 1, 'Visa', '1234567890123456', '04/26', 1),
(2, 2, '2024-04-30', 8.00, 4.00, 2, 'MasterCard', '9876543210987654', '06/27', 2),
(3, 3, '2024-04-30', 12.00, 6.00, 3, 'American Express', '2468135791357246', '08/28', 3),
(4, 4, '2024-04-30', 15.00, 7.50, 4, 'Visa', '1357924680246813', '10/29', 4),
(5, 5, '2024-04-30', 11.00, 5.50, 5, 'MasterCard', '8642097531806429', '12/30', 5),
(6, 6, '2024-04-30', 9.00, 4.50, 6, 'American Express', '9753108642097531', '02/31', 6),
(7, 7, '2024-04-30', 13.00, 6.50, 7, 'Visa', '0246813579246801', '04/32', 7),
(8, 8, '2024-04-30', 10.00, 5.00, 8, 'MasterCard', '7531806429753108', '06/33', 8),
(9, 9, '2024-04-30', 14.00, 7.00, 9, 'American Express', '2468135791357246', '08/34', 9),
(10, 10, '2024-04-30', 16.00, 8.00, 10, 'Visa', '1234567890123456', '10/35', 10);

-- Datos de ejemplo para la tabla OrderItems
INSERT INTO OrderItems (ItemID, OrderID, ProductID, ItemPrice, DiscountAmount, Quantity) VALUES
(1, 1, 1, 899.99, 0.00, 1),
(2, 2, 3, 299.99, 0.00, 1),
(3, 3, 5, 49.99, 0.00, 2),
(4, 4, 7, 399.99, 0.00, 1),
(5, 5, 9, 99.99, 0.00, 1),
(6, 6, 2, 1099.99, 0.00, 1),
(7, 7, 4, 199.99, 0.00, 1),
(8, 8, 6, 399.99, 0.00, 1),
(9, 9, 8, 299.99, 0.00, 1),
(10, 10, 10, 14.99, 0.00, 3);

-- Datos de ejemplo para la tabla Administrators
INSERT INTO Administrators (AdminID, EmailAddress, Password, FirstName, LastName) VALUES
(1, 'admin1@example.com', 'admin123', 'Admin', 'Uno'),
(2, 'admin2@example.com', 'admin456', 'Admin', 'Dos'),
(3, 'admin3@example.com', 'admin789', 'Admin', 'Tres'),
(4, 'admin4@example.com', 'admin101112', 'Admin', 'Cuatro'),
(5, 'admin5@example.com', 'admin131415', 'Admin', 'Cinco'),
(6, 'admin6@example.com', 'admin161718', 'Admin', 'Seis'),
(7, 'admin7@example.com', 'admin192021', 'Admin', 'Siete'),
(8, 'admin8@example.com', 'admin222324', 'Admin', 'Ocho'),
(9, 'admin9@example.com', 'admin252627', 'Admin', 'Nueve'),
(10, 'admin10@example.com', 'admin282930', 'Admin', 'Diez');


SET IDENTITY_INSERT Administrators OFF;

--Create a user named MGSUser

/*
GRANT SELECT, INSERT, UPDATE, DELETE
ON *
TO MGSUser@localhost
IDENTIFIED BY 'pa55word';
*/
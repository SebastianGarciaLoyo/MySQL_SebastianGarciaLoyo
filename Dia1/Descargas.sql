CREATE DATABASE information;

use information;

select * from User;

select * from Download;

select * from Product;

select * from User_Download;

select * from Download_Product;

CREATE TABLE User(
    UserID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    EmailAddress VARCHAR(255) NOT NULL
);

CREATE TABLE Download(
    DownloadID INT PRIMARY KEY NOT NULL,
    FileName VARCHAR(100) NOT NULL,
    DownloadTime DATETIME NOT NULL
);

CREATE TABLE Product(
    ProductID INT PRIMARY KEY NOT NULL,
    ProductName VARCHAR(100) NOT NULL
);

CREATE TABLE User_Download(
    UserID INT NOT NULL,
    DownloadID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (DownloadID) REFERENCES Download(DownloadID)
);

CREATE TABLE Download_Product(
    DownloadID INT NOT NULL,
    ProductID INT NOT NULL,
    FOREIGN KEY (DownloadID) REFERENCES Download(DownloadID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Insertando datos aleatorios en la tabla User
INSERT INTO User (UserID, FirstName, LastName, EmailAddress) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com'),
(4, 'Emily', 'Brown', 'emily.brown@example.com'),
(5, 'David', 'Williams', 'david.williams@example.com'),
(6, 'Sarah', 'Jones', 'sarah.jones@example.com'),
(7, 'Christopher', 'Garcia', 'christopher.garcia@example.com'),
(8, 'Jessica', 'Martinez', 'jessica.martinez@example.com'),
(9, 'Daniel', 'Hernandez', 'daniel.hernandez@example.com'),
(10, 'Ashley', 'Young', 'ashley.young@example.com');

-- Insertando datos aleatorios en la tabla Download
INSERT INTO Download (DownloadID, FileName, DownloadTime) VALUES
(1, 'Document1.pdf', '2024-05-01 08:00:00'),
(2, 'Document2.docx', '2024-05-01 09:00:00'),
(3, 'Presentation1.pptx', '2024-05-01 10:00:00'),
(4, 'Spreadsheet1.xlsx', '2024-05-01 11:00:00'),
(5, 'Image1.jpg', '2024-05-01 12:00:00'),
(6, 'Document3.pdf', '2024-05-01 13:00:00'),
(7, 'Document4.docx', '2024-05-01 14:00:00'),
(8, 'Presentation2.pptx', '2024-05-01 15:00:00'),
(9, 'Spreadsheet2.xlsx', '2024-05-01 16:00:00'),
(10, 'Image2.jpg', '2024-05-01 17:00:00');

-- Insertando datos aleatorios en la tabla Product
INSERT INTO Product (ProductID, ProductName) VALUES
(1, 'Product A'),
(2, 'Product B'),
(3, 'Product C'),
(4, 'Product D'),
(5, 'Product E'),
(6, 'Product F'),
(7, 'Product G'),
(8, 'Product H'),
(9, 'Product I'),
(10, 'Product J');

-- Insertando datos aleatorios en la tabla User_Download
INSERT INTO User_Download (UserID, DownloadID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertando datos aleatorios en la tabla Download_Product
INSERT INTO Download_Product (DownloadID, ProductID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
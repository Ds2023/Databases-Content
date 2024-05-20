-- Aggregations, Groupby, Summary
CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ProductID)
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    PRIMARY KEY (SaleID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Insert data into Customers
INSERT INTO Customers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Michael', 'Brown', 'michael.brown@example.com');

-- Insert data into Products
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Tablet', 300.00);

-- Insert data into Sales
INSERT INTO Sales (CustomerID, ProductID, SaleDate, Quantity) VALUES
(1, 1, '2024-05-01', 1),
(1, 2, '2024-05-03', 2),
(2, 1, '2024-05-04', 1),
(2, 3, '2024-05-05', 1),
(3, 2, '2024-05-06', 3),
(3, 3, '2024-05-07', 2);

SELECT AVG(Quantity) AS AverageQuantity
FROM Sales;

SELECT COUNT(*) AS NumberOfSales
FROM Sales;

SELECT MAX(Quantity) AS MaxQuantity
FROM Sales;

SELECT MIN(Quantity) AS MinQuantity
FROM Sales;

SELECT SUM(Quantity * Price) AS TotalSalesAmount
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID;
-- select Sales.Quantity, Products.Price,(Sales.Quantity * Products.Price) as Tot_Sales
-- from Sales
-- join Products on Sales.ProductID = Products.ProductID;


select * from Customers;
select * from Sales;
select * from Products;

-- Groupby
-- 1. Total Sales Amount by Customer
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Quantity * Price) AS TotalSalesAmount
FROM Sales
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

-- Total Sales Quantity by Product
SELECT Products.ProductID, Products.ProductName, SUM(Quantity) AS TotalQuantitySold
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.ProductID, Products.ProductName;

-- Avg Sales Quantity by Customer
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, AVG(Quantity) AS AverageQuantity
FROM Sales
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

-- Having Clause
-- 1. Customers with Total Sales Amount Greater Than $1500
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(Quantity * Price) AS TotalSalesAmount
FROM Sales
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
HAVING TotalSalesAmount > 1500;


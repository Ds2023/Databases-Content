-- Create database
CREATE DATABASE SalesDB;
USE SalesDB;

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    SaleDate DATE
);

-- Insert data into Sales table
INSERT INTO Sales (SaleID, ProductName, Quantity, UnitPrice, SaleDate) VALUES
(1, 'Product A', 10, 50.00, '2024-05-01'),
(2, 'Product B', 20, 30.00, '2024-05-02'),
(3, 'Product C', 15, 40.00, '2024-05-03'),
(4, 'Product A', 12, 55.00, '2024-05-04'),
(5, 'Product B', 18, 28.00, '2024-05-05');

-- Create stored procedure
DELIMITER //
CREATE PROCEDURE CalculateTotalSales (IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT SUM(Quantity * UnitPrice) AS TotalSales
    FROM Sales
    WHERE SaleDate BETWEEN startDate AND endDate;
END //
DELIMITER ;

-- Create view
CREATE VIEW SalesWithTotalRevenue AS
SELECT
    SaleID,
    ProductName,
    Quantity,
    UnitPrice,
    SaleDate,
    Quantity * UnitPrice AS TotalRevenue
FROM
    Sales;

-- Execute stored procedure
CALL CalculateTotalSales('2024-05-01', '2024-05-05');

-- Query view
SELECT * FROM SalesWithTotalRevenue;


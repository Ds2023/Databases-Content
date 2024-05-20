-- Create database
CREATE DATABASE DataScienceDB;
USE DataScienceDB;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    ManagerID INT
);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, ManagerID) VALUES
(1, 'John', 'Doe', 1, NULL),
(2, 'Jane', 'Smith', 2, 1),
(3, 'Sam', 'Brown', 3, 1),
(4, 'Lisa', 'Ray', 2, 2),
(5, 'Mark', 'Green', 3, 1);

-- Query with CASE statement to translate DepartmentID to DepartmentName
SELECT
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    CASE
        WHEN DepartmentID = 1 THEN 'HR'
        WHEN DepartmentID = 2 THEN 'IT'
        WHEN DepartmentID = 3 THEN 'Sales'
        ELSE 'Unknown'
    END AS DepartmentName
FROM
    Employees;

-- Query with CASE statement to categorize employees by manager status
SELECT
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    CASE
        WHEN ManagerID IS NULL THEN 'No Manager'
        ELSE 'Has Manager'
    END AS ManagerStatus
FROM
    Employees;
    
    
-- Create database
CREATE DATABASE DataScienceDB;
USE DataScienceDB;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2)
);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, ManagerID, Salary) VALUES
(1, 'John', 'Doe', 1, NULL, 80000.00),
(2, 'Jane', 'Smith', 2, 1, 90000.00),
(3, 'Sam', 'Brown', 3, 1, 70000.00),
(4, 'Lisa', 'Ray', 2, 2, 85000.00),
(5, 'Mark', 'Green', 3, 1, 75000.00);

-- Subquery in SELECT clause
SELECT 
    FirstName,
    LastName,
    Salary,
    (SELECT AVG(Salary) FROM Employees) AS AverageSalary
FROM 
    Employees;

-- Subquery in WHERE clause
SELECT 
    FirstName,
    LastName,
    Salary
FROM 
    Employees
WHERE 
    Salary > (SELECT AVG(Salary) FROM Employees);

-- Subquery in FROM clause
SELECT 
    DepartmentID,
    TotalSalary
FROM 
    (SELECT 
         DepartmentID, 
         SUM(Salary) AS TotalSalary
     FROM 
         Employees
     GROUP BY 
         DepartmentID) AS DepartmentSalaries;


-- Create the database
CREATE DATABASE company_db;

-- Use the database
USE company_db;

-- Create the departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2),
    status VARCHAR(10) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert data into departments
INSERT INTO departments (department_name) VALUES
('Engineering'),
('Marketing'),
('Sales'),
('HR');

-- Insert data into employees
INSERT INTO employees (name, department_id, salary, status) VALUES
('Alice', 1, 60000.00, 'active'),
('Bob', 1, 70000.00, 'inactive'),
('Charlie', 2, 50000.00, 'active'),
('David', 3, 45000.00, 'active'),
('Eva', 4, 55000.00, 'inactive');

CREATE VIEW active_employees AS
SELECT e.employee_id, e.name, d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.status = 'active';

CREATE VIEW high_salary_employees AS
SELECT e.employee_id, e.name, d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 50000;

SELECT * FROM active_employees;
SELECT * FROM high_salary_employees;

-- Update Bob's status to active
UPDATE employees
SET status = 'active'
WHERE name = 'Bob';

SELECT * FROM active_employees;

-- Update Charlie's salary
UPDATE employees
SET salary = 55000.00
WHERE name = 'Charlie';

SELECT * FROM high_salary_employees;

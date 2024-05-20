WITH cte_name (column1, column2, ...) AS (
    -- CTE query definition
    SELECT column1, column2, ...
    FROM table_name
    WHERE conditions
)
-- Main query using the CTE
SELECT ...
FROM cte_name
WHERE conditions;

-- Using a CTE to calculate total revenue for each product
WITH ProductRevenue AS (
    SELECT 
        ProductName,
        SUM(Quantity * UnitPrice) AS TotalRevenue
    FROM 
        Sales
    GROUP BY 
        ProductName
)
SELECT 
    ProductName,
    TotalRevenue
FROM 
    ProductRevenue;

# Write your MySQL query statement below
SELECT product_id, 
    first_year,
    quantity,
    price
FROM(
SELECT *, 
    MIN(year) OVER (PARTITION BY product_id) AS first_year
FROM Sales) AS sales_table
WHERE first_year = year 
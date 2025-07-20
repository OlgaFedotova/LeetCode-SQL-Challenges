# Write your MySQL query statement below
WITH amout_per_day AS (
SELECT visited_on, 
    SUM(amount) AS total_amount
FROM Customer 
GROUP BY visited_on),

final_table AS (
SELECT visited_on,
    SUM(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount, 
    ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
FROM amout_per_day)

SELECT visited_on,
    amount,
    average_amount
FROM final_table
WHERE rn >= 7
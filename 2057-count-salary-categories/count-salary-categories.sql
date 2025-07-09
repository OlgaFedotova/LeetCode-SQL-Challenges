# Write your MySQL query statement below
WITH category_table AS (
    SELECT *,
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
),
category_list AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
counted AS (
    SELECT category, COUNT(account_id) AS accounts_count
    FROM category_table
    GROUP BY category
)
SELECT cl.category, COALESCE(c.accounts_count, 0) AS accounts_count
FROM category_list cl
LEFT JOIN counted c ON cl.category = c.category
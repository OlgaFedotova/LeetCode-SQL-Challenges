# Write your MySQL query statement below
WITH Numbers AS (
SELECT num, 
    COUNT(num) as count_num
FROM MyNumbers
GROUP BY num
HAVING count_num = 1 OR ISNULL(count_num)
)
SELECT MAX(num) AS num
FROM Numbers
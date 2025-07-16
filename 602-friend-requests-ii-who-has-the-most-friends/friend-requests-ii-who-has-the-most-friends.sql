# Write your MySQL query statement below
WITH requester AS (
SELECT requester_id AS id,
    COUNT(requester_id) as num
FROM RequestAccepted
GROUP BY requester_id
),

accepter AS (
SELECT accepter_id AS id, 
    COUNT(accepter_id ) as num
FROM RequestAccepted
GROUP BY accepter_id
),

final_table AS (
SELECT *
FROM requester
UNION ALL
SELECT *
FROM accepter
)

SELECT id, 
    SUM(num) AS num
FROM final_table
GROUP BY id
ORDER BY num DESC
LIMIT 1
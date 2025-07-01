# Write your MySQL query statement below

SELECT user_id,
    IFNULL(ROUND(confirmed_actions/ total_actions, 2),0) AS confirmation_rate
FROM(
SELECT Signups.user_id, 
    COUNT(action) as total_actions, 
    SUM(action = "confirmed") AS confirmed_actions
FROM 
    Signups
LEFT JOIN Confirmations 
ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id) as A

# Write your MySQL query statement below 
SELECT 
ROUND
((SELECT COUNT(*)
FROM(
SELECT 
    player_id, 
    event_date, 
    DATE_ADD(MIN(event_date) OVER (PARTITION BY player_id), INTERVAL 1 day) AS next_day_after_login
FROM Activity
GROUP BY player_id, event_date) as A
WHERE event_date = next_day_after_login)
/ 
(SELECT COUNT(DISTINCT player_id) FROM Activity),2)
AS fraction




# Write your MySQL query statement below

SELECT machine_id, 
ROUND(AVG(end_timestamp - start_timestamp),3) AS processing_time
FROM(
SELECT start_activity.machine_id, 
start_activity.process_id, 
start_activity.timestamp as start_timestamp, 
end_activity.timestamp as end_timestamp
FROM (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
) AS start_activity
JOIN (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
) AS end_activity
ON start_activity.machine_id = end_activity.machine_id
   AND start_activity.process_id  = end_activity.process_id) as A
group by 1
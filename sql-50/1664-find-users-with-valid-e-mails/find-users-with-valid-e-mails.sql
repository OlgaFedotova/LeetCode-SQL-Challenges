# Write your MySQL query statement below
SELECT *
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$'
and mail like '%@leetcode.com' COLLATE utf8mb4_bin;

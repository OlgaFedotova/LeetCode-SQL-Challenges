# Write your MySQL query statement below
SELECT A.Name AS name
FROM Employee AS A
JOIN Employee AS B
  ON A.id = B.managerId
GROUP BY A.id, A.Name
HAVING COUNT(B.id) >= 5;
# Write your MySQL query statement below
SELECT name, bonus
FROM Employee
LEFT JOIN Bonus 
ON Employee.empId = Bonus.EmpID
WHERE bonus < 1000 or bonus IS Null
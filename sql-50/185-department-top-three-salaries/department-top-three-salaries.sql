# Write your MySQL query statement below
WITH final_table AS (
SELECT Department.name AS Department,
    Employee.name AS Employee,
    Salary,
    DENSE_RANK() OVER (PARTITION BY Department.name ORDER BY salary DESC) AS salary_rank
FROM Employee
JOIN Department
ON Employee.departmentId = Department.id
ORDER BY Department, salary DESC
)

SELECT department, 
    employee, 
    salary
FROM final_table
WHERE salary_rank <= 3
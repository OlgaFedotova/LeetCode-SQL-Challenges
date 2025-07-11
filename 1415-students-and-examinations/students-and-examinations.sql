# Write your MySQL query statement below
SELECT    
    Students.student_id, 
    Student_name, 
    Subjects.subject_name, 
    COUNT(Examinations.subject_name) as attended_exams
FROM Students
CROSS JOIN Subjects
LEFT JOIN Examinations
    ON Students.student_id = Examinations.student_id 
    AND Subjects.subject_name = Examinations.subject_name
GROUP BY Students.student_id, Student_name, Subjects.subject_name
ORDER BY Students.student_id, Student_name, Subjects.subject_name
-- limit

-- Top 3 oldest employees
SELECT ed.first_name, ed.last_name, ed.employee_age
FROM employee_demographics AS ed
ORDER BY ed.employee_age DESC
LIMIT 3;

-- aliasing
-- basically changing column name

SELECT ed.gender, AVG(ed.employee_age) AS avg_age, MAX(ed.employee_age) AS max_age, MIN(ed.employee_age) AS min_age, COUNT(*) AS number_of_employees
FROM employee_demographics AS ed
GROUP BY ed.gender;

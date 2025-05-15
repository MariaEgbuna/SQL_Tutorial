/*UNION is used to combine the result sets of two or more SELECT queries into a single result set.  key points about using UNION:
Distinct rows only: By default, UNION removes duplicate rows.
Same number of columns: Each SELECT query must have the same number of columns.
Column data types must match: The corresponding columns should have compatible data types.
You can use UNION ALL if you want to keep duplicate rows in the final result. */

SELECT ed.first_name, ed.last_name
FROM employee_demographics AS ed
UNION
SELECT es.first_name, es.last_name
FROM employee_salary AS es;

-- Finding older workers and highly paid workers
SELECT ed.first_name, ed.last_name, 'Old Lady' AS Label
FROM employee_demographics AS ed
WHERE ed.employee_age >= 40 AND ed.gender = 'Female'
UNION 
SELECT ed.first_name, ed.last_name, 'Old Man' AS Label
FROM employee_demographics AS ed
WHERE ed.employee_age >= 40 AND ed.gender = 'Male'
UNION
SELECT es.first_name, es.last_name, 'Highly Paid Employee'
FROM employee_salary AS es
WHERE es.salary > 70000
ORDER BY first_Name, last_name;
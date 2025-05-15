-- SELECT stms
SELECT * 
FROM employee_demographics AS ed;

SELECT ed.first_name, ed.last_name, ed.birth_date 
FROM employee_demographics AS ed;

SELECT ed.gender 
FROM employee_demographics AS ed;

SELECT DISTINCT ed.gender 
FROM employee_demographics AS ed;
-- WHERE stm
SELECT ed.first_name, ed.last_name 
FROM employee_demographics AS ed 
WHERE ed.gender = 'Female';

SELECT es.first_name, es.occupation, es.salary 
FROM employee_salary AS es 
WHERE es.salary >= 50000;

SELECT ed.first_name, ed.last_name 
FROM employee_demographics AS ed 
WHERE ed.gender <> 'Female';

SELECT ed.last_name 
FROM employee_demographics AS ed 
WHERE ed.birth_date > '1985-01-01' AND ed.gender <> 'Male';
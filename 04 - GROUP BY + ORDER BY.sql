-- group by clause

-- employee gender and age aggregates
SELECT ed.gender, AVG(ed.employee_age), MAX(ed.employee_age), MIN(ed.employee_age), COUNT(ed.employee_age)
FROM employee_demographics AS ed
GROUP BY ed.gender;

-- ordering by gender first, then age
SELECT *
FROM employee_demographics AS ed
ORDER BY ed.gender, ed.employee_age;

-- employee occupation and average salaries
SELECT es.occupation, AVG(es.salary)
FROM employee_salary AS es
GROUP BY es.occupation;

-- order by

-- ordering by first name ASC
SELECT *
FROM employee_demographics AS ed
ORDER BY ed.first_name;

-- employees and their salaries in descending order
SELECT es.first_name, es.last_name, es.salary
FROM employee_salary AS es
ORDER BY es.salary DESC;
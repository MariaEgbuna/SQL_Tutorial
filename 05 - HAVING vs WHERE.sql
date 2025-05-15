-- where clause
SELECT *
FROM employee_demographics AS ed
WHERE ed.employee_age >= 50;

-- having clause

-- employees earning above average salary
SELECT es.occupation, AVG(es.salary)
FROM employee_salary AS es
GROUP BY es.occupation
HAVING AVG(es.salary) > 50000;

-- employees older than the average age
SELECT ed.gender, AVG(ed.employee_age)
FROM employee_demographics AS ed
GROUP BY ed.gender
HAVING AVG(ed.employee_age) > 40;

-- using both

-- occupation of employee making more than average salary of 70k
SELECT es.occupation, AVG(es.salary)
FROM employee_salary AS es
WHERE es.occupation ILIKE '%manager'
GROUP BY es.occupation
HAVING AVG(es.salary) > 70000;
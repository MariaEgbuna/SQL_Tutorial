/*--joins are used to combine rows from two or more tables based on a related column between them. types of joins:
INNER JOIN: Returns rows with matching values in both tables.
LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table and matched rows from the right table. If no match, returns NULL for right table.
RIGHT JOIN (RIGHT OUTER JOIN): Similar to LEFT JOIN but returns all rows from the right table.
FULL OUTER JOIN: Returns rows when there is a match in either table, or NULL when no match exists.
SELF JOIN: Tying a table to itself
Each join serves different purposes based on the relationships between your data tables.*/

-- INNER JOIN
-- Getting full emloyee details using both tables
SELECT ed.first_name, ed.last_name, ed.birth_date, ed.employee_age, ed.gender, es.occupation, es.salary
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- LEFT OUTER JOIN
SELECT *
FROM employee_demographics AS ed
LEFT JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- RIGHT OUTER JOIN
SELECT *
FROM employee_demographics AS ed
RIGHT JOIN employee_salary AS es
ON es.employee_id = ed.employee_id;

-- FULL JOIN
SELECT *
FROM employee_demographics AS ed
FULL JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- SELF JOIN
SELECT *
FROM employee_salary AS es1
JOIN employee_salary AS es2
ON es1.employee_id = es2.employee_id;

-- Secret santa exercise using Self Join
SELECT es1.employee_id AS Employee_Santa_ID, es1.first_name AS Santa, es2.employee_id AS Receiver_ID, es2.first_name AS Gift_Receiver
FROM employee_salary AS es1
JOIN employee_salary AS es2
ON es1.employee_id + 1 = es2.employee_id;

-- Joining multiple tables together
SELECT ed.first_name, ed.last_name, ed.birth_date, ed.employee_age, ed.gender, pd.department_name, es.occupation, es.salary
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
ON ed.employee_id = es.employee_id
INNER JOIN parks_departments AS pd
ON es.dept_id = pd.department_id;
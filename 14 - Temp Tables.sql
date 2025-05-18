--temp tables are tables only visible in the session they were created in

-- Creating a basic temp table
CREATE TEMPORARY TABLE temp_table_1
(
	f_name VARCHAR (25),
	l_name VARCHAR (25),
	fav_movie VARCHAR (100)
);

INSERT INTO temp_table_1
VALUES 
	('Maria', 'Egbuna', 'Megamind'),
	('Ifeoma', 'Asika', 'Sholay'),
	('Charles', 'Odigbo', 'Superman: Man of Steel'),
	('Yossi', 'Egbuna', 'LEGO Batman');

SELECT *
FROM temp_table_1;

-- Another way of creating temp tables but using the employee salary table
SELECT *
FROM employee_salary AS es;

-- temp table for people with salary over 60k
-- Note: PSQL expects the AS keyword to indicate that the table is being created from a query result.
CREATE TEMPORARY TABLE salary_over_60k AS
SELECT *
FROM employee_salary
WHERE salary > 60000;

SELECT *
FROM salary_over_60k;
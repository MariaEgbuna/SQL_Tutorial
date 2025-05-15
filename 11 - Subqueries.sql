/*Subqueries is basically a query within a query.
 * It can be placed in the SELECT, FROM or WHERE stm
 */

-- WHERE stm
-- Employees that worked in the finance dept
SELECT es.first_name, es.last_name, es.occupation
FROM employee_salary AS es
WHERE es.dept_id IN 
	(
		SELECT pd.department_id
		FROM parks_departments AS pd
		WHERE pd.department_name ILIKE '%Finance%'
	);

-- SELECT stm
-- Comparing all salaries to average salary
SELECT es1.first_name, es1.last_name, es1.salary,
(
	SELECT AVG(es2.salary) AS avg_salary
	FROM employee_salary AS es2
)
FROM employee_salary AS es1;

-- FROM stm
-- Use Joins or CTE instead
WITH cte_example AS 
(
	SELECT  ed.gender, AVG(es.salary) AS avgSal, MAX(es.salary) AS maxSal, MIN(es.salary) AS minSal, COUNT(*) AS employee_count
	FROM employee_demographics AS ed
	JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id
	GROUP BY ed.gender
)
SELECT gender, avgsal, minsal
FROM cte_example;

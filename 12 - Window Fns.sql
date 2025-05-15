-- Window Function

-- Uisng OVER()
-- Avg salary across all rows
SELECT ed.gender, AVG(es.salary) OVER()
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- Using OVER(PARTITION BY)
-- Avg salary by gender
SELECT ed.employee_id,  ed.gender, AVG(es.salary) OVER(PARTITION BY ed.gender)
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- Rolling total Salary by genders
SELECT ed.first_name, ed.last_name,  ed.gender, es.salary,  SUM(es.salary) OVER(PARTITION BY ed.gender ORDER BY ed.employee_id) AS rolling_total
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;

-- ROW_NUMBER and RANK()
SELECT ed.employee_id, ed.first_name, ed.last_name, ed.gender, es.salary, 
row_number() OVER(PARTITION BY ed.gender ORDER BY es.salary DESC) AS rowNum, 
rank() OVER(PARTITION BY ed.gender ORDER BY es.salary DESC) AS rank_num,
dense_rank() OVER(PARTITION BY ed.gender ORDER BY es.salary DESC) AS dense_rank_num
FROM employee_demographics AS ed
JOIN employee_salary AS es
ON ed.employee_id = es.employee_id;
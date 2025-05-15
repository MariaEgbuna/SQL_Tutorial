-- Case statements are like the IF...ELSE of SQL

-- Age brackets
SELECT ed.first_name, ed.last_name, ed.employee_age,
CASE 
	WHEN ed.employee_age > 50 THEN 'Old'
	WHEN ed.employee_age >= 35 THEN 'Adult'
	ELSE 'Young Adult'
END AS Age_Bracket
FROM employee_demographics AS ed;

-- Exercise: Pay increase
-- Salary < 50k, 5% raise; Salary > 50k, 7% raise, 10% Bonus for Finance Dept
SELECT es.first_name, es.last_name, pd.department_name,es.salary,
CASE 
	WHEN es.salary < 50000 THEN salary + (salary * 0.05)
	WHEN es.salary > 50000 THEN salary + (salary * 0.05)
	ELSE es.salary
END AS new_salary,
CASE
		WHEN pd.department_name = 'Finance' THEN es.salary * 0.1
		ELSE 0
END AS dept_bonus
FROM employee_salary AS es
JOIN parks_departments AS pd
ON es.dept_id = pd.department_id


-- Adding both case statements to get total salary
SELECT es.first_name, es.last_name, pd.department_name,es.salary,
CASE 
	WHEN es.salary < 50000 THEN salary + (salary * 0.05)
	WHEN es.salary > 50000 THEN salary + (salary * 0.05)
	ELSE 0
END AS new_salary,
CASE
		WHEN pd.department_name = 'Finance' THEN es.salary * 0.1
		ELSE 0
END AS dept_bonus,
-- Total compensation: new salary + dept bonus
    (
        CASE 
            WHEN es.salary < 50000 THEN es.salary + (es.salary * 0.05)
            WHEN es.salary > 50000 THEN es.salary + (es.salary * 0.05)
            ELSE es.salary
        END
        +
        CASE
            WHEN pd.department_name = 'Finance' THEN es.salary * 0.1
            ELSE 0
        END
    ) AS total_compensation
FROM employee_salary AS es
JOIN parks_departments AS pd
ON es.dept_id = pd.department_id;
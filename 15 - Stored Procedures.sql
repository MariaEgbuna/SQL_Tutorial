--Stored Procedure: a way to save your sql code to use over and over again

-- Use Functions Instead - it returns rows to client unlike Procedure

-- Retrieving employees with high salaries
CREATE FUNCTION high_earners()
RETURNS TABLE(employee_id INT, first_name VARCHAR, last_name VARCHAR, salary INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT es.employee_id, es.first_name, es.last_name, es.salary
    FROM employee_salary AS es
    WHERE es.salary > 60000;
END;
$$;

SELECT *
FROM high_earners();

-- low salary earners
CREATE FUNCTION low_earners()
RETURNS TABLE(employee_id INT, first_name VARCHAR, last_name VARCHAR, salary INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT es.employee_id, es.first_name, es.last_name, es.salary
    FROM employee_salary AS es
    WHERE es.salary < 60000;
END;
$$;

SELECT *
FROM low_earners();
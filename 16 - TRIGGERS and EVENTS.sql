-- Triggers and Events

-- A trigger is a block of code that executes automatically when an event takes place in a specific table
-- PostgreSQL handles triggers and delimiters differently.
-- You do not use delimiter.
-- You must write a trigger function first, in pl/pgsql.
-- Then you create the trigger that calls that function.
-- The new row is referenced inside the trigger function.
-- After insert trigger still works similarly.

-- First, create the trigger function
CREATE OR REPLACE FUNCTION new_employee_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Then create the trigger
CREATE TRIGGER employee_insert
AFTER INSERT ON employee_salary
FOR EACH ROW
EXECUTE FUNCTION new_employee_insert();

-- insert values
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);

-- check demographics table
SELECT *
FROM employee_demographics AS ed;

-- listing all triggers in database
SELECT
    event_object_table AS table_name,
    trigger_name,
    action_timing,
    event_manipulation AS event_type,
    action_statement AS function_called
FROM information_schema.triggers
WHERE trigger_schema = 'public';  -- Replace with your schema name if different

-- Events
-- PSQL does not support CREATE EVENT
--PostgreSQL handles scheduling via external tools, such as:
		--cron jobs (on Linux/Unix systems)
		--pgAgent (PostgreSQL job scheduler)
		--pg_cron extension (runs scheduled jobs inside PostgreSQL)
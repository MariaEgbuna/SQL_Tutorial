/*So there are multiple string functions
1.LENGTH ==> This will calculates the total no. of characters present in the desired output
2.UPPER ==> To convert all the characters to uppercase form.
3.LOWER ==> To convert all the characters to lowercase form.
4.TRIM ==> Removes unwanted blank spaces from left and right.
    *LTRIM ==> Removes unwanted blank spaces from left side only.
    *RTRIM ==>Removes unwanted blank spaces from lright side only.
5.LEFT ==> To select specific character starting from the left side.
6.RIGHT ==>To select specific character starting from the right side.
7.SUBSRING ==> To select specific characters by mentioning start and end points.
8.REPLACE ==> To replace specific character with the desired character.
9.LOCATE ==> This will locate specific characters with 0 if not found 1 if found. (POSITION in PSQL)
10.CONCATE ==> This will combine the characters of 2 different coloumns.

SUBSTRING & CONCAT both string functions are very important and widly used in real world projects.*/

-- Length
SELECT ed.first_name, length(ed.first_name) AS name_length
FROM employee_demographics AS ed
ORDER BY name_length;

-- Upper and Lower
SELECT ed.first_name, UPPER(ed.first_name) AS name_allCAPS
FROM employee_demographics AS ed;

SELECT ed.first_name, LOWER(ed.first_name) AS name_lowCAPS
FROM employee_demographics AS ed;

-- Left and Right
SELECT ed.first_name, left(ed.first_name, 3)
FROM employee_demographics AS ed;

SELECT ed.last_name, right(ed.last_name, 3)
FROM employee_demographics AS ed;

-- Substring
SELECT ed.first_name, substr(ed.first_name, 2, 4)
FROM employee_demographics AS ed;
-- Finding the month of birth using Cast to text
	SELECT ed.birth_date, substr(ed.birth_date::text, 6, 2) AS MonthNo
	FROM employee_demographics AS ed;
	
-- Finding the month of birth using extract
	SELECT ed.birth_date, EXTRACT (MONTH FROM ed.birth_date) AS MonthNo
	FROM employee_demographics AS ed;

-- Replace
SELECT ed.first_name, replace(ed.first_name, 'i', 'z')
FROM employee_demographics AS ed;

-- Locate (Position in PSQL)
SELECT ed.first_name, position('e' IN ed.first_name)
FROM employee_demographics AS ed;

-- Concat
/* CONCAT() — Standard and Safe
Null-safe: If any input is NULL, it does not return NULL, but just skips the null value.*/
SELECT ed.first_name, ed.last_name, concat(ed.first_name, ' ', ed.last_name) AS full_name
FROM employee_demographics AS ed;

/*(Double Pipe) — String Concatenation Operator
Unlike CONCAT(), if any value is NULL, the whole result becomes NULL.*/
SELECT ed.first_name || ' ' || ed.last_name AS full_name
FROM employee_demographics AS ed;
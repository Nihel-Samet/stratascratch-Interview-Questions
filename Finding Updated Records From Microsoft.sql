-- Finding Updated Records From Microsoft
-- What I got the hang of: subqueries
/*
Question: 
	We have a table with employees and their salaries, however, 
	some of the records are old and contain outdated salary information. 
	Find the current salary of each employee assuming that salaries increase each year. 
	Output their id, first name, last name, department ID, and current salary. 
	Order your list by employee ID in ascending order.

Table: ms_employee_salary

id: int
first_name: varchar
last_name: varchar
salary: int 
department_id:int
*/

-- Solution
WITH  sub AS 
(SELECT 
 id, 
 first_name, 
 last_name, 
 department_id,
MAX(salary) AS max
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id)

SELECT *
FROM sub
ORDER BY id ASC;
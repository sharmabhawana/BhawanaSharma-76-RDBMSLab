 use hr;
 /*Write a query to display the last name, department number, and 
department name for all employees.*/ 
SELECT e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
/*2. Display the employee last name and department name for all 
employees who have an 'a' (lowercase) in their last names. */
SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE '%a%';
/*3. Write a query to display the employee last name, department name, 
location ID, and city of all employees who earn a commission. */
SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;
/*4. Write a query to display the last name, job, department number, and 
department name for all employees who work in Toronto.*/ 
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';
/*5 a. Display the employee last name and employee number along with 
their manager’s last name and 
manager number. Label the columns Employee, Emp#, Manager, and 
Mgr#, respectively.*/ 
SELECT e.last_name AS Employee, e.employee_id AS Emp, 
m.last_name AS Manager, e.manager_id AS Mgr#
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
/*b.display all employees including King, who has no manager.*/ 
SELECT e.last_name AS Employee, e.employee_id AS Emp,
IFNULL(m.last_name, 'No Manager') AS Manager, IFNULL(e.manager_id, 'N/A') AS Mgr
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
/*6: Display the manager number and the salary of the lowest paid 
employee for that manager. 
Exclude anyone whose manager is not known. Exclude any groups 
where the minimum salary is $6,000 or less. Sort the output in 
descending order of salary. */
SELECT manager_id, MIN(salary) AS Lowest_Salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY Lowest_Salary DESC;
/*7: Write a query to display the number of people with the same job. */
SELECT job_id, COUNT(*) AS Number_of_Employees
FROM employees
GROUP BY job_id;
/*8: Write a query to display the minimum, maximum, sum, and average 
salary for each job type. */
SELECT job_id, 
       MIN(salary) AS Min_Salary, 
       MAX(salary) AS Max_Salary, 
       SUM(salary) AS Total_Salary, 
       ROUND(AVG(salary), 2) AS Avg_Salary
FROM employees
GROUP BY job_id;
/*9. Write a query to display each department’s name, location, number 
of employees, and the average salary for all employees in that 
department. Label the columns Name, Location, Number of People, and 
Salary, respectively. Round the average salary to two decimal places.*/
SELECT d.department_name AS Name, l.city AS Location, 
       COUNT(e.employee_id) AS Number_of_People, 
       ROUND(AVG(e.salary), 2) AS Salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY d.department_name, l.city;
/*10.Create a query to display the name and hire date of any employee 
hired after employee Davies. */
SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Davies');
/*11. Create a query that will display the total number of employees and, 
of that total, the number of employees hired in 1995, 1996, 1997, and 
1998. Create appropriate column headings. */
SELECT COUNT(*) AS Total_Employees, 
SUM(CASE WHEN YEAR(hire_date) = 1995 THEN 1 ELSE 0 END) AS Hired_1995,
SUM(CASE WHEN YEAR(hire_date) = 1996 THEN 1 ELSE 0 END) AS Hired_1996,
SUM(CASE WHEN YEAR(hire_date) = 1997 THEN 1 ELSE 0 END) AS Hired_1997,
SUM(CASE WHEN YEAR(hire_date) = 1998 THEN 1 ELSE 0 END) AS Hired_1998
FROM employees;
/*12. Write a query to display the last name and hire date of any 
employee in the same department as Zlotkey. Exclude Zlotkey.*/ 
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE last_name = 'Zlotkey')
AND last_name <> 'Zlotkey';
/*13: Display the last name and salary of every employee who reports to 
King.*/
SELECT last_name, salary
FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees WHERE last_name = 'King');
/*14.Create a query to display the employee numbers and last names of 
all employees who earn more than the average salary. Sort the results 
in ascending order of salary.*/
 SELECT employee_id, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC;
/*15.Display the names and hire dates for all employees who were hired 
before their managers, along with their manager’s names and hire 
dates. Label the columns Employee, EmpHired, Manager, and Mgr 
Hired, respectively. */
SELECT e.last_name AS Employee, e.hire_date AS EmpHired, 
m.last_name AS Manager, m.hire_date AS MgrHired
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
/*16. Write a query that displays the employee numbers and last names 
of all employees who work in a department with any employee whose 
last name contains a 'u'. */
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');
/*17. Modify the query in Excercise 16 to display the employee numbers, 
last names, and salaries of all employees who earn more than the 
average salary and who work in a department with any 
employee with a u in their name. */
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');
/*18. Write a query to display Third Highest Salary.*/
SELECT  salary 
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees) 
AND salary < (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

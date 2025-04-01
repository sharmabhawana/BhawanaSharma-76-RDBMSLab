/*Display all information of Employees table*/
SELECT * FROM employees;
/*Display unique Job ID from Employees table*/
SELECT DISTINCT job_id FROM employees;
/*List the Employees in ascending order of their Salaries*/
SELECT * FROM employees ORDER BY salary ASC;
/*List details of Employees ordered by department_id (ascending) and job_id (descending)*/
SELECT * FROM employees ORDER BY department_id ASC, job_id DESC;
#List Employee Number, Full Name, Salary, and Daily Salary in ascending order of annual salary
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name, salary, salary / 30 AS daily_salary 
FROM employees ORDER BY salary ASC;
#List Employee ID, First Name, Salary, and Daily Salary
SELECT employee_id, first_name, salary, salary / 30 AS daily_salary FROM employees;
#List Employees who are either Clerk or Analyst in descending order of job_id
SELECT * FROM employees WHERE job_id IN ('CLERK', 'ANALYST') ORDER BY job_id DESC;
#List Employees hired on specific dates, in ascending order of seniority
SELECT * FROM employees WHERE hire_date IN ('2005-08-13', '1981-12-03', '2002-06-07', '2005-01-29') 
ORDER BY hire_date ASC;
#List Employees working in department 10 or 50
SELECT * FROM employees WHERE department_id IN (10, 50);
#List the Employees  who joined in the year 2005 . 
SELECT * FROM employees WHERE YEAR(hire_date) = 2005;
#  Select all the Employees   whose annual salary  ranging from  22000  and 45 000 .
 SELECT * FROM employees WHERE salary BETWEEN 22000 AND 45000;
# List the firstname of the Employees   who are  having  five character in their name.
 SELECT first_name FROM employees WHERE LENGTH(first_name) = 5;
#List Employees whose first name starts with 'S' and has five characters
SELECT first_name FROM employees WHERE first_name LIKE 'S____';
#List the Employees  who are having four character in firstname and third character must  be r. 
SELECT first_name FROM employees WHERE LENGTH(first_name) = 4 AND SUBSTRING(first_name, 3, 1) = 'r';
#List the five character name startingwith s and ending w ith n. 
SELECT first_name FROM employees WHERE first_name LIKE 'S___N';
#List the Employees  whose Salary is four digit number ending with 0 
SELECT * FROM employees WHERE salary LIKE '___0';
#List the Employees  who does not belongs to Deptment_id  2 0. 
SELECT * FROM employees WHERE department_id <> 20;
#Display the last name and job_id of all employees  who do  not have a manager.
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;
 SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL 
ORDER BY salary DESC, commission_pct DESC;
#Display the last name, salary, and commission_pct for all employees who earn comm issions. Sort data in descending order of salary and commission_pct. 
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL 
ORDER BY salary DESC, commission_pct DESC;
#Display the last name of all employees  where the third letter of  the name is an a. 
SELECT last_name FROM employees WHERE last_name LIKE '__A%';
#Display t he last name, job_id, and salary  for all employees whose job is sales representative or stockclerk and whose salary  is not equal to  $2 ,5 00 ,$ 3,5 00 ,o r$ 7 ,0 00 .
SELECT last_name, job_id, salary FROM employees 
WHERE job_id IN ('SALES REPRESENTATIVE', 'STOCKCLERK') 
AND salary NOT IN (2500, 3500, 7000);

 /* . Create a table nam edem p t hat have attribute  id and nam e . insert  t he fo llowing
values in emptable. 
id  name 
1	a%b
2	a_b 
3	_abc 
4	%abc 
5	abc% 
6	abc_ */
CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO emp (id, name) VALUES
(1, 'a%b'), (2, 'a_b'), (3, '_abc'), (4, '%abc'), (5, 'abc%'), (6, 'abc_');

#a. Display the names of all employees where the third letter of the name is '%'. 
SELECT * FROM emp WHERE name LIKE '__%';
#b. Display the last name so fall employees w herethe first letter ofthe name is '_'. 
SELECT * FROM emp WHERE name LIKE '_%';
#c. List the emps those are having two character and second character must be '%'.
SELECT * FROM emp WHERE name LIKE '_%'; 
#d. List the emps whose names having a character '_'. 
SELECT * FROM emp WHERE name LIKE '%_%';


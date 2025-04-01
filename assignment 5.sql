#Write a query to display the current date. 
use hr;
SELECT CURDATE();
/*For each employee, display the employee number, last_name, salary, and salary increased by 15% 
and expressed as a whole number.*/
SELECT employee_id, last_name, salary, ROUND(salary * 1.15) AS increased_salary
FROM employees;
 /*For each employee, display the employee’s last name, and calculate the number of months 
between today and the date the employee was hired. Label the column MONTHS_WORKED. Order 
your results by the number of months employed.  Round the number of months up to the closest 
whole number.*/
SELECT last_name, ROUND(TIMESTAMPDIFF(MONTH, hire_date, CURDATE())) AS MONTHS_WORKED
FROM employees
ORDER BY MONTHS_WORKED;
/* Create a query to display the last name and salary for all employees. Format the salary to be 15 
characters long, left-padded with $. Label the column SALARY*/
SELECT last_name, LPAD(salary, 15, '$') AS SALARY
FROM employees;
/*Display each employee’s last_name, hire date, and salary review date, which is the first Monday 
after six months of service. Label the column REVIEW. Format the dates to appear in the format 
similar to “Monday, the Thirty-First of July, 2000.” */
SELECT last_name, hire_date, 
DATE_FORMAT(DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 6 MONTH), INTERVAL (7 - WEEKDAY(DATE_ADD(CURDATE(), INTERVAL 6 MONTH))) DAY), 
'%W, the %D of %M, %Y') AS REVIEW
FROM employees;
/*. Display the last name, hire date, and day of the week on which the employee started. Label 
the column DAY. Order the results by the day of the week starting with Monday. */
SELECT last_name, hire_date, 
DAYNAME(hire_date) AS DAY
FROM employees
ORDER BY FIELD(DAYNAME(hire_date), 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
/* . Create a query that displays the employees’ last names and commission amounts. If an 
employee does not earn commission, put “No Commission.” Label the column COMM. */
SELECT last_name, IFNULL(commission_pct, 'No Commission') AS COMM
FROM employees;
/* Using the Case Expression, write a query that displays the grade of all employees based on the 
value of the column JOB_ID, as per the following data: 
JOB    
GRADE 
AD_PRES  
ST_MAN   
IT_PROG  
SA_REP   
ST_CLERK   
None of the above 
A 
B 
C 
D 
E 
0 */
SELECT last_name, job_id,
CASE 
    WHEN job_id = 'AD_PRES' THEN 'A'
    WHEN job_id = 'ST_MAN' THEN 'B'
    WHEN job_id = 'IT_PROG' THEN 'C'
    WHEN job_id = 'SA_REP' THEN 'D'
    WHEN job_id = 'ST_CLERK' THEN 'E'
    ELSE '0' -- For any job_id that doesn't match the specified ones
END AS GRADE
FROM employees;
/* Create a query that displays the employees’ last names and indicates the amounts of their 
annual salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in 
descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES. */
SELECT last_name, salary, 
RPAD('', salary / 1000, '*') AS EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;
/* Create a query that displays the details of all employees who hired on 'Monday'.*/
SELECT * FROM employees
WHERE DAYNAME(hire_date) = 'Monday';







 
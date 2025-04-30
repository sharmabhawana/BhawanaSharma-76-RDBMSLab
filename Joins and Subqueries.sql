#Join-Based Queries
use hr;
#Employee names and their department names
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
#First name, last name, and job title
SELECT e.first_name, e.last_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;
#Employees with their manager’s name
SELECT e.first_name AS employee_first, e.last_name AS employee_last,
       m.first_name AS manager_first, m.last_name AS manager_last
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;
#Employees who work in the same department as their manager
SELECT e.first_name, e.last_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.department_id = m.department_id;
#Employee details with location and country
SELECT e.first_name, e.last_name, l.city, c.country_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;
#Employees with job title and minimum salary for that job
SELECT e.first_name, e.last_name, j.job_title, j.min_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;
#Departments and employee count
SELECT d.department_name, COUNT(e.employee_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
#Employees and their department's city
SELECT e.first_name, e.last_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;
#Department names and manager names
SELECT d.department_name, e.first_name AS manager_first, e.last_name AS manager_last
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id;
#Employees with their job title and manager's job title
SELECT e.first_name, e.last_name, j1.job_title AS employee_job, j2.job_title AS manager_job
FROM employees e
JOIN jobs j1 ON e.job_id = j1.job_id
LEFT JOIN employees m ON e.manager_id = m.employee_id
LEFT JOIN jobs j2 ON m.job_id = j2.job_id;
#Employees in IT or Finance
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name IN ('IT', 'Finance');
#Jobs with total employees
SELECT j.job_title, COUNT(e.employee_id) AS num_employees
FROM jobs j
LEFT JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title;
#Employees with salary > department average
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary) FROM employees
    WHERE department_id = e.department_id
);
#Employees with their region
SELECT e.first_name, e.last_name, r.region_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;
#Departments with no employees
SELECT d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
#Subquery-Based Queries
#Employees earning more than average
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
#Employees earning more than any in department 60
SELECT first_name, last_name, salary
FROM employees
WHERE salary > any (SELECT salary FROM employees WHERE department_id = 60);
#Employees with same job as Steven King
SELECT first_name, last_name
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE first_name = 'Steven' AND last_name = 'King');
#Employees earning max salary in their department
SELECT first_name, last_name, salary
FROM employees e
WHERE salary = (
    SELECT max(salary)
    FROM employees
    WHERE department_id = e.department_id
);
#Departments with no employees
SELECT department_name
FROM departments
WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees WHERE department_id IS NOT NULL);
#Employees who are not managers
SELECT first_name, last_name
FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL);
#Employees earning more than their manager
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
#Employees who joined before their manager
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
#Employees in same department as Neena Kochhar
SELECT first_name, last_name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE first_name = 'Neena' AND last_name = 'Kochhar'
);
#Job titles with min salary > 5000
SELECT job_title
FROM jobs
WHERE min_salary > 5000;
#Employees with lowest salary in job category
SELECT first_name, last_name, salary
FROM employees e
WHERE salary = (
    SELECT min(salary)
    FROM employees
    WHERE job_id = e.job_id
);
#Employees working in Europe
SELECT e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
WHERE r.region_name = 'Europe';
#Departments where avg salary > 8000
SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 8000
);
#Employees earning more than avg for their job
SELECT first_name, last_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE job_id = e.job_id
);
#Employees with second-highest salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary) FROM employees
    )
);
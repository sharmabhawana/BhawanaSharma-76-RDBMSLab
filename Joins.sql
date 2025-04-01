use hr;
show tables;
desc employees;
desc departments;
select e.first_name,d.department_name
from employees e join departments d
on (e.department_id=d.department_id);
select e.first_name,d.department_name
from employees e right outer join departments d
on(e.department_id=d.department_id);
select e.first_name,e.last_name,d.department_name
from employees e left outer join departments d
on(e.department_id=d.department_id);
select e.first_name,d.department_name
from employees e right outer join departments d
on(e.department_id=d.department_id)
union 
select e.first_name,e.last_name,d.department_name
from employees e left outer join departments d
on(e.department_id=d.department_id);
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) fullname,
    d.department_name
FROM
    employees e
        LEFT OUTER JOIN
    departments d ON (e.department_id = d.department_id) 
UNION SELECT 
    CONCAT(e.first_name, ' ', e.last_name) fullname,
    d.department_name
FROM
    employees e
        RIGHT OUTER JOIN
    departments d ON (e.department_id = d.department_id);
create view deptsalreport as
select department_name,
max(salary)as maxsal,
min(salary)as minsal,
avg(salary)as avgsal,
sum(salary)as sumsa,
count(*)as noofemp
from employees e join departments d
on(e.department_id=d.department_id)
group by department_name;
use university2;
select *from instructors;
select *from departments;
desc instructors;
desc departments;
select i.Name,d.deptname
from instructors i join departments d
on (i.deptid=d.depid);
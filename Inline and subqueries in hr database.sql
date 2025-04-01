use hr;
show tables;
select last_name,salary from employees where salary>11000;
select salary from employees where last_name='Abel';
#single row subquery.
select last_name,salary
 from employees 
 where salary>(select salary 
 from employees 
 where last_name='Abel');
 desc employees;
 select last_name,dayname(hire_date)
 from employees 
 where dayname(hire_date)=
 (select dayname(hire_date)
 from employees
 where employee_id=101);
 desc employees;
 
 select last_name,manager_id from employees
 where manager_id=
 (select manager_id from employees
 where employee_id=101);
 #three multirow functions in ,any and or.
 select last_name,salary
 from employees
 where salary in(
					select salary 
					from employees
					where last_name='king' );
 select last_name,salary 
 from employees 
 where salary in (
						select min(salary)
                        from employees 
                        group by department_id);
select last_name,salary,job_id from employees;
select last_name,salary,job_id
 from employees
 where salary > any(
						select salary from employees 
                        where job_id="it_prog")and 
                        job_id <>"it_prog";	
                        #not<>,!=it can written in both forms.

 #pair wise comparsion
 use hr;
 show tables;
 desc employees;
 #pair wise comparsion.
 select last_name,manager_id,department_id
 from employees 
 where(manager_id,department_id)in 
 (select manager_id,department_id 
 from employees
 where employee_id in (174,180))
 order by department_id;
 #non pair wise comparison.
 
 select last_name,manager_id,department_id
 from employees 
 where manager_id in(select manager_id
 from employees
 where employee_id in (174,180))
 and 
 department_id in
 (select department_id 
 from employees
 where employee_id in (174,180))
order by department_id;


select last_name,salary
 from employees 
 where salary >any 
 (select avg(salary)from employees
group by department_id)
order by salary;

#inline view
select last_name,salary,e.department_id,deptavg.avgsal
from employees e
join
(select department_id,avg(salary)as avgsal 
from employees
group by department_id) deptavg
on (e.department_id=deptavg.department_id)
and e.salary>deptavg.avgsal;

#co-related subqueries.
select last_name,salary,department_id
from employees outeremp 
where salary >( select avg(salary)
						from employees 
				where department_id=outeremp.department_id);
desc employees;
 
 
 
 
 
 
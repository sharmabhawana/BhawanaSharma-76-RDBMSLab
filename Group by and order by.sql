use scott;
show tables;
select  deptno,max(sal) as amxsal from emp group by deptno;
select job,sum(sal),count(*) from emp group by job;

select deptno,job,sum(sal),count(*)
from emp
group by deptno,job
order by deptno;

select  ename,dname,emp.deptno 
from emp join dept 
on(emp.deptno=dept.deptno)
order by dept.deptno;


show tables;

select * from emp;
select * from dept;

use university2;
show tables;
desc instructors;
desc departments;

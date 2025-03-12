use scott;
desc emp;
desc dept;
select *from emp;
select *from dept;
#equi join
select emp.ename,emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc
from emp join dept
on(emp.deptno=dept.deptno);
#natural join.
select emp.ename,emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc
from emp  natural join dept;
select *from emp;
select *from salgrade;
#non equal join 
select e.ename,e.sal,s.grade,s.losal,s.hisal
from  emp e join salgrade s
on e.sal between s.losal and s.hisal;
#self join 
select e.ename as empname,m.ename as mgrname
from emp e join emp m
on (e.mgr and m.empno);
select *from emp;
select *from dept;
select emp.ename,emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc
from emp join dept
on(emp.deptno=dept.deptno);
#right outer join
select emp.ename,emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc
from emp right outer join dept
on(emp.deptno=dept.deptno);
#left outer join
select emp.ename,emp.sal,emp.deptno,dept.deptno,dept.dname,dept.loc
from emp left outer join dept
on(emp.deptno=dept.deptno);
#full outer join.
select ename,dname
from emp right outer join dept
on(emp.deptno=dept.deptno)
union
select ename,dname
from emp left outer join dept
on(emp.deptno=dept.deptno);
create database testing;
use testing;
create table dept
(
did int primary key,
dname varchar(20),
location varchar(20)
);
desc dept;

insert into dept values (10,'cse','noida'),
(20,'it','kolkata');

select *from dept;

create table emp
(
eid int primary key,
ename varchar(20),
sal decimal(8,2),
did int,
foreign key(did) references dept(did)
);

insert into emp values(101,'neena',80000,10);
select *from emp;
select *from dep;
delete  from dept where did=10;


drop table emp;
show tables;
desc emp;
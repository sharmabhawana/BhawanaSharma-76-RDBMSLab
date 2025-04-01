create database univ;
use univ;
create table dept
(
did int primary key,
dname varchar(20),
location varchar(20)
);
create table emp
(
eid int primary key,
name varchar(20),
did int,
foreign key (did) references dept (did)
);
desc dept;
insert into dept values (10,'cse','noida'),
(20,'it','kolkata');
select *from dept;
desc emp;
insert into emp values(101,'neena',20);
select *from emp;
delete from dept where did=20;
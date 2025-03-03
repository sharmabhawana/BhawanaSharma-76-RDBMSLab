create database univ;
use univ;
create table employees
(
eid int primary key,
name varchar(20),
mid int,
foreign key (mid) references employees(eid)
);
desc employees;
insert into employees values(101,'James',Null),
(102,'King',101),
(103,'James',101),
(104,'Neena',102);
select *from employees;
insert into employees values(105,'James',107);


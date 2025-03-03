Delete from Departments
where DepartmentName='Physics';

select *from Departments;


Update Students
set FirstName='William'
Where LastName='Brown';

select *from students;


Update Departments
set DepartmentName='Maths'
where DepartmentName='Mathematics';

select *from Departments; 

show databases;
use university;
show tables;
desc courses;
desc students;
desc departments;
select *from departments;
select *from students;
delete from students where departmentid=3;

select *from departments;
select StudentId,DepartmentId,firstName from students;
select FirstName,DOB from students;
select *from courses;
select *from courses where credits=4;
select *from courses where credits<=5;
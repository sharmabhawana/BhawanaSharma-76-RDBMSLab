use university2;
show tables;
desc instructors;
select *from instructors;
select concat(name,' earns ',salary)from instructors;
select concat(name,' earns ',salary) as'earns' from instructors;
select concat(name,' works in ',deptid)as 'works in' from instructors;
select name from instructors;

select substr(name ,5)from instructors;
select substr(name,5,3)from instructors;

select upper(name) from students;
select lower(name) from students;
select name from students;
select concat(substr(name,1,1),lower(substr(name,2)))from students;
select left(name,5)from students;
select ltrim( '       hello            ');
select rtrim( '       hello            ');
select trim( '       hello            ');

select lpad(salary,15,'*') from instructors;
select rpad(salary,15,'*') from instructors;
select lpad(rpad(salary,15,'*'),20,'*') from instructors;

select name,dob from students;
desc students;
select name,day(dob) from students;
select name,month(dob) from students;

select name,year(dob) from students;
select name,hour(dob) from students;
select name,minute(dob) from students;
select minute(curtime());
select name,dayname(dob),monthname(dob) from students
where dayname(dob)="Sunday";
select name,year(curdate())-year(dob) as age from students;

select*from instructors;


select name,salary,deptid,
case deptid
when 3 then salary*1.30
when 6 then salary*1.40
when 9 then salary*1.50 
else salary
end
as incsal
from instructors ;


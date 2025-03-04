use university2;
show tables;

select  ifnull(null,"na");

select  ifnull(10,"na");

select max(salary) as maxsal,
min(salary) as minsal,
round(avg(salary),2) as avgsal,
sum(salary) as sumsal,
count(InstructorID) as noofemp
from instructors;

desc instrustors;
select *from instructors;
select deptid, max(salary),count(*)
from instructors
group by deptid;


select *from students;

select deptid,count(*)
from students
group by deptid;


select*from enrollments;
select grade,count(*)
from enrollments
group by grade
order by grade;

select StudentID,count(*)
from enrollments
group by StudentID
order by StudentID;

select courseid,count(*)
from enrollments
group by courseid;

select courseid,count(*)
from enrollments
group by courseid
having count(*)>10 ;







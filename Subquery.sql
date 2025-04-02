#experiment date-(21/03/2025)
#Aim: To perform nested queries from multiple tables.

/*A subquery in SQL is a query nested inside another query. 
It is used to retrieve data that will be used by the main query as a condition for filtering or processing data. 
A subquery can be placed in SELECT, FROM, or WHERE clauses of a query.*/

# single row sub query
use university;
select * from instructors 
where salary>(select salary from instructors 
                where name="Dr. Emily Davis");
   
# Multi row subquery
select name,salary from instructors
where salary in(
select min(salary) minsal 
from instructors
group by deptid              
);


#MULTI ROW SUBQUERY
SELECT STUDENTID,NAME,DAYNAME(DOB)
FROM STUDENTS
WHERE DAYNAME(DOB) IN
(SELECT DAYNAME(DOB) FROM STUDENTS WHERE STUDENTID IN(1,2));



# multi column sub query(pair wise)
select name,mid,deptid
from instructors
where (mid,deptid) in
	(select mid,deptid from instructors where instructorId in(4,6))	;	
    
# multi column sub query(non pair wise)
select name,mid,deptid
from instructors
where mid in (select mid from instructors where instructorId in(4,6))
and deptid in(select deptid from instructors where instructorId in(4,6));


#CORELATED SUB QUERY
SELECT NAME,SALARY from INSTRUCTORS INS
WHERE SALARY>(SELECT AVG(SALARY) AVGSAL 
              FROM INSTRUCTORS 
              WHERE DEPTID=INS.DEPTID);
              

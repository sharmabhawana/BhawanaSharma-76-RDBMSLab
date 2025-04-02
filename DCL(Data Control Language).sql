select user();
select host,user from mysql.user;
create database csea4;
show databases;
create user 'stu2'@'localhost' identified by '1234';
select user from mysql.user;
alter user 'stu2'@'localhost' identified by '4567';
rename user 'stu2'@'localhost' to  'stu123'@'localhost';
drop user 'stu1'@'localhost';
grant create ,alter,drop
on csea4.* to 'stu123'@'localhost';

show grants for 'stu123'@'localhost';

grant select,insert,update,delete
on csea4.* to 'stu123'@'localhost';
revoke select,insert,update,delete
on csea4.* from 'stu123'@'localhost';

show grants for 'stu123'@'localhost';

revoke all on csea4.* from 'stu123'@'localhost';
show grants for 'stu123'@'localhost';


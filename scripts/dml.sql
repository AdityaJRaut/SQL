create table temp (id int) ;
select * from temp;
alter table temp add column name varchar(20);
insert into temp values (3,"sourabh");
alter table temp add column lname varchar(20);
set sql_safe_updates=0;
update temp set lname ="unknown";
update temp set lname ="Raut" where name ="Aditya";
alter table temp rename to students;
select firstname from students where firstname like 'a%';
select lastname from students where lastname like '_____';
select firstname from students where firstname like '_A%';
select firstname from students where firstname like '%_A';
select firstname from students where firstname like '%an%';
select firstname from students where firstname like 'a%';

select max(salary),firstname group by firstname;
create table demo(id int unique,value varchar(20));
insert into demo values(null,'Pratham');
select * from demo;
ALTER TABLE DEMO MODIFY COLUMN ID INT PRIMARY KEY;
TRUNCATE TABLE DEMO;
DELETE FROM DEMO WHERE ID=null
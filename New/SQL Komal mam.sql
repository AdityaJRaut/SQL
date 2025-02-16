create database demo;
use demo;

-- 20-01
create table students(studentID int,studentName varchar(50),studentMarks decimal(10,2));
insert into students values(2,'Preetam',75.82),(3,'John',70.82);
select * from students;
create table employee(emp_id int,emp_fname varchar(50),emp_lname varchar(50),emp_gender char(6),emp_age int,emp_salary int,emp_dob date);
select * from employee;

-- Homework
create table devices(device_id int,device_name varchar(50),price int);
select * from devices;
create table accountholder(accno int,accname varchar(50),acctype char(10));
select * from accountholder;
insert into accountholder values(0004,'pratham','saving');
insert into devices values(3,'inverter',9000);
select * from devices;
insert into employee values(3,'sourabh','sarnaik','male',28,42000,'1995-10-25');
create table staff(staffid int,staffdept varchar(50),staffsalary int);
insert into staff values(4,'misc',10000);
insert into staff(staffid,staffdept) values(5,'storageroom');
select * from staff;

-- 21-01
create table employeedemo
(emp_id int,emp_name varchar(20),emp_salary decimal(10,2),emp_joiningdate date,emp_calltime time,emp_intime timestamp,emp_cert varchar(20),cert_year year);
insert into employeedemo(emp_id,emp_name ,emp_salary ,emp_joiningdate ,emp_calltime,emp_intime ,
emp_cert ,cert_year ) values(1,'aditya',20.5,'2023-05-23','10:30:00','2023-02-23 10:30:00','Java',2020),(2,'sachin',12.5,'2022-03-24','10:25:00','2024-02-23 10:25:00','.net',2023);
create table products(productid int,productname varchar(20),manufactredate date);
insert into products values (1,'laptop','2024-08-23');
create table orders(orderID int,orderAmount decimal(10,2),orderDate timestamp);
insert into orders values(1,2000.02,'2023-08-09 15:25:36');
create table schedules(scheduleId int,eventTime time);
insert into schedules values(1,'10:25:36');

select * from products;
select * from orders;
select * from schedules;

create table emp(employeeid int,name varchar(20),position varchar(20),salary decimal(10,2),hiredate date);
alter table emp add column department varchar(20);
drop table emp;
truncate table employeedemo;

-- 22/01
create table books(bookID int primary key,title varchar(100),author varchar(100),publication_year int,price decimal(10,2));
alter table books add column isbn varchar(20);
alter table books modify column price decimal(10,2);
alter table books drop column publication_year;
describe books;
alter table books modify column price decimal(5,1);
-- Homework
create table employees(employeeID int primary key,firstname varchar(20),lastname varchar(50),age int,salary decimal(10,2),department varchar(50));
select * from employees;
create table products(productId int primary key,productName varchar(100),price decimal(10,2),category varchar(20));
select * from products;
create table students(student_id int primary key,firstname varchar(20),lastname varchar(20),age int,marks decimal(10,2),grade char(1));
select * from students;
create table orders(orderid int primary key,orderdate date,customerid int,totalamount decimal(10,2));
select * from orders;
create table customers(customerid int primary key,firstname varchar(20),lastname varchar(20),city varchar(20),email varchar(20));
select * from customers;
select * from employees where age>30 order by salary desc;
select * from products where price>100 order by productName;
select * from students where marks>75 order by marks desc;
select * from customers where city in('newyork','los angeles');
select * from employees where salary!=50000;
select * from students where grade='A' or grade='b' and age>18;
select * from products where price between 50 and 200;

-- 23/01 like opeartor for pattern matching case insensitive
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
DELETE FROM DEMO WHERE ID=null;

DELIMITER $$
CREATE PROCEDURE `CUSTOMERSCITY` (CITY VARCHAR(20))
BEGIN
SELECT * FROM CUSTOMERS WHERE CITY=@CITY;
END$$
DELIMITER ;

DROP procedure CUSTOMERSCITY;
CALL CUSTOMERSCITY('LONDON');

-- 27-01 classwork
use demo;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              
    CourseName VARCHAR(100) NOT NULL,
    Duration INT,                         
    Fee DECIMAL(8, 2)
);
drop table students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,            
    StudentName VARCHAR(100) NOT NULL,
    CourseID INT,                          
    EnrollmentDate DATE,
    Marks INT,
    CONSTRAINT FK_Course FOREIGN KEY (CourseID)
    REFERENCES Courses(CourseID)           
);
INSERT INTO Courses (CourseID, CourseName, Duration, Fee) VALUES
(201, 'Mathematics', 12, 3000),
(202, 'Physics', 10, 2500),
(203, 'Chemistry', 14, 3500),
(204, 'Biology', 8, 2000),
(205, 'Computer Science', 16, 4000);

INSERT INTO Students (StudentID, StudentName, CourseID, EnrollmentDate, Marks) VALUES
(1, 'John Doe', 201, '2022-05-10', 85),  
(2, 'Jane Smith', 202, '2021-09-15', 90),
(3, 'Emily Davis', NULL, '2023-01-20', 75),
(4, 'Michael Brown', 204, '2022-11-25', 88), 
(5, 'Sarah Wilson', NULL, '2023-06-10', 92);

select * from students;
select * from courses;

select students.StudentName,courses.CourseName
 from students 
 inner join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 left join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 right join
 courses on students.CourseID = courses.CourseID;

select students.StudentName,courses.CourseName
 from students 
 left join
 courses on students.CourseID = courses.CourseID
UNION
select students.StudentName,courses.CourseName
 from students 
 right join
 courses on students.CourseID = courses.CourseID;
 
 select s1.studentName,s2.studentname,c.CourseName 
 from students s1 inner join students s2
 on s1.CourseID = s2.courseID
 inner join
 courses c
 on s1.CourseID = c.CourseID;

select students.StudentName,courses.CourseName
 from students 
 cross join
 courses;

select * from table1;
select * from table2;
-- union
select * from table1 union select * from table2;
select id,name from table1 union select id,name from table2;
-- union all
select * from table1 union all select * from table2 order by id;
-- Intersect
select * from table1 where exists(select * from table2 where table1.id=table2.id and table1.name=table2.name and table1.value-table2.value);
-- minus
select * from table1 where not exists(select * from table2 where table1.id=table2.id and table1.name=table2.name and table1.value=table2.value);
select * from table1 left join table2
on table1.id=table2.id and table1.name=table2.name and table1.value=table2.value
where table2.id is null ;

create table students1(id int,name varchar(20),marks int);
create table students2(id int,name varchar(20),marks int);
insert into students2(id,name,marks) values(1, 'Aniket', 95),
    (2, 'Bhavesh', 92),
    (3, 'Chetan', 93),
    (4, 'Dhanraj', 87);
    
select * from students1;
select * from students2;

select * from students1 union select * from students2;
select * from students1 union all select * from students2;

-- 29/01
create table information(user_id int,user_name varchar(20),user_password varchar(20));
insert into information(user_id,User_name,user_password) values (1,'admin','admin@123'),(2,"root",'root@123'),(1,"user","user@123");
select * from information;

start transaction;
set sql_safe_updates=0;
update information set user_name='aditya' where user_name='user';
rollback;
select * from information;

start transaction;
set sql_safe_updates=0;
update information set user_name='krishna' where user_name='ram';
rollback;
select * from information;

start transaction;
set sql_safe_updates=0;
update information set user_id=3 where user_name='aditya';
rollback;
select * from information;
commit;
alter table information add column misc1 varchar(20);
rollback;

alter table information drop column misc1;
truncate table information;
commit;
select * from information;
start transaction;
savepoint cp1;
insert into information(user_id,User_name,user_password) values (1,'admin','admin@123');
savepoint cp2;
insert into information(user_id,User_name,user_password) values (1,'admin','admin@123');
savepoint cp3;
rollback to cp1;

create user aditya ;
grant insert,select on table1 to aditya;
show grants for aditya;
create view accounts as
select * from accountholder;

select * from courses;

create table employee(id int,name varchar(20),salary decimal(10,2));

create table abc (id int,name varchar(20));

select * from abc;

alter table abc add column firstcolumn int first;

alter table abc add middlecolumn int after id;

insert into abc values(111,1,111,'aditya'),
					  
                      (111,1,111,'aditya');
                      
                      
select a.customerName,b.city from customers a join customers b where a.city=b.city;


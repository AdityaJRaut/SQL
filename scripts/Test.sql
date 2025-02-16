create database FinalTest;
use FinalTest;
create table Customers 
(CustomerID Int Primary Key,customerName varchar(20),Age int ,City varchar(20),oid int,pid int,
 foreign key (oid) references orders(orderNumber),
 foreign key(pid) references product(productId));
 
 CREATE TABLE Orders (
    orderNumber INT PRIMARY KEY,
    orderDate DATE,
    status VARCHAR(10)
);

-- Create Product table
CREATE TABLE Product (
    productId INT PRIMARY KEY,
    productName VARCHAR(50),
    productPrice INT
);


INSERT INTO Orders (orderNumber, orderDate, status) VALUES
(111, '2023-03-01', 'Yes'),
(222, '2024-03-02', 'No'),
(333, '2023-03-05', 'Yes'),
(444, '2024-03-06', 'Yes'),
(555, '2024-03-07', 'No');

-- Insert data into Product table
INSERT INTO Product (productId, productName, productPrice) VALUES
(1, 'Mobile', 50000),
(2, 'TV', 30000),
(3, 'Laptop', 80000),
(4, 'Scooty', 150000),
(5, 'AC', 25000);
select * from product order by productPrice desc;
-- Insert data into Customers table
INSERT INTO Customers (customerId, customerName, Age, city, oId, pId) VALUES
(1, 'Ramesh', 18, 'Pune', 111, 1),
(2, 'Jayesh', 15, 'Solapur', 555, 4),
(3, 'Shreya', 45, 'Pune', 222, 1),
(4, 'Rani', 23, 'Nagpur', 444, 3),
(5, 'Aishwarya', 23, 'Bangalore', 111, 2),
(6, 'Shruti', 30, 'Mumbai', 222, 5),
(7, 'Tushar', 50, 'Delhi', 111, 1),
(8, 'Aryan', 10, 'Mumbai', 555, 1),
(9, 'Akshay', 18, 'Nagpur', 222, 2),
(10, 'Varun', 25, 'Indapur', 444, 4);

select city,count(*) as CustomerCount from customers group by city;
select productName,count(*) from product where productPrice>50000 group by productName;
select productName from product order by productPrice desc limit 1; 

create view displayProduct as
select customername from customers inner join product
on customers.pid=product.productid;
select * from displayproduct;

select c1.customername as customer1 ,c2.customerName as customer2,c1.city
from customers c1 inner join customers c2 on c1.city=c2.city and c1.customerid>c2.customerid;

select c.customerName from customers c inner join product p on p.productid=c.pid and p.productname="mobile";
DELIMITER //
CREATE PROCEDURE ShowAllTables()
BEGIN
    SHOW TABLES;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE NthHighestPrice(IN N INT)
BEGIN
	SET N=N-1;
    SELECT DISTINCT productPrice 
    FROM Product 
    ORDER BY productPrice DESC 
    LIMIT 1 OFFSET N;
END //
DELIMITER ;
select * from product order by productPrice desc;
CALL NthHighestPrice(2); -- Example to get the 2nd highest price

/*
Feature					Stored Procedure										Function
Return Value			May or may not return a value							Always returns a value
Usage					Used for complex operations like data manipulation		Used for calculations and returning single values
Call Method				Called using CALL procedure_name();						Called inside SQL queries like SELECT function_name();
Use in Queries			Cannot be used directly in SELECT						Can be used in SELECT statements
Transaction Support		Supports transactions									Does not support transactions*/

/*Definition: A trigger is a set of SQL statements that automatically execute when a specified event occurs in a database 
			  (like INSERT, UPDATE, or DELETE).

Purpose of Triggers:

Enforce business rules and constraints
Automatically log changes in audit tables
Maintain data consistency across tables
Perform automatic calculations*/
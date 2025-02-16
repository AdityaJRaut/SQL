use demo;
-- Create Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

-- Insert 10 rows into Customer
INSERT INTO Customer (customer_id, name, email, city) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'New York'),
(2, 'Bob Smith', 'bob@example.com', 'Los Angeles'),
(3, 'Charlie Brown', 'charlie@example.com', 'Chicago'),
(4, 'David Wilson', 'david@example.com', 'Houston'),
(5, 'Emma Davis', 'emma@example.com', 'Phoenix'),
(6, 'Frank Thomas', 'frank@example.com', 'Philadelphia'),
(7, 'Grace White', 'grace@example.com', 'San Antonio'),
(8, 'Henry Harris', 'henry@example.com', 'San Diego'),
(9, 'Ivy Martin', 'ivy@example.com', 'Dallas'),
(10, 'Jack Lee', 'jack@example.com', 'San Jose');

-- Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Insert 10 rows into Product
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 1200.99),
(2, 'Smartphone', 799.49),
(3, 'Tablet', 450.00),
(4, 'Smartwatch', 199.99),
(5, 'Headphones', 149.99),
(6, 'Wireless Mouse', 39.99),
(7, 'Keyboard', 49.99),
(8, 'Monitor', 250.00),
(9, 'External Hard Drive', 89.99),
(10, 'Printer', 129.99);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert 10 rows into OrderDetails
INSERT INTO OrderDetails (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2024-02-01'),
(2, 2, 4, 2, '2024-02-02'),
(3, 3, 1, 1, '2024-02-03'),
(4, 4, 5, 3, '2024-02-04'),
(5, 5, 3, 2, '2024-02-05'),
(6, 6, 6, 1, '2024-02-06'),
(7, 7, 9, 4, '2024-02-07'),
(8, 8, 10, 1, '2024-02-08'),
(9, 9, 7, 2, '2024-02-09'),
(10, 10, 8, 1, '2024-02-10');

INSERT INTO OrderDetails (order_id, customer_id, product_id, quantity, order_date) VALUES
(11, 1, 2, 6, '2024-02-01');

select * from customer;
select * from product;
select * from orderdetails;


select order_id,order_date,p.product_name,c.name as customer_name from orderdetails o
 inner join Customer c on o.customer_id=c.customer_id 
 inner join product p on o.product_id=p.product_id;
 
 select * from customer c right join orderdetails o on c.customer_id=o.customer_id;
 
 select o.order_id,o.order_date,p.product_name,p.price from orderdetails o inner join product p where o.product_id=p.product_id;
 
 select p.product_id,p.product_name from product p right join orderdetails o on p.product_id=o.product_id group by p.product_id having count(o.order_id)>=1;
 
 select sum(quantity) as total_quantity,c.name from orderdetails o right join customer c on o.customer_id=c.customer_id group by c.customer_id;
 
 create view customerorders as
 select c.name,o.quantity as order_count from customer c right join orderdetails o on c.customer_id=o.customer_id;
 
 select * from customerorders;
 
 create view productSales as
 select p.product_name,o.quantity from product p right join orderdetails o on o.product_id=p.product_id;
 
 select * from productSales;
 drop view recentOrders;
 create view recentOrders as
 select * from orderdetails where order_date>=curdate()-interval '7' day;
 
 select * from recentOrders;
 
 create view HighQuantityOrder as
 select * from orderdetails where quantity>3;
 
 select * from HighQuantityOrder;
 
 create view CustomerDetails as
 select name,email,city from customer;
 
 select * from CustomerDetails;
 
 -- create stored procedure
 delimiter //
CREATE PROCEDURE display_max_fee(inout max int)
BEGIN
select max(fee) into max from courses where fee>max;
END//
delimiter ;



drop procedure insert_record;
 call insert_record(11,"bench",2000.00);
 
 select * from courses;
 
 set @max=3000;
 call display_max_fee(@max);
 select @max as Max_fee;
 drop procedure display_name;
 
Delimiter $$
create procedure `display_name`(out name varchar(20),in id int)
begin
select employeeName into name from employees where employeeID=id;
end
$$

set @id=5;
call display_name(@name,@id);
select @name as Employee_Name;

select * from employees;

create table products1(productPrice int,roi int);

insert into products1 values(100000,10);

select show_Discount(100000,10)  as DiscountedPrice;

-- trigger
insert into products1 values('20000',10),('15000',-98),('3000',30);

select * from products1;
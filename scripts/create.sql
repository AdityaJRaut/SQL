create table productDetails (productId int primary key,productName varchar(50),price decimal(10,2));

insert into productdetails values(9,'plates',2),(10,'box',250);
select count(price),productname from productdetails group by productname; 

select count(customername),city from customers group by city;

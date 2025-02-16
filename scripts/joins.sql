USE ADITYADB;
SELECT * FROM adityadb.orders;
INSERT INTO ORDERS VALUES(10310	,77	,'1996-09-20');

CREATE TABLE CUSTOMERSJOIN(CUSTOMERID INT,CUSTOMERNAME VARCHAR(20),CONTACTNAME VARCHAR(20),COUNTRY VARCHAR(20));
INSERT INTO CUSTOMERSJOIN VALUES(3,	'Taquería',	'Antonio Moreno',	'Mexico');

select * from orders;
select * from customersjoin;

select orders.orderid,customersjoin.customername from orders inner join customersjoin on orders.customerid=customersjoin.customerid;
select orders.orderid,customersjoin.customername from orders right join customersjoin on orders.customerid=customersjoin.customerid;
select orders.orderid,customersjoin.customername from orders left join customersjoin on orders.customerid=customersjoin.customerid;
select * from orders cross join customersjoin; -- same output for full join
select * from customersjoin A,customersjoin B where A.customerid<>B.customerid and A.country=B.country order by A.country;
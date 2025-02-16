use adityadb;

alter table employee_data rename column gender to EMP_GENDER;

SELECT * FROM EMPLOYEE_DATA;
select * from orders;
select * from emp_department;
select * from productdetails;

select * from emp_department where dpt_code >60
union
select * from emp_department where dpt_allotment > 20000;

create table employee_data5 as
select * from employee_data; 

create index genderindex on employee_data(emp_gender(10));
show indexes from employee_data;
select * from employee_data where emp_gender ='female';


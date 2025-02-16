use adityadb;
select * from employee_data;
select * from employeesalaryhigherthan50000;
select * from maxsalaryemployee;
select * from employeecountbylocation;
select * from managers;
select * from avgsalarybylocation;
select * from employeewithoutmanagers;
select * from employeenamestartwitha;
select * from employeewithhighestsalaryineachlocation;




create view employeesalaryhigherthan50000 as
select * from employee_data where emp_salary >50000;

create view maxsalaryemployee as
select max(emp_salary) as highestsalary from employee_data;

alter view employeecountbylocation as
select emp_location,count(emp_location) from employee_data group by emp_location;

alter view Managers as
select  distinct manager_id,manager_fname,manager_lname from manager_data where manager_id is not null;

create view avgsalarybylocation as
select avg(emp_salary),emp_location from employee_data group by emp_location; 

alter view employeewithoutmanagers as
select * from employee_data where emp_managerId is null;

alter view employeenamestartwitha as
select * from employee_data where EMP_FNAME like 'a%';

alter view employeewithhighestsalaryineachlocation as
select emp_fname,emp_lname,emp_location,emp_salary from employee_data e where emp_salary in (select max(emp_salary) from employee_data where emp_location =e.emp_location); 
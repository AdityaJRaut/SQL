use adityadb;
select * from employee_data;
select * from emp_department;
select * from employee_data where EMP_DEPT=57;
select * from employee_data where EMP_FNAME like "%R%";
select * from employee_data where EMP_LNAME like "__sio";
select * from employee_data where EMP_DEPT between 50 and 60;
select * from employee_data where EMP_LNAME in ("dosni","dosio");
select * from employee_data where EMP_IDNO is null;
select * from employee_data where EMP_IDNO is not null;
select count(emp_idno) from employee_data;
select sum(dpt_allotment) from emp_department;
select avg(dpt_allotment) from emp_department;
select max(emp_dept) from employee_data;
select min(dpt_allotment) from emp_department;
select group_concat(dpt_name) from emp_department;
select distinct emp_dept from employee_data;
select * from employee_data limit 5 offset 1; -- skips 1 row and display 5 rows after that

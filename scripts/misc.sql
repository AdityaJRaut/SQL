SELECT 
    emp_fname, emp_location, emp_salary
FROM
    employee_data e
WHERE
    emp_salary IN (SELECT 
            MAX(emp_salary)
        FROM
            employee_data
        WHERE
            emp_location = e.emp_location);

SELECT 
    productName,
    CASE
        WHEN price > 100 THEN 700
        WHEN price > 500 THEN 200
        ELSE 800
    END AS price
FROM
    productdetails;
    
 select * from students;
 
 update students 
 set studentgrade =
 case
 when studentmarks>90 then 'A'
 
 
 
 

    
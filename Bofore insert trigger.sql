create database Triggers_Example;
use triggers_Example;  
drop database Triggers_Example;

drop table employee;
CREATE TABLE employee( id int , name varchar(45) NOT NULL,  
					occupation varchar(35) NOT NULL,
					working_date date,
                    working_hours varchar(10)); 
 
select * from employee;
INSERT INTO employee VALUES (1,'Guru', 'Scientist', '2024-10-04', 4), 
							(2,'Tony', 'Bussines', '2024-10-04', 5),
                            (3,'Nami', 'Painter', '2024-10-04', 6),  
							(4,'Marco', 'Doctor', '2024-10-04', 9), 
                            (5,'Robin', 'Singer', '2024-10-04', 10),
                            (6,'nil', 'Engineer', '2024-10-04', 6);

-- BEFORE INSERT TRIGGER
DELIMITER //  
Create Trigger before_insert  
BEFORE INSERT ON employee FOR EACH ROW  
BEGIN  
IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;  
    END IF;  
END; //  
DELIMITER ;

INSERT INTO employee VALUES    
(7,'Prasad', 'senior developer', '2024-11-04', -10);  

-- THE TABLE 
select * from employee;

-- THE LIST OF THE TRIGGERS
show triggers;

-- TO DROP THE TRIGGER
DROP TRIGGER after_insert_employee;  







-- AFTER INSERT TRIGGER
CREATE TABLE employee_count ( total_employees INT DEFAULT 0);
drop table  employee_count ;
DELIMITER //
CREATE TRIGGER after_insert_employee
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    UPDATE employee_count SET total_employees = total_employees + 1;
END; //
DELIMITER ;

select * from employee_count ;
-- Inserting the values 
INSERT INTO employee VALUES (7, 'Riya', 'Developer', '2024-03-12', 9);
delete from employee where id = 9;
select * from employee;

select * from employee_count;



show triggers;


-- EXAMPLE : 2 
# Before Insert Trigger 
DELIMITER //  
Create Trigger before_insert_role  
BEFORE INSERT ON employee FOR EACH ROW  
BEGIN  
IF NEW.occupation = 'Scientist' THEN SET NEW.occupation = 'Dancer';  
    END IF;  
END; //  
DELIMITER ;

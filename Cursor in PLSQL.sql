-- Use the 'Company' database
USE Company;
create database Company;
-- Create the 'employee' table
CREATE TABLE employee (
    id INT,
    name VARCHAR(30) NOT NULL,
    age INT,
    salary INT
);
-- Insert data into the 'employee' table
INSERT INTO employee VALUES
    (1, 'Diviksha', 28, 50000),
    (2, 'Mayank', 35, 75000),
    (3, 'seema', 40, 65000),
    (4, 'Kshitija', 25, 40000),
    (5, 'Prabhakar', 30, 90000);

-- cursor in plsql 
-- when to use : to process the complex data row by row 
-- steps : declare , open , process the cursor , close the cursor 
-- cursor can be created in fucntiosn or stored procedures 

-- Create a stored procedure to calculate the total salary using a cursor
DELIMITER //

CREATE PROCEDURE CalculateTotalSalary()
BEGIN
    DECLARE done INT DEFAULT 0;              -- Flag to indicate the end of the cursor
    DECLARE emp_salary INT;                  -- Variable to hold the fetched salary
    DECLARE total_salary INT DEFAULT 0;      -- Variable to store the total salary
    DECLARE cur CURSOR FOR SELECT salary FROM employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN cur;

    -- Loop through each row in the result set
    fetch_loop: LOOP
        FETCH cur INTO emp_salary;           -- Fetch the next row
        IF done THEN
            LEAVE fetch_loop;                -- Exit the loop when all rows are processed
        END IF;
        SET total_salary = total_salary + emp_salary; -- Accumulate the salary
    END LOOP;

    -- Close the cursor
    CLOSE cur;

    -- Display the total salary
    SELECT total_salary AS Total_Salary;
END; //
DELIMITER ;

-- Call the stored procedure
CALL CalculateTotalSalary();

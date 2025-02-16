use demo;
DELIMITER //
CREATE PROCEDURE CalculateTotalSalary()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_salary INT;
    DECLARE total_salary INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT salary FROM employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    fetch_loop: LOOP
        FETCH cur INTO emp_salary;
        IF done THEN
            LEAVE fetch_loop;
        END IF;
        SET total_salary = total_salary + emp_salary;
    END LOOP;
    CLOSE cur;
SELECT total_salary AS Total_Salary;
END; //
DELIMITER ;

CALL CalculateTotalSalary();

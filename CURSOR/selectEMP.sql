create database cursor_practice;
use cursor_practice;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary decimal(8,2)
);

INSERT INTO emp VALUES (51, 'John Doe', 80000,20);
select * from emp;

INSERT INTO employees (employee_id, employee_name, department, salary) VALUES
(1, 'John Doe', 'IT', 80000),
(2, 'Jane Smith', 'HR', 75000),
(3, 'Bob Johnson', 'Finance', 90000),
(4, 'Alice Williams', 'IT', 82000),
(5, 'Charlie Brown', 'Finance', 88000),
(6, 'David Davis', 'HR', 76000),
(7, 'Eva White', 'IT', 81000),
(8, 'Frank Miller', 'Finance', 92000),
(9, 'Grace Lee', 'IT', 83000),
(10, 'Henry Green', 'HR', 77000),
(11, 'Ivy Carter', 'IT', 84000),
(12, 'Jack Robinson', 'Finance', 94000);

set @x='';
call selectEMP(@x);
select @x;

-- ---------------------------------------------------------------------------------------

USE `cursor_practice`;
DROP procedure IF EXISTS `cursor_practice`.`selectEMP`;
;

DELIMITER $$
USE `cursor_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectEMP`(inout var varchar(5000))
BEGIN
	declare employee_id INT;
    declare employee_name VARCHAR(50);
    declare department VARCHAR(50);
    declare salary int;
    declare done boolean default false;
    
    declare fetch_salary cursor for 
		select * from employees order by salary limit 10;
	
    declare continue handler for not found set done = true;
    
    open fetch_salary;
		fetch_loop:loop
			fetch fetch_salary into employee_id, employee_name,department,salary;
			if done then 
				leave fetch_loop;
			end if;
            set var = concat(var,' ',employee_id,' ',employee_name,' ',department,' ',salary,'\n');
        end loop;
	close fetch_salary;
END$$

DELIMITER ;
;

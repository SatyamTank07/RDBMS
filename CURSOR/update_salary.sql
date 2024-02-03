create database cursor_practice;
use cursor_practice;

call Update_salary;

-- ---------------------------------------------------------------------------------------

USE `cursor_practice`;
DROP procedure IF EXISTS `cursor_practice`.`Update_salary`;
;

DELIMITER $$
USE `cursor_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_salary`()
BEGIN
--  2) Create a cursor for updating the salary of emp working in deptno 10 by 20%.
--     If any rows are affected than display the no of rows affected. Use implicit cursor.
declare esal int;
declare dno int;
declare done boolean default false;

declare update_cursor cursor for
	select salary,deptno from emp;
declare continue handler for not found set done = true;

open update_cursor;

update_loop : loop
	
    fetch update_cursor into esal,dno;
	update emp set salary = salary*1.20 where deptno=3; 
	if done then 
		leave update_loop;
	end if;
end loop update_loop;
SELECT ROW_COUNT() AS RowsAffected;
CLOSE update_cursor;
END$$

DELIMITER ;
;

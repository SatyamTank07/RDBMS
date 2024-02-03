create database cursor_practice;
use cursor_practice;

set @x="";
call cursorEMP(@x);
select @x;

-- ---------------------------------------------------------------------------------------

USE `cursor_practice`;
DROP procedure IF EXISTS `cursor_practice`.`cursorEMP`;
;

DELIMITER $$
USE `cursor_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursorEMP`(inout var varchar(5000))
BEGIN
-- 1) Create a cursor for the emp table. Produce the output in following format:
-- {empname} employee working in department {deptno} earns Rs. {salary}.
-- EMP(empno, empname, salary, deptno);
declare ename varchar(25);
declare str1 varchar(5000) default ' ';
declare dno int;
declare esal int;
declare done boolean default false;
declare emp_cursor cursor for
	select empname,deptno,salary from emp;
declare continue handler for not found set done = true;

DROP TABLE IF EXISTS temp;
create table temp(result varchar(255));

open emp_cursor;
read_row:loop
	fetch emp_cursor into ename,dno,esal;
    
    set var = concat(var,ename,' employee working in department ',dno,' earns Rs. ',esal ," ", char(10));
	-- insert into temp values (str1);
if done then 
	leave read_row;
end if;

insert into temp values (select concat(ename,' employee working in department ',dno,' earns Rs. ',esal))
end loop;
-- select * from temp;
select substr(str1,2);

END$$

DELIMITER ;
;

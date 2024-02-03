create database procedure;
use procedure;

call arithmetic_operation(10,2);

-- ---------------------------------------------------------------------------------------

USE `procedure_practice`;
DROP procedure IF EXISTS `procedure_practice`.`arithmetic_operation`;
;

DELIMITER $$
USE `procedure_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `arithmetic_operation`(IN num1 INT, IN num2 INT)
BEGIN
	 DECLARE sum_result INT;
    DECLARE diff_result INT;
    DECLARE prod_result INT;
    DECLARE div_result FLOAT;

    -- Addition
    SET sum_result = num1 + num2;
    SELECT CONCAT('Sum: ', sum_result) AS Result;

    -- Subtraction
    SET diff_result = num1 - num2;
    SELECT CONCAT('Difference: ', diff_result) AS Result;

    -- Multiplication
    SET prod_result = num1 * num2;
   

    -- Division
    IF num2 != 0 THEN
        SET div_result = num1 / num2;
         SELECT prod_result 'Product', diff_result 'Difference', sum_result 'Sum', div_result 'Quotient';
--        SELECT CONCAT('Quotient: ', div_result) AS Result;
    ELSE
        SELECT 'Cannot divide by zero' AS Result;
    END IF;
END$$

DELIMITER ;
;

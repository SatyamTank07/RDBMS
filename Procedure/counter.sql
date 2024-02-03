create database procedure_practice;
use procedure_practice;

call counter;

-- ---------------------------------------------------------------------------------------

USE `procedure_practice`;
DROP procedure IF EXISTS `procedure_practice`.`counter`;
;

DELIMITER $$
USE `procedure_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `counter`()
BEGIN
	DECLARE counter INT DEFAULT 1;

    WHILE counter <= 20 DO
        SELECT counter AS odd_number;
        SET counter = counter + 2;
    END WHILE;
END$$

DELIMITER ;
;
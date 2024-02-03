create database procedure_practice;
use procedure_practice;


CALL result('123', 75, 85, 90);

-- ---------------------------------------------------------------------------------------
USE `procedure_practice`;
DROP procedure IF EXISTS `procedure_practice`.`result`;
;

DELIMITER $$
USE `procedure_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `result`(
	IN p_roll_number VARCHAR(20),
    IN p_subject1 INT,
    IN p_subject2 INT,
    IN p_subject3 INT)
BEGIN
DECLARE v_total INT;
    DECLARE v_percentage DECIMAL(5,2);
    DECLARE v_result VARCHAR(10);
    DECLARE v_grade CHAR(1);

    -- Calculate total marks
    SET v_total := p_subject1 + p_subject2 + p_subject3;

    -- Calculate percentage
    SET v_percentage := (v_total / 300) * 100;

    -- Determine result (Pass/Fail)
    IF v_percentage >= 40 THEN
        SET v_result := 'Pass';
    ELSE
        SET v_result := 'Fail';
    END IF;

    -- Calculate grade
    CASE
        WHEN v_percentage >= 90 THEN
            SET v_grade := 'A';
        WHEN v_percentage >= 80 THEN
            SET v_grade := 'B';
        WHEN v_percentage >= 70 THEN
            SET v_grade := 'C';
        WHEN v_percentage >= 60 THEN
            SET v_grade := 'D';
        ELSE
            SET v_grade := 'F';
    END CASE;

    -- Display results
    SELECT 
        'Roll Number: ' AS label, p_roll_number AS value
    UNION ALL
    SELECT 
        'Total Marks: ', v_total
    UNION ALL
    SELECT 
        'Percentage: ', v_percentage
    UNION ALL
    SELECT 
        'Result: ', v_result
    UNION ALL
    SELECT 
        'Grade: ', v_grade;

END$$

DELIMITER ;
;

create database cursor_practice;
use cursor_practice;


CREATE TABLE Student (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255),
  Std VARCHAR(10),
  B_date DATE,
  Sex CHAR(1)
);
INSERT INTO Student (id, Name, Std, B_date, Sex) VALUES
  (1, 'John Doe', '10th', '2000-01-15', 'M'),
  (2, 'Jane Smith', '11th', '2001-05-20', 'F'),
  (3, 'Bob Johnson', '9th', '1999-08-10', 'M'),
  (4, 'Alice Brown', '12th', '2002-03-25', 'F'),
  (5, 'Eva White', '11th', '2003-02-12', 'F'),
  (6, 'Michael Johnson', '10th', '2000-07-05', 'M'),
  (7, 'Sophia Miller', '9th', '1999-11-30', 'F'),
  (8, 'Daniel Davis', '12th', '2002-04-18', 'M'),
  (9, 'Olivia Anderson', '11th', '2001-08-22', 'F'),
  (10, 'David Wilson', '10th', '2000-03-15', 'M'),
  (11, 'Emma Thomas', '9th', '1999-05-28', 'F'),
  (12, 'Christopher Brown', '12th', '2002-09-10', 'M'),
  (13, 'Ava Jackson', '11th', '2001-12-03', 'F'),
  (14, 'Matthew Harris', '10th', '2000-06-17', 'M'),
  (15, 'Isabella Taylor', '9th', '1999-02-08', 'F'),
  (16, 'Andrew Smith', '12th', '2002-11-25', 'M'),
  (17, 'Grace Anderson', '11th', '2001-04-19', 'F'),
  (18, 'Nathan Clark', '10th', '2000-09-12', 'M'),
  (19, 'Lily Wilson', '9th', '1999-01-24', 'F');

CREATE TABLE Girl_Table (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255),
  Std VARCHAR(10),
  B_date DATE
);

CREATE TABLE Boy_Table (
  id INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255),
  Std VARCHAR(10),
  B_date DATE
);

SELECT * FROM Girl_Table;
call Stud_cursor();
select * from Boy_Table;

-- ---------------------------------------------------------------------------------------

USE `cursor_practice`;
DROP procedure IF EXISTS `cursor_practice`.`Stud_cursor`;
;

DELIMITER $$
USE `cursor_practice`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Stud_cursor`()
BEGIN
  -- Declare variables
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE student_rno INT;
  DECLARE student_name VARCHAR(255);
  DECLARE student_std VARCHAR(10);
  DECLARE student_b_date DATE;
  DECLARE student_sex CHAR(1);
  DECLARE boy_rno INT DEFAULT 0;
  DECLARE girl_rno INT DEFAULT 0;
	
  -- Create a sequence for Rollno entries
  -- CREATE SEQUENCE boy_seq START WITH 1 AUTO_INCREMENT BY 1;
  -- CREATE SEQUENCE girl_seq START WITH 1 AUTO_INCREMENT BY 1;

  -- Declare the cursor for fetching rows from the Student table
  DECLARE student_cursor CURSOR FOR
    SELECT id, Name, Std, B_date, Sex
    FROM Student;

  -- Declare continue handler for the cursor
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  -- Open the cursor
  OPEN student_cursor;
	
  -- Start the loop
  student_loop: LOOP
    -- Fetch data from the cursor into variables
    FETCH student_cursor INTO student_rno, student_name, student_std, student_b_date, student_sex;

    -- Check if no more rows to fetch
    IF done THEN
      LEAVE student_loop;
    END IF;

    -- Determine the target table and sequence based on gender
    IF student_sex = 'M' THEN
      -- SET boy_rno = NEXTVAL(boy_seq);
      INSERT INTO Boy_Table (id, Name, Std, B_date) VALUES (boy_rno, student_name, student_std, student_b_date);
    ELSEIF student_sex = 'F' THEN
      -- SET girl_rno = NEXTVAL(girl_seq);
      INSERT INTO Girl_Table (id, Name, Std, B_date) VALUES (girl_rno, student_name, student_std, student_b_date);
    END IF;

  END LOOP;

  -- Close the cursor
  CLOSE student_cursor;

  -- Drop the created sequences
  -- DROP SEQUENCE boy_seq;
  -- DROP SEQUENCE girl_seq;

END$$

DELIMITER ;
;

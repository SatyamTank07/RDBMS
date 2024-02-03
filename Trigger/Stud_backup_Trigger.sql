create database trigger_practice;
use trigger_practice;

CREATE TABLE student_T (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT
);

CREATE TABLE student_backup (
    student_id INT,
    student_name VARCHAR(50),
    age INT,
    backup_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserting sample data into the student table
INSERT INTO student_T (student_id, student_name, age) VALUES
(1, 'John Doe', 20),
(2, 'Jane Smith', 22),
(3, 'Bob Johnson', 21);

-- Updating the age of John Doe
UPDATE student_T SET age = 21 WHERE student_id = 1;

select * from student_T;
select * from student_backup;

-- ------------------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` TRIGGER `student_t_BEFORE_UPDATE` BEFORE UPDATE ON `student_t` FOR EACH ROW BEGIN
	INSERT INTO student_backup (student_id, student_name, age)
    VALUES (OLD.student_id, OLD.student_name, OLD.age);
END
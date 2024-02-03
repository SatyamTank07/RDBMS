create database procedure_practice;

use procedure_practice;

call fibonacci();

-- ---------------------------------------------------------------------------------------

USE `procedure_practice`;

DROP procedure IF EXISTS `procedure_practice`.`fibonacci`;

;

DELIMITER $ $ USE `procedure_practice` $ $ CREATE DEFINER = `root` @`localhost` PROCEDURE `fibonacci`() BEGIN DECLARE a int;

Declare n int;

set
    n = 1;

set
    a = 1;

loopname :loop if(n < 10) then
select
    a '\n';

set
    a = a + 2;

set
    n = n + 1;

else leave loopname;

end if;

end loop loopname;

END $ $ DELIMITER;

;
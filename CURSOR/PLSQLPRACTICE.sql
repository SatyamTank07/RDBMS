use PLSQLPRACTICE;

-- ---------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `hello`()
BEGIN
	select 'hello';
END

call hello;

-- ---------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `variables`()
BEGIN
	declare my_int int;
    declare my_txt text default 'Satyam';
    #declare my_pi float;
    declare my_date date default '2003-07-17';
    declare my_ans int;
    declare my_age int;
    
    
    set my_int = 50;
    set my_ans = power(my_int,2);
    set my_age = YEAR(NOW()) - YEAR(my_date);
    
    select my_age 'age',my_ans 'ans',my_txt 'Name';
END


call variables;	

-- ---------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `PracticeIN_OUT`(value int,OUT my_sqrt float)
BEGIN
	
    set my_sqrt=sqrt(value);
    select concat('sqrt of ',value,' is : ',my_sqrt) ' ans';
END

call PracticeIN_OUT(144,@result);
select @result;

-- ---------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `Conditional`(normal_price numeric(8,2),out discount_price numeric(8,2))
BEGIN
	if(normal_price > 500) then
		set discount_price = normal_price*0.8;
	elseif(normal_price>200) then
		set discount_price = normal_price*0.9;
	else	
		set discount_price=normal_price;
	end if;
END

call Conditional(600,@discount);
select @discount 'discount';

-- ---------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` PROCEDURE `simpleLOOP`()
BEGIN
	DECLARE counter INT DEFAULT 0;
	my_simple_loop: LOOP	
	SET counter=counter+1;
    IF counter-10 THEN 
	LEAVE my_simple_loop; 
    END IF;
	END LOOP my_simple_loop;
SELECT 'I can count to 10';
END

call simpleLOOP();

-- ---------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_procedure`()
BEGIN
	declare done boolean default false;
    declare dname text;
    
    declare my_cursor CURSOR  for
		select cname from deposit;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    open my_cursor;
	fetch my_cursor into dname;
    
    while not done do
     select concat('depositer name : ',dname);
     fetch my_cursor into dname;
	end while;
    close my_cursor;
END

call cursor_procedure;

-- ---------------------------------------------------------------------------------------

show tables;
select * from deposit;

CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectINTO`()
BEGIN
	declare total int;
	select sum(amount) into total from deposit;
    select total;
END


call selectINTO;

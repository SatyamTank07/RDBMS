create database Ass3;
use Ass3;

-- Create Deposit table
CREATE TABLE Deposit (
    ACTNO VARCHAR(5),
    CNAME VARCHAR(18),
    BNAME VARCHAR(18),
    AMOUNT Decimal(8,2),
    ADATE DATE
);

-- Insert data into Deposit table without TO_DATE function
INSERT INTO Deposit VALUES ('100', 'ANIL', 'VRCE', 1000, '1995-03-01');
INSERT INTO Deposit VALUES ('101', 'SUNIL', 'AJNI', 5000, '1998-01-04');
INSERT INTO Deposit VALUES ('102', 'MEHUL', 'KAROLBAGH', 3500, '1995-11-17');
INSERT INTO Deposit VALUES ('104', 'MADHURI', 'CHANDNI', 1200, '1995-12-17');
INSERT INTO Deposit VALUES ('105', 'PRAMOD', 'MGROAD', 3000, '1996-03-27');
INSERT INTO Deposit VALUES ('106', 'SANDIP', 'ANDHERI', 2000, '1996-03-31');
INSERT INTO Deposit VALUES ('107', 'SHIVANI', 'VIRAR', 1000, '1995-09-05');
INSERT INTO Deposit VALUES ('108', 'KRANTI', 'NEHRUPLACE', 5000, '1995-07-02');
INSERT INTO Deposit VALUES ('109', 'NAREN', 'POWAI', 7000, '1995-08-10');

-- Create Customer table
CREATE TABLE Customer (
    CNAME VARCHAR(18),
    CITY VARCHAR(18)
);

-- Insert data into Customer table
INSERT INTO Customer VALUES ('ANIL', 'CALCUTTA');
INSERT INTO Customer VALUES ('SUNIL', 'DELHI');
INSERT INTO Customer VALUES ('MEHUL', 'BARODA');
INSERT INTO Customer VALUES ('MANDAR', 'PATNA');
INSERT INTO Customer VALUES ('MADHURI', 'NAGPUR');
INSERT INTO Customer VALUES ('PRAMOD', 'NAGPUR');
INSERT INTO Customer VALUES ('SANDIP', 'SURAT');
INSERT INTO Customer VALUES ('SHIVANI', 'BOMBAY');
INSERT INTO Customer VALUES ('KRANTI', 'BOMBAY');
INSERT INTO Customer VALUES ('NAREN', 'BOMBAY');

-- Create Branch table
CREATE TABLE Branch (
    BNAME VARCHAR(18),
    CITY VARCHAR(18)
);

-- Insert data into Branch table
INSERT INTO Branch VALUES ('VRCE', 'NAGPUR');
INSERT INTO Branch VALUES ('AJNI', 'NAGPUR');
INSERT INTO Branch VALUES ('KAROLBAGH', 'DELHI');
INSERT INTO Branch VALUES ('CHANDNI', 'DELHI');
INSERT INTO Branch VALUES ('DHARAMPTEH', 'NAGPUR');
INSERT INTO Branch VALUES ('MGROAD', 'BANGALORE');
INSERT INTO Branch VALUES ('ANDHERI', 'BOMBAY');
INSERT INTO Branch VALUES ('VIRAR', 'BOMBAY');
INSERT INTO Branch VALUES ('NEHRUPLACE', 'DELHI');
INSERT INTO Branch VALUES ('POWAI', 'BOMBAY');

-- Create Borrow table
CREATE TABLE Borrow (
    LOANNO VARCHAR(5),
    CNAME VARCHAR(18),
    BNAME VARCHAR(18),
    AMOUNT decimal(8,2)
);

-- Insert data into Borrow table
INSERT INTO Borrow VALUES ('201', 'ANIL', 'VRCE', 1000);
INSERT INTO Borrow VALUES ('206', 'MEHUL', 'AJNI', 5000);
INSERT INTO Borrow VALUES ('311', 'SUNIL', 'DHARAMPETH', 3000);
INSERT INTO Borrow VALUES ('321', 'MADHURI', 'ANDHERI', 2000);
INSERT INTO Borrow VALUES ('375', 'PRAMOD', 'VIRAR', 8000);
INSERT INTO Borrow VALUES ('481', 'KRANTI', 'NEHRUPLACE', 3000);


-- Select all records from Deposit table
SELECT * FROM Deposit;

-- Select all records from Customer table
SELECT * FROM Customer;

-- Select all records from Branch table
SELECT * FROM Branch;

-- Select all records from Borrow table
SELECT * FROM Borrow;

-- 1. Give all the details of customer Anil.
select distinct * from customer c 
join deposit d on d.cname=c.cname
join borrow br on br.cname=c.cname
join branch b on d.bname= b.bname
where c.cname = 'anil'; 

-- 2. Give the name of customer having living city = Bombay and branch city = nagpur
select c.cname from customer c 
left join deposit d on d.cname=c.cname
left join branch b on b.bname=d.bname
where c.city='bombay' and b.city='nagpur';

-- 3. Give name of customer having same living city as their branch city.
select distinct c.cname from customer c 
left join deposit d on d.cname=c.cname
left join branch b on b.bname=d.bname
where c.city=b.city;

-- 4. Give the name of customer who are borrowers and depositers and having living city = Nagpur.
select distinct c.cname from customer c 
where c.cname in ((select cname from deposit) union (select cname from borrow)) 
		      and c.city='nagpur';

-- 5. Give the name of customers who are depositors having same branch city of Sunil
select distinct (c.cname) from CUSTOMER as c, DEPOSIT as d, branch as b
where c.cname=d.cname and c.cname != 'Sunil' and d.bname=b.bname and b.city in 
( select b.city from customer as c,deposit as d,branch as b where c.cname=d.cname and d.bname=b.bname and c.cname='Sunil');

-- 6. Give name of depositors having same living city as Anil and having deposit amount greater than 2000
select d.cname from deposit d , CUSTOMER c where c.cname=d.cname and c.city IN (select c1.city from customer c1 where c1.cname='anil') and d.amount > 2000;

-- 7. Give name of depositors having same branch as branch of Sunil.
select d.cname from deposit d where d.bname in (select d1.bname from deposit d1 where d1.cname='sunil');

-- 8. give name of borrowers having loan amount greater than amount of Parmod.
select br.cname from borrow br where br.amount > (select br1.amount from borrow br1 where br1.cname = 'PRAMOD');

-- 9. Give name of Customers living in same city where branch of depositor sunil is located.
select c.cname from customer c where c.city in (select b.city from branch b where bname in (select d.bname from deposit d where d.cname='sunil'));

-- 10. Give name of borrowers having deposit amount greater than 1000 and loan amount greater than 2000.
select br.cname from borrow br,deposit d where d.cname=br.cname and d.amount>1000 and br.amount > 2000;

-- 11. Give loan no., loan amount, account no. deposit amount of customers living in city Nagpur.
select br.loanno,br.amount,d.actno from borrow br,deposit d where br.cname = d.cname and d.cname in (select cname from customer where city='nagpur');

-- 12. Give loan no., loan amount, account no., deposit amount of customers having branch located at Bombay.
select br.loanno,br.amount,d.actno,d.amount,b.city from deposit as d,borrow as br,branch as b where br.cname=d.cname and br.bname=b.bname and b.city='Bombay';

-- 13. Give loan no, loan amount, account no., deposit amount, branch name, branch city and living city of Pramod.
select br.loanno,br.amount,d.actno,d.amount,d.bname 'branch' ,b.city 'branch city' ,c.city 'living city' from deposit d,borrow br,branch b,customer c where br.cname=d.cname and c.cname = d.cname and d.bname=b.bname and c.cname='Pramod';

-- 14. Give deposit details and Loan details of Customer in same city where Pramod is living.
select * from deposit d,borrow br,customer c where br.cname = d.cname and c.cname=d.cname and c.city = (select city from customer where cname='pramod');

-- 15. Give Name of Depositors having same Branch city as Sunil and having same Living city as Anil.
select d.cname from deposit d,branch b,customer c 
	where d.cname=c.cname and d.bname=b.bname
    and c.city = (select c.city from customer c,deposit d where c.cname=d.cname and d.cname='anil') 
    and b.city = (select b.city from branch b,deposit d where d.bname=b.bname and d.cname='sunil');
 
-- 16. Give name of depositors having amount greater than 5000 and having same living city as Pramod.
select d.cname from deposit d,customer c where amount > 5000 and d.cname=c.cname and c.city = (select c1.city from customer c1 where c1.cname = 'pramod');

-- 17. Give city of customer having branch city same as Pramod.
select distinct c.cname,c.city from customer c, deposit d,branch b where d.cname=c.cname and b.bname=d.bname and b.city = (select distinct b.city from branch b join deposit d on b.bname= d.bname and cname='pramod');
select c.city,c.cname from customer c,branch b,deposit d where d.cname=c.cname and d.bname=b.bname and  b.city = (select b1.city from deposit d1,branch b1 where d1.bname=d1.bname and d1.cname='pramod');

-- 18. Give branch city and living city of Pramod
select c.city'branch city',b.city'living city' from customer c,branch b,deposit d where d.cname=c.cname and d.bname=b.bname and  c.cname = 'pramod';

-- 19. Give branch city of sunil and branch city of Anil.
select b.city from customer c,branch b,deposit d where d.cname=c.cname and d.bname=b.bname and c.cname in ( 'sunil', 'anil'); 

-- 20. Give living city of Ashok and Living city of Ajay.
select city from customer where cname in ('ajay','ashok');
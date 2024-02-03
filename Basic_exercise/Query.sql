set sql_safe_updates = 0;
SET FOREIGN_KEY_CHECKS=0;
use exercises;

-- retrieving records
select CandFirstName,CandBirthDate from Candidate;
select * from CandAddr;
select QualID,ExamName,BoardName from CandQual;
select * from cintaddr;
select * from candqual where YearOfPassing < '2001';
select * from cintaddr where CintCity = 'Mumbal';

-- updating record
select * from CandQual;
update CandQual set YearOfPassing = '2004' where candid = 'CAN001';

select * from CintAddr;
update CintAddr set cintcity = 'Pune' where CintCity = 'Mumbal';

select * from CintAddr;
update CintAddr set cintcountry = 'India';

select * from Candidate;
select * from CandQual;
update CandQual set class = 'First' where candID = 'CAN002';

-- deleting records
select * from CintAddr;
delete from CintAddr where CintState = 'Maharashtra';

select * from Candidate;
delete from Candidate where CandSalExpected > 7000;

select * from CandQual;
delete from CandQual where yearofpassing < '2004';

select * from CintContMod;
delete from CintContMod where cintType = 'mobile'; 

select * from CandQual;
delete from CandQual;
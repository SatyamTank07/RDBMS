use exercises;

-- altering the table
desc candidate;
alter table candidate add column CandAge int(2);

select * from cintAddr;
alter table cintAddr add column cintPhone int(8);

desc client;
alter table client add column CintEmail varchar(20) after CintName;

desc candAddr;
alter table candAddr add column CandPager int(20) first;

desc cintAddr;
alter table cintAddr drop column cintPhone;

desc candqual;
alter table candqual modify ExamName varchar(24);

desc candidate;
alter table candidate modify CandEmail varchar(50) after CandReligion;

desc candidate;
alter table candidate modify CandReligion varchar(40) first;

desc candidate;
alter table candidate change CandAge CandCurrAge int(2);

desc cintaddr;
alter table cintaddr change cintcity city varchar(25) after cintCountry;

desc cintaddr;
alter table cintaddr change CintZip PinCode varchar(6) first;

desc client;
rename table client to CilentInfo;
desc CilentInfo;

select * from candidate;
truncate table candidate;
drop table candidate;
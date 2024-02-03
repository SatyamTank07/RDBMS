use Exercises;

create table canddetailscopy as select candid,candfirstname 'firstname',candbirthdate 'dob' from candidate; -- a
select * from canddetailscopy;

create table clientinfo as select cintid,cintname from client; -- b
select * from clientinfo;

create table newcand as select CandID,candfirstname as firstname,candlastname as lastname from candidate where 1=2; -- c
select * from newcand; 

select * from candqual;
create table QualiInfo as select * from candqual where 1=2;
insert into  QualiInfo select * from candqual;
select * from QualiInfo;

insert into  QualiInfo select * from candqual limit 5;
select * from QualiInfo;

create table clientadd as select * from client limit 4;
select * from client;
select * from cintaddr;
select c.cintid from client c,cintaddr ca where c.cintid=ca.cintid and c.cintid = 'CLT002';
SET FOREIGN_KEY_CHECKS=OFF;
delete from cintaddr where cintid in (select cintid from(select c.cintid from client c,cintaddr ca where c.cintid=ca.cintid and c.cintid = 'CLT002') as a);
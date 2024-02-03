use exercises;

select * from candidate;
select candid,candfirstname,CandTotExp*12 from candidate; -- a
select candid,candfirstname,CandTotExp*12'experienceInMonth' from candidate; -- b 

select * from candidate;
select candid,candfirstname,candsalexpected from candidate where candsalexpected>=7000 and candsalexpected<=10000;  -- c

select candid,candfirstname,CandTotExp from candidate where CandTotExp>=3 and CandTotExp<=5;  -- a 

select * from cintaddr;
select cintAddrID,CintCity from cintaddr where CintState like '__h%'; -- a
select cintAddrID,CintCity,cintcountry from cintaddr where cintcountry like '_n%' or cintcountry like '____a%';  -- b
select cintAddrID,CintCity,cintstate from cintaddr where cintcountry like 'N%' or cintstate like 'M%' or cintstate like 'W%';  -- c

select * from candQual where NOT(yearofpassing = 2005); -- d
select * from candQual where institutionname like '%mumbai%'; -- e

select * from candaddr where candcountry in ('india','china','africa');  -- f
select * from cintaddr where cintstate not in ('colombo','kenya','kerala');	 -- g

SELECT candid, candfirstname, candlastname
FROM candidate
WHERE candfirstname LIKE 'A%';  -- h

SELECT candid, candfirstname, candlastname
FROM candidate
WHERE candfirstname LIKE '%a' or candfirstname LIKE '%t'; -- i;

select * from cintcontmod where cinttype like '%b%'; -- j

select * from cintaddr;
SELECT cintaddrid, cintstate, cintcity
FROM cintaddr
WHERE LENGTH(cintcity) = 7;

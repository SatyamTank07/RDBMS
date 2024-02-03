-- 1. Print the absolute value of –15.35 
select abs(-15.35) as AbsoluteValue;

-- 2. Calculate 3.25 raised to 2.25
SELECT round(POWER(3.25, 2.25),2) AS Result;

-- 3. Display the rounded value of 3.1417 upto 3 decimal places.
select round(3.145,2) as result;

-- 4. Display the truncated value of 3.1417 upto 3 decimal places.
SELECT ROUND(3.1417, 3) AS TruncatedValue;
SELECT TRUNCATE(3.1417, 3) AS truncated_value;

-- 5. Find the square root of 17 and –13 if possible.
select round(sqrt(17),2) as res1;
select sqrt(-13) as res2;

-- 6. Print the value of e to the 5th power.
SELECT POWER(EXP(1), 5) AS Result; 
select exp(1) as ans;

-- 7. Print the ceil value and floor value of 15.72
select ceil(15.72) as ceil,floor(15.72) as floor;

-- 8. Find the value of 13 mod 5
select 13%5 as res;

-- 9. Add 275 months to your date of birth and display it.
select date(DATE_ADD(NOW(), INTERVAL 275 month)) AS future_date;
-- 10. Find the value sin of 100, and log 100 to the base 10
select sin(100) as sinvalue,log(10,100) as logvalue;

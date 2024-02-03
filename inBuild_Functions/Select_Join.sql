create database Assignment2;
use Assignment2;

create table Client_master (
	Client_No varchar(6) primary key ,
    Name varchar(20) NOT NULL,
    Address1 varchar(30),
    Address2 varchar(30),
    City varchar(15),
    Pincode varchar(8),
    State varchar(15),
    Bal_due decimal(10,2),
    check (Client_No like 'C%')
);
INSERT INTO Client_master (Client_No, Name, City, Pincode, State, Bal_due)
VALUES
    ('C00001', 'Ivan Bayross', 'Bombay', '400054', 'Maharashtra', 15000),
    ('C00002', 'Vandana Saitwal', 'Madras', '780001', 'Tamil Nadu', 0),
    ('C00003', 'Pramada Jaguste', 'Bombay', '400057', 'Maharashtra', 5000),
    ('C00004', 'Basu Navindgi', 'Bombay', '400056', 'Maharashtra', 0),
    ('C00005', 'Ravi Sreedharan', 'Delhi', '100001', 'Delhi', 2000),
    ('C00006', 'Rukmini', 'Bombay', '400050', 'Maharashtra', 0);
    
    
CREATE TABLE product_master (
	Product_no VARCHAR(6) PRIMARY KEY CHECK (Product_no LIKE 'P%'),
    Description VARCHAR(15) NOT NULL,
    Profit_percent DECIMAL(4, 2) NOT NULL,
    Unit_measure VARCHAR(10) NOT NULL,
    Qty_no_hand DECIMAL(8) NOT NULL,
    Reorder_lvl DECIMAL(8) NOT NULL,
    Sell_price DECIMAL(8, 2) NOT NULL CHECK (Sell_price > 0),
    Cost_price DECIMAL(8, 2) NOT NULL CHECK (Cost_price > 0)
);
INSERT INTO product_master (Product_no, Description, Profit_percent, Unit_measure, Qty_no_hand, Reorder_lvl, Sell_price, Cost_price)
VALUES
    ('P00001', '1.44 Floppies', 5, 'Piece', 100, 20, 525, 500),
	('P03453', 'monitors', 6, 'Piece', 10, 3, 12000, 11280),
	('P06734', 'mouse', 5, 'Piece', 20, 5, 1050, 1000),
	('P07865', '1.22 Floppies', 5, 'Piece', 100, 20, 525, 500),
	('P07868', 'keyboards', 2, 'Piece', 10, 3, 3150, 3050),
	('P07885', 'CD Drive', 2.5, 'Piece', 10, 3, 5250, 5100),
	('P07965', '540 HHD', 4, 'Piece', 10, 3, 8400, 8000),
	('P07975', '1.44 Drive', 5, 'Piece', 10, 3, 1050, 1000),
	('P08865', '1.22 Drive', 5, 'Piece', 2, 3, 1050, 1000);


create table salesman_master (
	salesman_no varchar(6) primary key check (salesman_no like 'S%'),
    Salesman_name varchar(20) not null,
    Address1 varchar(30),
    Address2 varchar(30),
    City varchar(20),
    Pincode varchar(8),
    State varchar(20),
    Sal_amt decimal(8,2) not null check (Sal_amt > 0),
    Tgt_to_get decimal(6,2) not null check (Tgt_to_get > 0),
    Ytd_sales decimal(6,2) not null,
    Remarks varchar(60)
);
INSERT INTO salesman_master (salesman_no, Salesman_name, Address1, Address2, City, Pincode, State, Sal_amt, Tgt_to_get, Ytd_sales, Remarks)
VALUES
    ('S00001', 'Kiran', 'A/14', 'Worli', 'Bombay', '400002', 'Maharashtra', 3000, 100, 50, 'Good'),
    ('S00002', 'Manish', '65', 'Nariman', 'Bombay', '400001', 'Maharashtra', 3000, 200, 100, 'Good'),
    ('S00003', 'Ravi', 'P-7', 'Bandra', 'Bombay', '400032', 'Maharashtra', 3000, 200, 100, 'Good'),
    ('S00004', 'Aashish', 'A/5', 'Juhu', 'Bombay', '400044', 'Maharashtra', 3500, 200, 150, 'Good');


CREATE TABLE sale_order (
    order_no VARCHAR(6) PRIMARY KEY CHECK (order_no LIKE 'O%'),
    order_date DATE,
    Client_no VARCHAR(6),
    Dely_Addr VARCHAR(25),
    Salesman_no VARCHAR(6),
    Dely_type CHAR(1) DEFAULT 'F' CHECK (Dely_type IN ('P', 'F')),
    Billed_yn CHAR(1),
    Dely_date DATE,
    Order_status VARCHAR(10) CHECK (Order_status IN ('In Process', 'Fulfilled', 'Back Order', 'Cancelled')),
    FOREIGN KEY (Client_no) REFERENCES Client_master(Client_no),
    FOREIGN KEY (Salesman_no) REFERENCES salesman_master(Salesman_no),
    CONSTRAINT chk_Dely_date CHECK (Dely_date > order_date)
);
INSERT INTO sale_order (order_no, order_date, Client_no, Dely_Addr, Salesman_no, Dely_type, Billed_yn, Dely_date, Order_status)
VALUES
    ('O19001', '1996-01-12', 'C00001', '12-Jan-96', 'S00001', 'F', 'N', '1996-01-20', 'In Process'),
    ('O19002', '1996-01-25', 'C00002', '25-Jan-96', 'S00002', 'P', 'N', '1996-01-27', 'Cancelled'),
    ('O46865', '1996-02-18', 'C00003', '18-Feb-96', 'S00003', 'F', 'Y', '1996-02-20', 'Fulfilled'),
    ('O19003', '1996-04-03', 'C00001', '03-Apr-96', 'S00001', 'F', 'Y', '1996-04-07', 'Fulfilled'),
    ('O46866', '1996-05-20', 'C00004', '20-May-96', 'S00002', 'P', 'N', '1996-05-22', 'Cancelled'),
    ('O19008', '1996-05-24', 'C00005', '24-May-96', 'S00004', 'F', 'N', '1996-05-26', 'In Process');

CREATE TABLE sale_order_details (
    order_no VARCHAR(6),
    Product_no VARCHAR(6),
    Qty_ordered decimal(8),
    Qty_disp decimal(8),
    Product_rate decimal(10, 2),
    PRIMARY KEY (order_no, Product_no),
    FOREIGN KEY (order_no) REFERENCES sale_order(order_no),
	FOREIGN KEY (Product_no) REFERENCES product_master(Product_no)
);
INSERT INTO sale_order_details (order_no, Product_no, Qty_ordered, Qty_disp, Product_rate)
VALUES 
('O19001', 'P00001', 4, 4, 525),
('O19001', 'P07965', 2, 1, 8400),
('O19001', 'P07885', 2, 1, 5250),
('O19002', 'P00001', 10, 0, 525),
('O46865', 'P07868', 3, 3, 3150),
('O46865', 'P07885', 3, 1, 5250),
('O46865', 'P00001', 10, 10, 525),
('O46865', 'P03453', 4, 4, 1050),
('O19003', 'P03453', 2, 2, 1050),
('O19003', 'P06734', 1, 1, 12000),
('O46866', 'P07965', 1, 0, 8400),
('O46866', 'P07975', 1, 0, 1050),
('O19008', 'P00001', 10, 5, 525),
('O19008', 'P07975', 5, 3, 1050);

-- Question 3
-- a) Find the name of all clients having ‘a’ as the second letter in their names
select * from Client_master where Name like '_a%';

-- b) Find out the clients who stay in a city whose second letter is ‘a’.
select * from client_master where City like '_a%';

-- c) Find the list of all client who stay in ‘Bombay’ or ‘Delhi’.
select * from client_master where City in ('Bombay','Delhi');

-- d) Print the list of client whose bal_due is greater then value 10000.
select * from client_master where Bal_due > 10000;

-- e) Print the information from sales_oeder table for order placed in the month of January.
SELECT * FROM sale_order WHERE month(order_date) = 1;

-- f) Display the order information for client_no ‘C00001’ and ‘C00002’.
select * from sale_order where Client_no IN ('C00001','C00002');

-- g) Find products whose selling price is greater than 2000 and less than or equal to 5000.
select * from product_master where Sell_price > 2000 and Sell_price < 5000;

-- h) Find products whose selling price is more than 1500. Calculate a new selling price as, original selling price * .15. Rename the new column in the above query as new_price.
select Product_no,Description,Sell_price,Sell_price*.15 'new_price' from product_master where Sell_price > 1500;

-- i) List the names, city and state of clients who r not in the state of ‘Maharastra’.
select name,state,city from client_master where state not in('Maharashtra');

-- j) Count the total number of orders.
select sum(qty_ordered) 'Total qty ordered' from sale_order_details; 

-- k) Calculate the average price of all the products.
select avg(product_rate) 'Average price' from sale_order_details;

-- l) Determine the maximum and minimum product prices. Rename the output as max_price and min_price respectively.
select max(product_rate)'Max price',min(product_rate)'Min price' from sale_order_details;

-- m) Count the number of products having price greater than or equal to 1500.
select count(product_no)'No of product having price >=1500' from sale_order_details where product_rate>=1500;

-- n) Find all the products whose qty_no_nahd is less than recorder level.
select description from product_master where qty_on_hand<reorder_lvl;

-- Question 4
-- a) Display the order number and day on which clients placed their order.
select order_no,DAY(order_date) as 'order_day' from sale_order;

-- b) Display the month (in alphabets) and date when the order must be delivered.
select month(dely_date)'Month',dely_date 'Date' from sale_order;

-- c) Display the order_date in the format ‘DD-Month-yy’. e.g. 12-February-96.
select date_format(order_date,'%d-%b-%y') 'Date Format' from sale_order;

-- d) Find the date, 15 days after today’s date.
select adddate(curdate(),15) '15 Day leter';

-- e) Find the number of days elapsed between today’s date and the delivery date of the orders placed by the clients.
select datediff(dely_date,order_date) 'Days elapsed' from sale_order;

-- Question 5
-- a) Print the description and total qty sold for each product.
select p.description,sum(sod.qty_ordered)'sum' from product_master p,sale_order_details sod where p.product_no=sod.product_no group by p.Product_no;

-- b) Find the value of each product sold.
select p.description,sum((p.sell_price * sa.qty_ordered))'value' from product_master p,sale_order_details sa where sa.product_no=p.product_no group by p.description;

-- c) Calculate the average qty sold for each client that has a maximum order value of 15000.00
SELECT cm.client_no, AVG(sod.qty_ordered) AS avg_qty_order
FROM client_master cm
JOIN sale_order so ON so.client_no = cm.client_no
JOIN sale_order_details sod ON sod.order_no = so.order_no
GROUP BY cm.client_no;

select cm.client_no,avg(sod.qty_ordered) from client_master cm, sale_order_details sod,sale_order so where  sod.order_no = so.order_no,so.client_no = cm.client_no group by cm.client_no;
select * from client_master;
select * from sale_order;
select * from sale_order_details;

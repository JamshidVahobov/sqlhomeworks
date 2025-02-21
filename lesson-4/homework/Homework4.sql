use homeworks
create table salesman(salesman_id int, name nvarchar(50),city nvarchar(50),commission float)
drop table salesman
insert into salesman values
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13)   ,
(5005,'Pit Alex','London',0.11)	   ,
(5006,'Mc Lyon','Paris',0.14)	   ,
(5007,'Paul Adam','Rome',0.13)	   ,
(5003,'Lauson Hen','San Jose',0.12)

--RETRIEVE DATA FROM TABLES
-----------------------------------1
select * from salesman
------------2
SELECT 'This is SQL Exercise, Practice and Solution'
--------------3
Select 2,3,4
--------------4
select 10+15
--------------5
select 10+15+63-8*9
---------------6
select name,city from salesman
----------------------
create table orders(ord_no int,purch_amt decimal(10,2),ord_date date,customer_id int,salesman_id int)
exec sp_help orders 
--drop table orders
select * from orders
----------  ----------  ----------  -----------  -----------
insert into orders values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001)
------------------------------------7
select ord_date,salesman_ID,ord_no,purch_amt from orders
------------------------------------8
select distinct salesman_id from orders
---------------------------------9
select name, city from salesman
where city = 'paris'
---------------------------------
select * from sys.tables
create table customers (customer_id int,cust_name varchar(50),city varchar(50),grade int,salesman_id int)
insert into customers values
(3002,'Nick Rimando','New York',100 ,5001),
(3007,'Brad Davis','New York',200 ,5001),
(3005,'Graham Zusi','California',200 ,5002),
(3008,'Julian Green','London',300 ,5002),
(3004,'Fabian Johnson','Paris',300 ,5006),
(3009,'Geoff Cameron','Berlin',100 ,5003),
(3003,'Jozy Altidor','Moscow',200 ,5007),
(3001,'Brad Guzan','London',null,5005)
-----------------------------------10
select * from customers
select customer_id,cust_name,city,grade,salesman_id from customers
where grade = 200
-----------------------------------
CREATE TABLE salesperson (ord_no INT,purch_amt DECIMAL(10, 2),ord_date DATE,customer_id INT,salesman_id INT)
INSERT INTO salesperson (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES 
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001)
-------------------------------------------------11
select ord_no, ord_date, purch_amt from salesperson
where salesman_id = 5001
---------------------------------------------- 
CREATE TABLE nobel_win (Year INT,Subject NVARCHAR(50),Winner NVARCHAR(100),Country NVARCHAR(50),Category NVARCHAR(50))
INSERT INTO nobel_win (Year, Subject, Winner, Country, Category) VALUES
(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist')
------------------------------------------------------12
select year, subject, winner from nobel_win
where year = 1970
--------------------------------------13
select * from nobel_win
select winner from nobel_win
where subject = 'literature' and year = 1971
-------------------------------------14
select year, subject from nobel_win
where winner = 'Dennis Gabor'
--------------------------------------15
select winner from nobel_win
where subject = 'physics' and year > 1950
----------------------------------16
select year, subject, winner, country from nobel_win
where subject = 'Chemistry' and year between 1965 and 1975
-------------------------------17
select * from nobel_win
where winner = 'Menachem Begin' or winner = 'Yitzhak Rabin'
----------------------------18
select year, subject, winner, country,category from nobel_win
where winner like 'Louis%'
---------------------19
select year, subject, winner, country, category from nobel_win
where (subject = 'physics' and year = 1970) or (subject = 'economics' and year = 1971)
--------------------20
select year, subject, winner, country,category from nobel_win
where year = 1970 and subject not in ('Physiology','Economics')
--------------------21
select year, subject, winner, country, category from nobel_win
where (subject = 'Physiology' and year < 1971) or (subject = 'peace' and year > 1974)
-------------------22
select year, subject, winner, country,category from nobel_win
where winner = 'Johannes Georg Bednorz'
----------------------23
select year, subject, winner, country,category from nobel_win
where subject not like 'p%'
order by year desc,winner asc
-----------------------24
select year, subject, winner, country,category from nobel_win
where year = 1970
ORDER BY
  CASE
    WHEN subject IN ('Economics', 'Chemistry') THEN 1
    ELSE 0
  END ASC,subject, winner
---------------------
CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME NVARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT)
INSERT INTO item_mast(PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12)
-----------------------------25
select pro_id, pro_name, pro_price, pro_com from item_mast
where PRO_PRICE >=200 and PRO_PRICE<=600
----------------------------26
select AVG(PRO_PRICE) FROM item_mast
where PRO_COM = 16
----------------------27
select pro_name as 'Item Name', pro_price as 'Price in Rs.' from item_mast
--------------------28
select pro_name, pro_price from item_mast
where pro_price >=250
order by PRO_PRICE desc, pro_name asc
--------------------29
select AVG(pro_price), pro_com from item_mast
group by pro_com
-------------------30
select pro_name, pro_price from item_mast
where pro_price = (select min(pro_price) from item_mast)
---------------------
CREATE TABLE emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME NVARCHAR(50),
    EMP_LNAME NVARCHAR(50),
    EMP_DEPT INT)
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57)
select * from emp_details
---------------------------31
select distinct emp_lname from emp_details
---------------------32
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname = 'Snares'
------------------33
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_dept = 57
-------------------------------------Boolean and Relational Operators
---------------1
select  customer_id, cust_name, city, grade, salesman_id from customers
where grade > 100
--------------2
select  customer_id, cust_name, city, grade, salesman_id from customers
where grade > 100 and city = 'New York'
--------------3
select  customer_id, cust_name, city, grade, salesman_id from customers
where grade > 100 or city = 'New York'
---------------4
select  customer_id, cust_name, city, grade, salesman_id from customers
where not grade > 100 or city = 'New York'
-------------5
select  customer_id, cust_name, city, grade, salesman_id from customers
where not grade > 100 or not city = 'New York'
------------6
select ord_no, purch_amt, ord_date, customer_id,salesman_id from orders
where not ((ord_date = '2012-09-10' and salesman_id > 5005) or purch_amt >1000)
------------7
select salesman_id, name, city, commission from salesman
where (commission > 0.10 and commission < 0.12)
-----------8
select ord_no, purch_amt, ord_date, customer_id, salesman_id from orders
where purch_amt < 200 or not (ord_date >= '2012-02-10' and customer_id < 3009)
----------9
Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
select * from orders
where not (ord_date = '2012-08-17' or (customer_id > 3005 and purch_amt <1000))
--------------------10
Select ord_no, purch_amt,(100 * purch_amt) / 6000 AS "Achieved %",(100 * (6000 - purch_amt) / 6000) AS "Unachieved %"
FROM orders WHERE (100 * purch_amt) / 6000 > 50;
----------------------11
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where emp_lname in ('Dosni','Mardy')
---------------------12
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where EMP_DEPT = 47 or EMP_DEPT = 63
--------------------Wildcard and Special operators
------------------1
select salesman_id, name, city, commission from salesman
where city = 'Paris' or city = 'Rome'
---------------------2
select salesman_id, name, city, commission from salesman
where city = 'Paris' or city = 'Rome'
---------------3
select salesman_id, name, city, commission from salesman
where city not in ('Paris','Rome')
---------------4
select customer_id, cust_name, city, grade, salesman_id from customers
where customer_id in (3007,3008,3009)
-----------------5
select salesman_id, name, city, commission from salesman
where (commission >= 0.12 and commission <=0.14)
----------------6
select  ord_no, purch_amt, ord_date, customer_id, salesman_id from orders
where (purch_amt >= 500 and purch_amt <= 4000) and purch_amt not in (948.50,1983.43)
----------------7
select salesman_id, name, city, commission from salesman
where name between 'A' and 'L'
-------------
select salesman_id, name, city, commission from salesman
where name like '[B-K]%'
-------------------8
select salesman_id, name, city, commission from salesman
where name not like '[B-L]%'
-----------------9
select customer_id, cust_name, city, grade, salesman_id from customers
where cust_name like 'B%'
------------------10
select customer_id, cust_name, city, grade, salesman_id from customers
where cust_name like '%n'
----------------11
select salesman_id, name, city, commission from salesman
where name like 'N__l%'
------------------12
CREATE TABLE testtable (col1 NVARCHAR(255))
INSERT INTO testtable (col1) VALUES
('A001/DJ-402\44_/100/2015'),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\44'),
('A001/DJ_402\44\2015'),
('A001/DJ-402%45\2015/200'),
('A001/DJ_402\45\2015%100'),
('A001/DJ_402%45\2015/300'),
('A001/DJ-402\44')
select * from testtable
where col1 like '%/_%' escape '/'
-------------------13
select * from testtable
where col1 not like '%/_%' escape '/'
-------------------14
select * from testtable
where col1 like '%/%'
-------------------15
select * from testtable
where col1 not like '%/%'
-------------------16
select * from testtable
where col1 like '%/_//%' escape '/'
---------------------17
select * from testtable
where col1 not like '%/_//%' escape '/'
------------------------18
select * from testtable
where col1 like '%/%%' escape '/'
---------------------19
select * from testtable
where col1 not like '%/%%' escape '/'
----------------------20
select customer_id, cust_name, city, grade, salesman_id from customers
where grade is null
---------------------------21
select customer_id, cust_name,city, grade, salesman_id from customers
where grade is not null
---------------------------22
select emp_idno, emp_fname, emp_lname, emp_dept from emp_details
where EMP_LNAME like 'D%'








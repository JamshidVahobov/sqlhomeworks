use homeworks
--Aggregate Functions
-------------1
select SUM(purch_amt) from orders
-------------2
select AVG(purch_amt) from orders
--------------3
select count(distinct salesman_id) from salesman
----------------4
select COUNT(distinct customer_id) from customers
----------------5
select count(*) as COUNT from customers
where grade > 1
---------------6
select max(purch_amt) from orders
---------------7
select min(purch_amt) from orders
----------------8
select city, max(grade) as maximum_grade from customers
group by city
-----------------9
select customer_id, max(purch_amt) as maximum_purchase_amount from orders
group by customer_id
---------------10
select customer_id, ord_date, max(purch_amt) from orders
group by customer_id, ord_date
---------------11
select salesman_id, max(purch_amt) from orders
where ord_date = '2012-08-17'
group by salesman_id
--------------12
select customer_id, ord_date, max(purch_amt) from orders
where purch_amt > 2000
group by customer_id, ord_date
-------------13
select customer_id, ord_date, max(purch_amt) from orders
where (purch_amt >= 2000 and purch_amt <= 6000)
group by customer_id, ord_date
---------------14
SELECT customer_id, ord_date, MAX(purch_amt) FROM orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) IN (2000, 3000, 5760, 6000)
-----------------15
select customer_id, max(purch_amt) from orders
where (customer_id >= 3002 and customer_id <= 3007)
group by customer_id
----------------16
select customer_id, max(purch_amt) from orders
where (customer_id >= 3002 and customer_id <= 3007)
group by customer_id
having max(purch_amt) > 1000
-------------------17
select salesman_id, max(purch_amt) from orders
where salesman_id between 5003 and 5008
group by salesman_id
------------------18
select count(ord_date) from orders
where ord_date = '2012-08-17'
-----------------19
select count(salesman_id) from salesman
where city is not null
-----------------20
select ord_date, salesman_id, count(*) from orders
group by ord_date, salesman_id
------------------21
select avg(PRO_PRICE) from item_mast
-------------------22
select count(*) from item_mast
where PRO_PRICE >= 350
-----------------23
select avg(pro_price) as 'Average Price', pro_com as 'Company ID' from item_mast
group by pro_com
-----------24
CREATE TABLE emp_department (DPT_CODE INT PRIMARY KEY,DPT_NAME VARCHAR(50),DPT_ALLOTMENT DECIMAL(10, 2))
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000)

select sum(dpt_allotment) from emp_department
----------------25
select emp_dept, count(*) from emp_details
group by emp_dept




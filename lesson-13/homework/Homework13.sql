use W3Resource
--Q1
select * from
Inventory.Orders o
where o.salesman_id = (
select salesman_id from Inventory.Salesman s
where s.name = 'Paul Adam'
)

--Q2
select * from
Inventory.Orders o
where o.salesman_id = (
select s.salesman_id from Inventory.Salesman s
where s.city = 'London'
)
--Q3
select 
o.*
from
Inventory.Salesman s, Inventory.Orders o
where s.salesman_id = o.salesman_id
and o.customer_id = 3007
--Q4
select
*
from Inventory.Orders o1
where o1.purch_amt > (
select AVG(o.purch_amt) from Inventory.Orders o
where o.ord_date = '2012-10-10'
)
--Q5
select 
o.*
from
Inventory.Salesman s, Inventory.Orders o
where s.salesman_id = o.salesman_id
and s.city = 'New York'
--Q6
select
s.commission
from
Inventory.Salesman s
where s.salesman_id in(
select
c.salesman_id
from
Inventory.Customer c
where c.city = 'Paris'
)
--Q7
select
*
from Inventory.Customer c
where c.customer_id = (
select
s.salesman_id - 2001
from Inventory.Salesman s
where s.name = 'Mc Lyon'
)
--Q8
select
c.grade, COUNT(*) as count
from
Inventory.Customer c
where grade > (
select
avg(c.grade)
from
Inventory.Customer c
where c.city = 'New York'
)
group by c.grade
--Q9
select
o.*
from
Inventory.Orders o
where o.salesman_id in (
	select salesman_id from Inventory.Salesman
	where commission in(
		select max(commission) from Inventory.Salesman
		)
	)

--Q10
select o.ord_no,o.purch_amt, o.ord_date , o.customer_id, o.salesman_id, c.cust_name
from Inventory.Orders o, Inventory.Customer c
where o.customer_id = c.customer_id
and o.ord_date = '2012-08-17'
--Q11
select
s.name, count(*) as numberofcount
from Inventory.Customer c
full join Inventory.Salesman s on c.salesman_id = s.salesman_id
group by s.name
having(count(*)>1)
--Q12

select
o.*
from Inventory.Orders o
where o.purch_amt > (
	select avg(purch_amt) from Inventory.Orders o1
	where o1.customer_id = o.customer_id
	)
--Q13
select
o.*
from Inventory.Orders o
where o.purch_amt >= (
	select avg(purch_amt) from Inventory.Orders o1
	where o1.customer_id = o.customer_id
	)
--Q14
select
o.ord_date, sum(o.purch_amt) sum
from Inventory.Orders o
group by o.ord_date
having(sum(o.purch_amt) > 1000+(
	select max(purch_amt) from Inventory.Orders o1 where o1.ord_date = o.ord_date))
--Q15
select
*
from Inventory.Customer
where exists (
	select * from Inventory.Customer c1 where c1.city = 'London')
--Q16
select
s.salesman_id,s.name, s.city, s.commission
from Inventory.Customer c
full join Inventory.Salesman s on c.salesman_id = s.salesman_id
group by s.salesman_id,s.name, s.city, s.commission
having(count(*)>1)
--Q17
select
s.salesman_id,s.name, s.city, s.commission
from Inventory.Customer c
full join Inventory.Salesman s on c.salesman_id = s.salesman_id
group by s.salesman_id,s.name, s.city, s.commission
having(count(*)=1)
--Q18
select
s.salesman_id,s.name,s.city,s.commission
from Inventory.Orders o
full join Inventory.Salesman s on o.salesman_id = s.salesman_id
full join Inventory.Customer c on o.customer_id = c.customer_id
group by s.salesman_id,s.name,s.city,s.commission
having (count(*)>1)
--Q19
select
*
from Inventory.Salesman s
where city = any(
	select city from Inventory.Customer)
--Q20
select
*
from Inventory.Salesman s
where city in (
	select city from Inventory.Customer)
--Q21
select 
distinct s.name
from Inventory.Salesman s
cross join Inventory.Customer c
--where LEFT(s.name,1) < LEFT(c.cust_name,1)
where s.name < c.cust_name
--Q22
select
*
from Inventory.Customer c
where c.grade > any(
	select grade from Inventory.Customer c1
	where c1.city < 'New York')
--Q23
select 
o.*
from Inventory.Customer c
full join Inventory.Orders o on c.customer_id = o.customer_id
where o.purch_amt > any (
	select o1.purch_amt from Inventory.Orders o1 where o1.ord_date = '2012-09-10')
--Q24
select 
o.*
from Inventory.Customer c
full join Inventory.Orders o on c.customer_id = o.customer_id
where o.purch_amt < any (
	select o1.purch_amt from Inventory.Orders o1 
	full join Inventory.Customer c1 on c1.customer_id = o1.customer_id 
	where c1.city = 'London')
--Q25
select 
o.*
from Inventory.Customer c
full join Inventory.Orders o on c.customer_id = o.customer_id
where o.purch_amt < (
	select max(o1.purch_amt) from Inventory.Orders o1 
	full join Inventory.Customer c1 on c1.customer_id = o1.customer_id 
	where c1.city = 'London')
--Q26
select 
c.*
from Inventory.Customer c
full join Inventory.Orders o on c.customer_id = o.customer_id
where c.grade > (
	select max(c1.grade) from Inventory.Orders o1 
	full join Inventory.Customer c1 on c1.customer_id = o1.customer_id 
	where c1.city = 'New York')
--Q27
select
s.name,s.city,sum(o.purch_amt) sum
from Inventory.Customer c, Inventory.Orders o,Inventory.Salesman s
where o.customer_id = c.customer_id and o.salesman_id = c.salesman_id and c.salesman_id = s.salesman_id and s.city = any(
select c1.city from Inventory.Customer c1) 
group by s.name,s.city
--Q28
select 
c.*
from Inventory.Customer c
where c.grade <> any(
	select max(c1.grade) from Inventory.Customer c1
	where c1.city = 'London')
--Q29
select 
c.*
from Inventory.Customer c
where c.grade <> any(
	select max(c1.grade) from Inventory.Customer c1
	where c1.city = 'Paris')
--Q30
select 
c.*
from Inventory.Customer c
where not c.grade = any(
	select c1.grade from Inventory.Customer c1
	where c1.city = 'Dallas')
--Q31
select 
c.com_name, AVG(im.pro_price) avg
from item_mast im
full join dbo.company_mast c on c.com_id = im.pro_com
group by c.com_name
--Q32
select 
c.com_name, AVG(im.pro_price) avg
from item_mast im
full join dbo.company_mast c on c.com_id = im.pro_com
group by c.com_name
having (AVG(im.pro_price)>=350)
--Q33
select im.pro_name,im.pro_price,cm.com_name from
item_mast im,
company_mast cm,
(select im.pro_com, max(im.pro_price) max from item_mast im group by im.pro_com) promax
where im.pro_com = promax.pro_com and im.pro_price = promax.max and im.pro_com = cm.com_id
--Q34
select * from dbo.emp_details
where emp_lname in ('Gabriel','Dosio')
--Q35
select * from dbo.emp_details
where emp_dept in (89,63)
--Q36
select * from dbo.emp_details
where emp_dept in (
	select dpt_code from dbo.emp_department edt
	where edt.dpt_allotment > 50000)
--Q37
select * from dbo.emp_department
where cast (dpt_allotment as int) > (
	select avg(cast (dpt_allotment as int)) from dbo.emp_department edt)

--Q38
select edt.dpt_name from emp_department edt,emp_details eds
where edt.dpt_code = eds.emp_dept
group by edt.dpt_name
having (count(*)>2)
--Q39
select eds.emp_fname,eds.emp_lname
from emp_details eds
where eds.emp_dept =(
select edt.dpt_code from emp_department edt
order by edt.dpt_allotment
offset 1 rows fetch next 1 rows only)

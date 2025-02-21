--SQL Exercises, Practice, Solution - JOINS
--Q1
use W3Resource
select * from inventory.Salesman
select * from inventory.Customer
select isa.name,ica.cust_name, isa.city
from Inventory.Salesman isa
join Inventory.Customer ica on isa.city = ica.city
--Q2
select ioa.ord_no, ioa.purch_amt,ica.cust_name,ica.city
from Inventory.Customer ica
join Inventory.Orders ioa on ica.customer_id = ioa.customer_id
where ioa.purch_amt between 500 and 2000
--Q3
select ica.cust_name, ica.city, isa.name as Salesman, isa.commission
from Inventory.Customer ica
left join Inventory.Salesman isa on ica.salesman_id = isa.salesman_id
--Q4
select ica.cust_name, ica.city, isa.name as Salesman, isa.commission
from Inventory.Customer ica
left join Inventory.Salesman isa on ica.salesman_id = isa.salesman_id
where isa.commission > 0.12
--Q5
select ica.cust_name, ica.city, isa.name as Salesman,isa.city, isa.commission
from Inventory.Customer ica
left join Inventory.Salesman isa on ica.salesman_id = isa.salesman_id
where isa.commission > 0.12
and ica.city <> isa.city
--Q6
select ioa.ord_no, ioa.ord_date, ioa.purch_amt, ica.cust_name, ica.grade, isa.name, isa.commission
from Inventory.Orders ioa
left join Inventory.Customer ica on ioa.customer_id = ica.customer_id
left join Inventory.Salesman isa on ioa.salesman_id = isa.salesman_id
--Q7 The result is different from the one on w3source
select *
from Inventory.Orders ioa
inner join Inventory.Customer ica on ioa.customer_id = ica.customer_id
inner join Inventory.Salesman isa on ioa.salesman_id = isa.salesman_id
--Q8
select ica.cust_name name,ica.city [customer city],ica.grade [grade],isa.name [salesman],isa.city [salesman city]
from Inventory.Customer ica
join Inventory.Salesman isa on ica.salesman_id = isa.salesman_id
order by ica.customer_id
--Q9
select ica.cust_name name,ica.city [customer city],ica.grade [grade],isa.name [salesman],isa.city [salesman city]
from Inventory.Customer ica
join Inventory.Salesman isa on ica.salesman_id = isa.salesman_id
where ica.grade < 300
order by ica.customer_id
--Q10
select ica.cust_name [customer name],ica.city [city],ioa.ord_no [order number],ioa.ord_date [order date],ioa.purch_amt [order amount]
from Inventory.Orders ioa
join inventory.Customer ica on ioa.customer_id = ica.customer_id
order by ioa.ord_date
--Q11
select ica.cust_name [customer name],ica.city [city],ioa.ord_no [order number],ioa.ord_date [order date],ioa.purch_amt [order amount],
isa.name [salesperson name], isa.commission [commission]
from Inventory.Orders ioa
left join inventory.Customer ica on ioa.customer_id = ica.customer_id
left join Inventory.Salesman isa on ioa.salesman_id = isa.salesman_id
--Q12
select ica.cust_name, ica.city, ica.grade, isa.name, isa.city
from Inventory.Salesman isa
left join Inventory.Customer ica on isa.salesman_id = ica.salesman_id
order by isa.salesman_id
--Q13 it is hard to understand
select ica.cust_name,	ica.city,	ica.grade,	isa.name,	ioa.ord_no, ioa.ord_date,	ioa.purch_amt
from Inventory.Salesman isa
left join Inventory.Customer ica on isa.salesman_id = ica.salesman_id
left join Inventory.Orders ioa on ica.customer_id = ioa.customer_id
--Q14 the result is different from the w3source
select ica.cust_name,	ica.city,	ica.grade,	isa.name,	ioa.ord_no, ioa.ord_date,	ioa.purch_amt
from Inventory.Customer ica
right join Inventory.Salesman isa on isa.salesman_id = ica.salesman_id
left join Inventory.Orders ioa on ica.customer_id = ioa.customer_id
where ioa.purch_amt >= 2000
and ica.grade is not null
--Q15
select ica.cust_name, ica.city, ioa.ord_no, ioa.ord_date, ioa.purch_amt
from Inventory.Customer ica
left join Inventory.Orders ioa on ica.customer_id = ioa.customer_id
--Q16
select ica.cust_name, ica.city, ioa.ord_no, ioa.ord_date, ioa.purch_amt
from Inventory.Customer ica
full join Inventory.Orders ioa on ica.customer_id = ioa.customer_id
where ica.grade is not null
--Q17
select isa.*,ica.*
from Inventory.Salesman isa
cross join Inventory.Customer ica
--Q18
select isa.*,ica.*
from Inventory.Salesman isa
cross join Inventory.Customer ica
where isa.city is not null
--Q19
select isa.*,ica.*
from Inventory.Salesman isa
cross join Inventory.Customer ica
where isa.city is not null
and ica.grade is not null
--Q20
select isa.*,ica.*
from Inventory.Salesman isa
cross join Inventory.Customer ica
where isa.city is not null
and ica.grade is not null
and isa.city <> ica.city
--Q21
create table dbo.company_mast (com_id int , com_name nvarchar(50))
select * from dbo.company_mast
insert into dbo.company_mast values
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech')
select cm.*,im.*
from dbo.company_mast cm
join dbo.item_mast im on cm.com_id = im.pro_com
--Q22
select im.*, cm.com_name
from dbo.item_mast im
left join dbo.company_mast cm on im.pro_com = cm.com_id
--Q23
select cm.com_name, avg(im.pro_price) as AVG_Price
from dbo.company_mast cm
join dbo.item_mast im on cm.com_id = im.pro_com
group by cm.com_name
--Q24
select cm.com_name, avg(im.pro_price) as AVG_Price
from dbo.company_mast cm
join dbo.item_mast im on cm.com_id = im.pro_com
group by cm.com_name
having avg(im.pro_price) >= 350
--Q25
select cm.com_name, im.pro_name,im.pro_price as AVG_Price
from dbo.company_mast cm
join dbo.item_mast im on cm.com_id = im.pro_com
and im.pro_price = (select max(im.pro_price) from dbo.item_mast im where im.pro_com = cm.com_id)
--Q26
create table dbo.emp_department (DPT_CODE int, DPT_NAME nvarchar(50), DPT_ALLOTMENT nvarchar(50))
insert into dbo.emp_department values
(57,'IT', 65000),
(63,'Finance', 15000),
(47,'HR',240000),
(27,'RD', 55000),
(89,'QC', 75000)

select ed.*, edt.DPT_NAME
from dbo.emp_details ed
left join dbo.emp_department edt on ed.emp_dept = edt.DPT_CODE
--Q27
select ed.emp_fname,ed.emp_lname, edt.DPT_NAME, edt.DPT_ALLOTMENT
from dbo.emp_details ed
left join dbo.emp_department edt on ed.emp_dept = edt.DPT_CODE
--Q28
select ed.emp_fname,ed.emp_lname, edt.DPT_NAME, edt.DPT_ALLOTMENT
from dbo.emp_details ed
join dbo.emp_department edt on ed.emp_dept = edt.DPT_CODE
and edt.DPT_ALLOTMENT > 50000
--Q29
select edt.DPT_NAME
from dbo.emp_details ed
right join dbo.emp_department edt on ed.emp_dept = edt.DPT_CODE
group by edt.DPT_NAME
having COUNT(*) > 2
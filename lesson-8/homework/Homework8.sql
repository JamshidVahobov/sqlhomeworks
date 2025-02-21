use Northwind
select * from sys.tables
--Q1
select * from Shippers
--Q2
select top 4 cs.CategoryName,cs.Description from Categories cs
--Q3
select es.FirstName,es.LastName,es.HireDate
from Employees es
where es.Title = 'sales representative'
--Q4
select es.FirstName,es.LastName,es.HireDate
from Employees es
where es.Title = 'sales representative'
and es.Country = 'USA'
--Q5
select os.OrderID, os.OrderDate
from Orders os
where os.EmployeeID = 5
--Q6
select ss.SupplierID,ss.ContactName,ss.ContactTitle 
from Suppliers ss
where ss.ContactTitle <> 'marketing manager'
--Q7
select * 
from Products ps
where ps.ProductName like '%queso%'
--Q8
select os.OrderID,os.CustomerID,os.ShipCountry 
from Orders os
where os.ShipCountry in ('France','Belgium')
--Q9
select os.OrderID,os.CustomerID,os.ShipCountry 
from Orders os
where os.ShipCountry in ('Brazil','Mexico','Argentina','Venezuela')
--Q10
select 
es.FirstName, es.LastName, es.Title,es.BirthDate
from Employees es
order by es.BirthDate
--Q11
select 
es.FirstName, es.LastName, es.Title
,format(es.BirthDate,'yyyy-MM-dd') as BirthDate
from Employees es
order by es.BirthDate
--Q12
select es.FirstName, es.LastName, es.FirstName + ' ' + es.LastName as [Full Name]
from Employees es
--Q13
select
ods.OrderID
, ods.ProductID
,ods.UnitPrice
, ods.Quantity
, ods.UnitPrice*ods.Quantity as [Total Price]
from OrderDetails ods
--Q14
select count(*) as [Total Customers]
from Customers
--Q15
select min(os.OrderDate) as [First Order]
from orders os
--Q16
select
cs.Country
from Customers cs
group by cs.Country
--Q17
select
cs.ContactTitle, COUNT(*) as TotalContactTitle
from Customers cs
group by cs.ContactTitle
order by TotalContactTitle desc
--Q18
select ps.ProductID,ps.ProductName, ss.CompanyName
from Products ps
join Suppliers ss on ps.SupplierID = ss.SupplierID
--Q19
select os.OrderID, os.CustomerID, shs.CompanyName
from Orders os
join Shippers shs on os.ShipVia = shs.ShipperID
--Q20
select
cs.CategoryName, COUNT(*) as [Total Number of products]
from Categories cs
join Products ps on cs.CategoryID = ps.CategoryID
group by cs.CategoryName
order by [Total Number of products] desc
--Q21
select
cs.Country,cs.City, COUNT(*) as Count
from Customers cs
group by cs.Country, cs.City
order by Count desc
--Q22
select ps.ProductID,ps.ProductName,ps.UnitsInStock,ps.ReorderLevel 
from Products ps
where ps.UnitsInStock < ps.ReorderLevel
order by ps.ProductID
--Q23
select ps.ProductID,ps.ProductName,ps.UnitsInStock,
ps.ReorderLevel, ps.Discontinued 
from Products ps
where (ps.UnitsInStock + ps.UnitsOnOrder) < ps.ReorderLevel
and ps.Discontinued = 0
order by ps.ProductID
--Q24
select
cs.CustomerID,
cs.CompanyName,
cs.Region
from Customers cs
order by
	case
	when cs.Region is null then 1
	else 0
	end,
	cs.Region,
	cs.CustomerID
--Q25
select top 3
ShipCountry, AVG(freight) as [Average freight price]
from orders
group by ShipCountry
order by [Average freight price] desc
--Q26
select top 3
ShipCountry, AVG(freight) as [Average freight price]
from orders
where YEAR(Orders.OrderDate) = 2015
group by ShipCountry
order by [Average freight price] desc
--Q27
Select	Top	3
ShipCountry	,AverageFreight	=	avg(freight)	
From Orders	
Where	
OrderDate
between	'1/1/2015'	and	'2015-12-31 11:00:00.000'
Group	By	ShipCountry	Order	By	AverageFreight	desc
--Q28
Select	Top	3
ShipCountry	,AverageFreight	=	avg(freight)	
From Orders	
Where	
OrderDate
between
(select dateadd(year,-1,max(Orders.OrderDate))
from Orders)
and
(select max(Orders.OrderDate)
from Orders)
Group	By	ShipCountry	Order	By	AverageFreight	desc
--Q29
select 
es.EmployeeID,es.LastName, os.OrderID, ps.ProductName,ods.Quantity
from Employees es
join Orders os on os.EmployeeID = es.EmployeeID
join OrderDetails ods on ods.OrderID = os.OrderID
join Products ps on ps.ProductID = ods.ProductID
--Q30
select
cs.CustomerID, os.OrderID
from Customers cs
left outer join Orders os on cs.CustomerID = os.CustomerID
where os.OrderID is null
--Q31
select
distinct Customers.CustomerID
from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
where
customers.CustomerID not in
(select
distinct customers.CustomerID
from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
where Orders.EmployeeID = 4)


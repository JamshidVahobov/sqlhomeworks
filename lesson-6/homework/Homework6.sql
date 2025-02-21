use W3Resource
--Q1
select * from Employee.employees
--Q2
select salary from Employee.employees
--Q3
select distinct job_name from Employee.employees
--Q4
select emp_name, 
format(salary * 1.15, 'C0') as salary
from Employee.employees
--Q5 
select emp_name + ' ' + job_name as 'Employee & Job' from Employee.employees
--Q6
select emp_name + '(' + LOWER(job_name) + ')' as Employee from Employee.employees
--Q7
select emp_id, emp_name, salary, UPPER(format(hire_date, 'MMMM dd, yyyy')) AS hire_date from Employee.employees
--Q8
select emp_name, LEN(TRIM(emp_name)) from Employee.employees
--Q9
select emp_id, salary, commission from Employee.employees
--Q10
select dep_id, job_name from Employee.employees
group by dep_id, job_name
--Q11
select * from Employee.employees
where dep_id <> 2001
--Q12
select * from Employee.employees
where year(hire_date) < 1991
--Q13
select avg(salary) from Employee.employees
where job_name = 'analyst'
--Q14
select * from Employee.employees
where emp_name = 'BLAZE'
--Q15
select * from Employee.employees
where commission > salary
--Q16
select * from Employee.employees
where salary*1.25 > 3000
--Q17
select emp_name, LEN(TRIM(emp_name)) from Employee.employees
where LEN(TRIM(emp_name)) = 6 
--Q18
select * from Employee.employees
where MONTH(hire_date) = 1
--Q19
select e.emp_name + ' works for ' + (select m.emp_name from Employee.employees m where m.emp_id = e.manager_id ) as Employee from Employee.employees e
--Q20
select * from Employee.employees
where job_name = 'Clerk'
--Q21
select * from Employee.employees
where ((year(getdate()) - YEAR(hire_date)) > 27)
--Q22
select * from Employee.employees
where salary < 3500
--Q23
select emp_name, job_name,  salary from Employee.employees
where job_name = 'analyst'
--Q24
select * from Employee.employees
where YEAR(hire_date) = 1991
--Q25
select emp_id, emp_name, hire_date,salary from Employee.employees
where hire_date < '1991-04-01'
--Q26
select emp_name, job_name from Employee.employees
where manager_id is null
--Q27
select * from Employee.employees
where hire_date = '1991-05-01'
--Q28 THERE IS A QUESTION HOW TO DO IT
select emp_id, emp_name, salary, DATEDIFF(day,hire_date,getdate()) as experience from Employee.employees
--Q29
select emp_id, emp_name, salary, DATEDIFF(day,hire_date,getdate()) as experience from Employee.employees
where (salary/30>100)
--Q30
select emp_name from Employee.employees
where (DATEDIFF(day, hire_date, '1999-12-31')<8*365)
--Q31
select * from Employee.employees
where salary%2 <> 0
--Q32
select * from Employee.employees where len(trim(str(salary,4,0))) = 3
--Q33
select * from Employee.employees
where MONTH(hire_date) = 4
--Q34
select * from Employee.employees
where DAY(hire_date) < 19
--Q35
select * from Employee.employees
where DATEDIFF(MONTH,hire_date,getdate())%12 > 10
--Q36
select * from Employee.employees
where (dep_id = 3001 or dep_id = 1001) and (YEAR(hire_date) = 1991)
--Q37
select * from Employee.employees
where (dep_id = 2001 or dep_id = 1001)
--Q38
select * from Employee.employees
where (dep_id = 2001 and job_name = 'Clerk')
--Q39
--1
select * from Employee.employees
where commission < salary and
(salary+commission)*12 <34000 and
job_name = 'salesman' and
dep_id = 3001
--Q40
select * from Employee.employees
where job_name = 'Clerk' or job_name = 'manager'
--Q41
select * from Employee.employees
where MONTH(hire_date) <> 2
--Q42
select * from Employee.employees
where YEAR(hire_date) = 1991
--Q43
select * from Employee.employees
where year(hire_date) = 1991 and month(hire_date) = 6
--Q44
select * from Employee.employees
where salary*12 between 24000 and 50000
--Q45
select * from Employee.employees
where hire_date in ('1991-05-01','1991-02-20','1991-12-03')
--Q46
select * from Employee.employees
where manager_id in (63679, 68319, 66564, 69000)
--Q47
select * from Employee.employees
where YEAR(hire_date) = 1991 and MONTH(hire_date) > 6
--Q48
select * from Employee.employees
where hire_date between '1990-01-01' and '1999-12-31'
--Q49
select * from Employee.employees
where job_name = 'manager' and (dep_id = 1001 or dep_id = 2001)
--Q50
select * from Employee.employees
where (MONTH(hire_date) = 2) and (salary between 1001 and 2000)
--Q51
select * from Employee.employees
where year(hire_date) <> 1991
--Q52
select e.emp_id, e.emp_name, e.job_name, e.manager_ID, e.hire_date, e.salary, e.commission, e.dep_ID, d.dep_name 
from Employee.employees e, Employee.department d
where e.dep_id = d.dep_id
--Q53
select e.emp_name, e.job_name, e.salary*12 as Annual_salary,e.dep_id, d.dep_name, s.grade
from Employee.employees e, Employee.department d, Employee.salary_grade s
where e.dep_id = d.dep_id and
e.salary between s.min_salary and s.max_salary and
((e.salary*12)>=60000 or job_name <> 'analyst')
--Q54
select e.emp_name, e.job_name, e.manager_ID, e.salary, d.emp_name as 'manager name', d.salary as 'managers salary' 
from Employee.employees e, Employee.employees d
where e.manager_id = d.emp_id
and e.salary > d.salary
--Q55
select e.emp_name, e.job_name, e.manager_ID, e.salary, d.dep_location as 'dep_location', d.dep_name as 'department name' 
from Employee.employees e, Employee.department d
where e.dep_id = d.dep_id
and d.dep_location = 'perth'
and e.salary between 2000 and 5000
--Q56
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.grade as 'grade' 
from Employee.employees e, Employee.salary_grade d
where e.salary between d.min_salary and d.max_salary
and e.hire_date < '1992-12-31'
and d.grade <> 4
--Q57
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.emp_name as 'Manager name' 
from Employee.employees e, Employee.employees d
where e.manager_id = d.emp_id
and d.emp_name = 'Jonas'
--Q58
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.grade as 'grade' 
from Employee.employees e, Employee.salary_grade d
where e.salary between d.min_salary and d.max_salary
and e.emp_name = 'frank'
and e.salary = d.max_salary
--Q59
select * from Employee.employees
where (job_name = 'manager' or job_name = 'analyst')
and (salary between 2000 and 5000)
and commission is null
--Q60
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.dep_location as 'department location' 
from Employee.employees e, Employee.department d
where d.dep_location in ('perth','melbourne')
and DATEDIFF(month,e.hire_date,getdate())%12 > 10
and e.dep_id = d.dep_id
--Q61
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.dep_location as 'department location' 
from Employee.employees e, Employee.department d
where (d.dep_location = 'sydney' or d.dep_location = 'melbourne')
and year(e.hire_date) = 1991
and e.salary between 2000 and 5000
and e.dep_id = d.dep_id
--Q62
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.dep_location, e.dep_id, d.dep_name, s.grade 
from Employee.employees e, Employee.department d, Employee.salary_grade s
where (d.dep_location = 'perth' or d.dep_location = 'melbourne')
and DATEDIFF(year, e.hire_date,GETDATE()) > 25
and e.salary between s.min_salary and s.max_salary
and e.dep_id = d.dep_id
and d.dep_name = 'marketing'
and s.grade in (3,4,5)
--Q63
select e.emp_name, e.job_name, e.manager_ID, e.salary,e.hire_date, d.emp_name , d.job_name, d.manager_ID, d.salary,d.hire_date  
from Employee.employees e, Employee.employees d
where e.manager_id = d.emp_id
and e.hire_date < d.hire_date
--Q64
select e.*, d.* 
from Employee.employees e, Employee.salary_grade d
where e.salary between d.min_salary and d.max_salary
and d.grade = 4
--Q65    THERE IS A QUESTION
select e.emp_name 
from Employee.employees e, Employee.department d, Employee.salary_grade s
where YEAR(e.hire_date) > 1991
and ((e.emp_name not in ('marker','adelyn')) 
or (d.dep_name not in ('production','audit')))
and e.dep_id = d.dep_id
and e.salary between s.min_salary and s.max_salary
--Q66
select * from Employee.employees
order by salary
--Q67
select * from Employee.employees
order by dep_id, job_name desc
--Q68
select distinct job_name from Employee.employees
--Q69
select emp_ID, emp_name, salary, salary/30 as Daily_Salary, 12*salary as Anual_Salary from Employee.employees
order by Anual_Salary
--Q70
select * from Employee.employees
where job_name in ('clerk','analyst')
order by job_name desc
--Q71
select d.dep_location
from Employee.employees e, Employee.department d
where e.emp_name = 'clare'
and e.dep_id = d.dep_id
--Q72
select * from Employee.employees
where hire_date in ('1991-05-01','1991-12-03','1990-01-19')
--Q73
select * from Employee.employees
where salary < 1000
order by salary
--Q74
select * from Employee.employees
order by salary
--Q75
select * from Employee.employees
order by job_name,emp_id desc
--Q76
select distinct job_name from Employee.employees
where dep_id in (2001,3001)
--Q77
select * from Employee.employees
where job_name not in ('president','manager')
order by salary
--Q78
select * from Employee.employees
where 12*salary < 25000
order by salary
--Q79
select emp_id, emp_name, 12*salary, salary/30 from Employee.employees
where job_name = 'Salesman'
--Q80  THERE IS A QUESTION
select emp_id, emp_name, hire_date, getdate(), DATEDIFF(day, hire_date, GETDATE())
from Employee.employees
order by DATEDIFF(day, hire_date, GETDATE()) 
--Q81
select * from Employee.employees
where hire_date > '1991-06-30'
and YEAR(hire_date) = 1991
--Q82
select e.*, d.*
from Employee.employees e, Employee.department d
where e.dep_id = d.dep_id
and d.dep_name in ('finance','audit')
order by d.dep_id
--Q83
select e.*, d.*
from Employee.employees e, Employee.salary_grade d
where e.salary between d.min_salary and d.max_salary
--Q84
select e.emp_name, e.job_name, d.dep_name, e.salary, s.grade
from Employee.employees e, Employee.department d, Employee.salary_grade s
where e.dep_id =d.dep_id
and e.salary between s.min_salary and s.max_salary
order by d.dep_id
--Q85
select e.emp_name, e.job_name, d.dep_name, e.salary, s.grade
from Employee.employees e, Employee.department d, Employee.salary_grade s
where e.dep_id =d.dep_id
and e.salary between s.min_salary and s.max_salary
and e.job_name <> 'clerk'
order by e.salary desc
--Q86
select e.emp_id, e.emp_name,e.salary, d.dep_name, s.grade, DATEDIFF(day,e.hire_date,GETDATE()), 12*e.salary
from Employee.employees e, Employee.department d, Employee.salary_grade s
where e.dep_id =d.dep_id
and e.salary between s.min_salary and s.max_salary
and d.dep_id in (1001,2001)
order by d.dep_id
--Q87
select e.*, d.*
from Employee.employees e, Employee.department d
where e.dep_id =d.dep_id
and d.dep_id in (1001,2001)
order by d.dep_id
--Q88
select e.*, d.*
from Employee.employees e, Employee.employees d
where e.manager_id = d.emp_id
and e.hire_date < d.hire_date
--Q89
select emp_id, emp_name, salary, dep_id
from Employee.employees
where dep_id = 1001
--Q90
select max(salary) as Max from Employee.employees
--Q91
select job_name, AVG(salary),AVG(salary+commission)
from Employee.employees
group by job_name
order by AVG(salary+commission) desc
--Q92
select job_name, sum(salary*12) as sum
from Employee.employees
where YEAR(hire_date) = 1991
group by job_name
--Q93
select e.emp_id, e.emp_name, d.dep_id ,d.dep_location
from Employee.employees e, Employee.department d
where e.dep_id = d.dep_id
--Q94
select e.emp_id, e.emp_name, d.dep_id ,d.dep_location
from Employee.employees e, Employee.department d
where e.dep_id = d.dep_id
and e.dep_id in (1001,2001)
--Q95
select e.emp_id, e.emp_name, e.salary,d.grade 
from Employee.employees e, Employee.salary_grade d
where e.salary between d.min_salary and d.max_salary
--Q96
select d.emp_id as Manager_id, count(*) as Count
from Employee.employees e, Employee.employees d
where d.emp_id = e.manager_id
group by d.emp_id
--Q97
select dep_id, job_name, COUNT(*) as count
from Employee.employees
group by dep_id, job_name
--Q98
select dep_id, COUNT(*) as count
from Employee.employees
group by dep_id
having COUNT(*) > 2
--Q99
select s.grade, COUNT(*) as Count , MAX(e.salary) as Max_Salary
from Employee.employees e, Employee.salary_grade s
where e.salary between s.min_salary and s.max_salary
group by s.grade
--Q100
select d.dep_name, s.grade, COUNT(*) as Count
from Employee.employees e, Employee.department d, Employee.salary_grade s
where e.salary between s.min_salary and s.max_salary
and e.dep_id = d.dep_id
and s.grade in 
(select s.grade
from Employee.employees e, Employee.salary_grade s 
where e.job_name = 'Salesman'
and e.salary between s.min_salary and s.max_salary
group by s.grade
having COUNT(*) >= 2 )
group by d.dep_name, s.grade
having COUNT(*) >= 2
--Q101
select dep_id, COUNT(*) as Count
from Employee.employees
group by dep_id
having COUNT(*) <= 4
--Q102
select dep_id, COUNT(*) as Count
from Employee.employees
group by dep_id
having COUNT(*) >= 2
--Q103
select emp_id, count(*) as Count
from Employee.employees
group by emp_id
--Q104
select count(*) as count, AVG(salary) as Average_Salary, dep_id, job_name 
from Employee.employees
group by dep_id, job_name
--Q105
select emp_name
from Employee.employees
where len(emp_name) = 6
and emp_name like 'A%'
--Q106
select *
from Employee.employees
where len(emp_name) = 6
and emp_name like '__r%'
--Q107
select *
from Employee.employees
where len(emp_name) = 6
and emp_name like 'A____N'
--Q108
select * 
from Employee.employees
where FORMAT(hire_date, 'MMM') like '_a%' 
--Q109
select * from Employee.employees
where emp_name like '%ar%'
--Q110
Select * from Employee.employees
where year(hire_date) between 1990 and 1999
--Q111 THERE IS A QUESTION
select emp_id--, trim(emp_id)
from Employee.employees
where emp_id not like '68%'
--Q112
select * from Employee.employees
where emp_name like '%a%'
--Q113
select * from Employee.employees
where LEN(emp_name) = 6
and emp_name like '%s'
--Q114
select * from Employee.employees
where FORMAT(hire_date,'MMMMMMMMMM') like '%a%'
--Q115
select * from Employee.employees
where FORMAT(hire_date,'MMMMMMMMMM') like '_a%'
---------------THE END






--Find in which match 20 th goal was scored
use W3Resource

with cte as(
select *, sum(goal_score) over (order by match_no) gls from soccer.match_details)
select top 1 * from cte
where gls > 22

--
create table #EmptySeats(Number int, Empty varchar(1))

insert into #EmptySeats values (1, 'Y'), (2, 'N'), (3, 'N'), (4, 'Y'), (5, 'Y'), (6, 'Y'), (7, 'N'),
(8, 'Y'), (9, 'Y'), (10, 'Y'), (11, 'N'), (12, '')

select * from #EmptySeats

--Find 3 successive empty seats
with cte as
(select *,empty + '-' + LEAD(empty) over(order by (select null)) + '-' + LEAD(empty,2) over(order by (select null)) as l2,
cast(number as varchar(50)) + '-' + cast(LEAD(number) over(order by (select null)) as varchar(50)) + '-' + cast(LEAD(number,2) over(order by (select null)) as varchar(50)) as l3
from #EmptySeats)
select cte.l3 from cte
where cte.l2 = 'Y-Y-Y'

select *, LEAD(empty) over(order by (select null)) as l1, LEAD(empty,2) over(order by (select null)) as l2 from #EmptySeats
where empty = 'Y' and  l1 = 'Y' and  l2 = 'Y'
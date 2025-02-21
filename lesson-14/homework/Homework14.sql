--Homework for recursive cte. Find the hierarchial level of people

create table PostDef(postid int, definition varchar(25))
insert into PostDef values (0, 'Director'), (1, 'Deputy Director'), (2, 'Executive Director'), (3, 'Department head'), 
              (4, 'Manager'), (5, 'Senior officer'), (6, 'Junior Officer'), (7, 'Intern')
create table Hierarchy(id int, name varchar(100), manager_id int, manager varchar(100))

insert into Hierarchy values 
(150, 'John Ryden', 111, 'Jack Tarkowski'),
(165, 'Sara Miller', 111, 'Jack Tarkowski'), 
(180, 'Rebecca Carson', 211, 'Thomas Kim'), 
(107, 'Sean Sullivan', 180, 'Rebecca Carson'), 
(142, 'Floyd Kan', 122, 'Alex Pereira'), 
(122, 'Alex Pereira', 107, 'Sean Sullivan'), 
(111, 'Jack Tarkowski', 107, 'Sean Sullivan'), 
(211, 'Thomas Kim', 191, 'Nicolas Jackson'), 
(177, 'Michael Rim', Null, Null), 
(191, 'Nicolas Jackson', 177, 'Michael Rim')

--Answer

with cte as(
select 
cast(h.name as varchar(max)) as hy,
h.name,
h.id,
h.manager_id,
0 as n
from Hierarchy h 
where h.manager_id is null
union all
select 
cast(cte.hy + ' - ' + h2.name as varchar(max)) as Hirerarchy,
h2.name,
h2.id,
h2.manager_id,
cte.n + 1
from Hierarchy h2
join cte on h2.manager_id = cte.id
)
select cte.name, p.definition from cte
join PostDef p on p.postid = cte.n

--SQL Exercises, Practice, Solution - SUBQUERIES exercises on movie Database
use W3Resource

--Q1
select * from Movies.Actor
select * from Movies.Movie_cast
select * from Movies.Movie

select * from Movies.Actor
where act_id = (
select act_id from Movies.Movie_cast
where mov_id = (
select mov_id from Movies.Movie
where mov_title = 'Annie Hall'
))

--Q2 From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. 
--Return director first name, last name.

select * from Movies.Director
where dir_id = (
select dir_id from Movies.Movie_Direction
where mov_id = (
select mov_id from Movies.Movie_cast
where mov_id = (
select mov_id from Movies.Movie
where mov_title = 'Eyes Wide Shut')))

--Q3From the following table, write a  SQL query to find those movies that have been released in countries other than the United Kingdom. 
--Return movie title, movie year, movie time, and date of release, releasing country.

select * from Movies.Movie
where mov_rel_country <> 'UK'

--Q4

SELECT mm.mov_title, mm.mov_year, mm.mov_dt_rel, mmd.dir_fname, mmd.dir_lname, ma.act_fname, ma.act_lname
FROM      Movies.Movie mm
		JOIN Movies.Movie_Direction md on md.mov_id = mm.mov_id
		JOIN Movies.Movie_cast mmc on mmc.mov_id = mm.mov_id
		JOIN Movies.Actor ma on ma.act_id = mmc.act_id
		JOIN Movies.Director mmd on mmd.dir_id = md.dir_id
		JOIN Movies.Rating mr on mr.mov_id = mm.mov_id 
		JOIN Movies.Reviewer mrr on mrr.rev_id = mr.rev_id
where mrr.rev_name is null

--Q5
SELECT mm.mov_title, mmd.dir_fname, mmd.dir_lname
FROM      Movies.Movie mm
		JOIN Movies.Movie_Direction md on md.mov_id = mm.mov_id
		JOIN Movies.Director mmd on mmd.dir_id = md.dir_id
where mmd.dir_fname = 'Woody' and mmd.dir_lname = 'Allen'
--Q6
select
mm.mov_year
from Movies.Movie mm
join movies.Rating mr on mm.mov_id = mr.mov_id
where mr.rev_stars >= 3
order by mm.mov_year

--Q7
select
mm.mov_year
from Movies.Movie mm
join movies.Rating mr on mm.mov_id = mr.mov_id
where mr.rev_stars is null

--Q8
select
mrr.rev_name
from Movies.Reviewer mrr
join Movies.Rating mr on mrr.rev_id = mr.rev_id
where mr.rev_stars is null
--Q9
select
mrr.rev_name, mm.mov_title, mr.rev_stars
from Movies.Reviewer mrr
join Movies.Rating mr on mrr.rev_id = mr.rev_id
join Movies.Movie mm on mm.mov_id = mr.mov_id
where mrr.rev_name is not null and mr.rev_stars is not null
order by mrr.rev_name, mm.mov_title, mr.rev_stars
--Q10
select
mrr.rev_name, mm.mov_title
from Movies.Reviewer mrr
join Movies.Rating mr on mrr.rev_id = mr.rev_id
join Movies.Movie mm on mm.mov_id = mr.mov_id
where mrr.rev_name is not null and mr.rev_stars is not null
group by mrr.rev_name, mm.mov_title
having (count(*)>1)
--Q11
select
mm.mov_title, max(mr.rev_stars)
from movies.Movie mm, Movies.Rating mr
where mm.mov_id = mr.mov_id
group by mm.mov_title
--Q12
select
mrr.rev_name
from Movies.Reviewer mrr
join Movies.Rating mr on mrr.rev_id = mr.rev_id
join Movies.Movie mm on mm.mov_id = mr.mov_id
where mm.mov_title = 'American Beauty'
use W3Resource
---------------------------------
--Hometasks
--Q from lesson
select s3.student_name, s3.subject_name, COUNT(es.subject_name) as Count
from
(select * from Students1 s1
cross join Subjects s2) s3
left join Examinations es on s3.student_id = es.student_id and s3.subject_name = es.subject_name
group by s3.student_name, s3.subject_name
--MY OWN Question: Return the number of goals scored after the main halves
--where the assistant refferee is not (1209,1229), and the the result is DRAW

select sgd.goal_id,sgd.goal_time,sarm.country_id,smd.win_lose 
from SOCCER.goal_details sgd
left join SOCCER.match_details smd on smd.match_no = sgd.match_no and smd.team_id = sgd.team_id
left join soccer.asst_referee_mast sarm  on smd.ass_ref = sarm.ass_ref_id
where sgd.goal_time > 90
and smd.win_lose = 'D'
and (sarm.country_id <> 1209 and sarm.country_id<>1229)

--The answer from teammate Sherzod
select count(distinct gd.goal_id) from SOCCER.match_details md
join SOCCER.goal_details gd on md.match_no =gd.match_no
join SOCCER.asst_referee_mast arm on arm.ass_ref_id=md.ass_ref
where md.match_no in (select distinct match_no from SOCCER.match_details
where win_lose = 'd' and match_no in(select match_no from SOCCER.goal_details
where goal_time >90 ) and ass_ref in (select ass_ref_id from SOCCER.asst_referee_mast
where country_id !=1209 and country_id!=1229)) and gd.goal_time>90


--The answer from teammate Mavlonjon



-- Q from teammate Sherzod: return me coach name whose team score 2 goals after 60 minute of match
--there are two coaches(5559,5560) for one team(1210) so I deleted one coach(5559)
--
delete from soccer.team_coaches
where coach_id = 5559
--Answer
select coach_name, COUNT(*) as [Number of goals] from SOCCER.match_details smd
join soccer.team_coaches stc on smd.team_id = stc.team_id
left join SOCCER.coach_mast scm on stc.coach_id = scm.coach_id
join SOCCER.goal_details sgd on smd.match_no = sgd.match_no and sgd.goal_time > 60 and smd.team_id = sgd.team_id
group by coach_name
having (COUNT(*) = 2)

--Q from teammate Mavlonjon 
--return the full name of all directors and full names of male actors who played a role in the movie taken after 1980
--Answer
select 
	mm.mov_title as [Movie Title],
	mm.mov_dt_rel as [Movie released date],
	trim(md.dir_fname)+' '+trim(md.dir_lname) as [Director Fullname], 
	trim(ma.act_fname)+' '+trim(ma.act_lname) as [Actor Fullname],
	ma.act_gender as [Actor gender]
from 
	Movies.Movie mm
left join 
	Movies.Movie_Direction mmd1 on mmd1.mov_id =  mm.mov_id
left join 
	Movies.Director md on md.dir_id = mmd1.dir_id
left join 
	Movies.Movie_cast mmc on mmc.mov_id = mm.mov_id
left join 
	Movies.Actor ma on ma.act_id = mmc.act_id
where 
	year(mm.mov_dt_rel) >= 1980
	and ma.act_gender = 'M'
order by 
	mm.mov_dt_rel
----------------------
/*Puzzle 1 A value of 0 signifies the workflow failed, and a value of 1 signifies the workflow passed.
Write an SQL statement that transforms the following table into the expected output.*/

CREATE TABLE #WorkflowCases
(
Workflow  VARCHAR(100) PRIMARY KEY,
Case1     INTEGER NOT NULL DEFAULT 0,
Case2     INTEGER NOT NULL DEFAULT 0,
Case3     INTEGER NOT NULL DEFAULT 0
);
GO

INSERT INTO #WorkflowCases (Workflow, Case1, Case2, Case3) VALUES
('Alpha',0,0,0),('Bravo',0,1,1),('Charlie',1,0,0),('Delta',0,0,0);
GO
/*expected output
Workflow Succesfull cases
Alpha    0
Bravo    2
Charlie  1
Delta    0
*/
--Answer
select 
w.Workflow,
w.Case1+w.Case2+w.Case3 as [Succesfull cases] 
from #WorkflowCases w

/*Puzzle 2
Write an SQL statement given the following requirements.
For every customer that had a delivery to California, provide a result set of the customer orders that
were delivered to Texas*/

CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);
GO

INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);
GO
/*Expected output
CustomerID OrderID Delivery State Amount
1001       2       TX       950   
1001       3       TX       670
1001       4       TX       860
*/
--Answer
select 
	o1.* 
from 
	#Orders o1
left join 
	#Orders o2 on o1.OrderID = o2.OrderID and o2.DeliveryState = 'CA'
where 
	o2.DeliveryState is null
and 
	o1.CustomerID 
in
	(select o.CustomerID from #Orders o where o.DeliveryState = 'CA')
and 
	o1.DeliveryState = 'TX'

/*Puzzle 3
Your customer phone directory table allows individuals to set up a home, cellular, or work phone
number.
Write an SQL statement to transform the following table into the expected output
*/

CREATE TABLE #PhoneDirectory
(
CustomerID   INTEGER,
[Type]       VARCHAR(100),
PhoneNumber  VARCHAR(12) NOT NULL,
PRIMARY KEY (CustomerID, [Type])
);
GO

INSERT INTO #PhoneDirectory (CustomerID, [Type], PhoneNumber) VALUES
(1001,'Cellular','555-897-5421'),
(1001,'Work','555-897-6542'),
(1001,'Home','555-698-9874'),
(2002,'Cellular','555-963-6544'),
(2002,'Work','555-812-9856'),
(3003,'Cellular','555-987-6541');
GO
/*Expected output
customerid cellular     work         home
1001       555-897-5421 555-897-6542 555-698-9874
2002       555-963-6544 555-812-9856 null
3003       555-987-6541 null         null
*/
--answer

select * from #PhoneDirectory p1

select 
    CustomerID,
    max(CASE when Type = 'Cellular' then PhoneNumber end) as Cellular,
    max(CASE when Type = 'Work' then PhoneNumber end) as Work,
    max(CASE when Type = 'Home' then PhoneNumber end) as Home
from 
    #PhoneDirectory
group by 
    CustomerID

/*Puzzle 4
You work for a manufacturing company and need to track inventory adjustments from the warehouse.
Some days the inventory increases, on other days the inventory decreases.
Write an SQL statement that will provide a running balance of the inventory
*/
CREATE TABLE #Inventory
(
InventoryDate       DATE PRIMARY KEY,
QuantityAdjustment  INTEGER NOT NULL
);
GO

INSERT INTO #Inventory (InventoryDate, QuantityAdjustment) VALUES
('7/1/2018',100),('7/2/2018',75),('7/3/2018',-150),
('7/4/2018',50),('7/5/2018',-75);
GO
--Answer
/*Expected output
InventoryDate	QuantityAdjustment	runningtotal
2018-07-01	    100	                 100
2018-07-02	    75	                 175
2018-07-03	    -150                 25
2018-07-04	    50	                 75
2018-07-05	    -75	                 0
*/


select i1.InventoryDate,i1.QuantityAdjustment,
SUM(i1.QuantityAdjustment) over (order by i1.inventorydate) as runningtotal
from #Inventory i1



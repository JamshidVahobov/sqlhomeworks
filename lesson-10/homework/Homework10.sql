use Movies_02
select * from sys.tables
--Q1 Create a query containing a join to list out those films whose source is NA

select f.Title,s.Source from Film f
left join Source s on f.SourceID = s.SourceID
where s.Source = 'NA'

--Q2 Create an inner join in a query, then change it to an outer join to show categories having no events
use WorldEvents
select * from sys.tables

select te.EventName,te.EventDate,tc.CategoryName from tblCategory tc
inner join tblEvent te on tc.CategoryID = te.CategoryID 
order by te.EventDate desc


select te.EventName,te.EventDate,tc.CategoryName from tblCategory tc
left join tblEvent te on tc.CategoryID = te.CategoryID 
where te.EventName is null
order by te.EventDate desc

--Q3 Use inner joins to link four tables to show Dr Who enemies by author
use DoctorWho
select * from sys.tables

select * from tblEpisode te
join tblAuthor ta on te.AuthorId = ta.AuthorId
join tblEpisodeEnemy tey on tey.EpisodeId = te.EpisodeId
join tblEnemy tem on tey.EnemyId = tem.EnemyId
where tem.EnemyName = 'Daleks'

--Q4 Create a query using the designer, joining 2 tables, then tidy it up and comment its SQL
use WorldEvents

SELECT tblCountry.CountryName AS Country,
       tblEvent.EventName AS [What happened], 
	   tblEvent.EventDate AS [When happened]

FROM     tblCountry INNER JOIN
         tblEvent 
		 ON tblCountry.CountryID = tblEvent.CountryID
ORDER BY [When happened]

--Q5 Join two tables together in SQL, using alias table names
use DoctorWho

select tdr.DoctorName,tee.Title
from tblDoctor tdr
join tblEpisode tee on tdr.DoctorId = tee.DoctorId
where YEAR(tee.EpisodeDate) = 2010

--Q6 Add joins to SQL queries to return values from multiple tables in a database of music.
use Music_01
select * from sys.tables

select a.Artist,t.Tour_name,sh.Show_date, v.Venue ,sh.Leg, sh.Tickets_sold
from show sh
inner join Venue v on v.Venue_ID = sh.Venue_ID
inner join city c on v.City_ID = c.City_ID
inner join tour t on t.Tour_ID = sh.Tour_ID	
inner join Artist a on a.Artist_ID = t.Artist_ID
where c.City = 'Manchester'
order by sh.Show_date

--Q7 Use an inner join to link two tables together in a query
use DoctorWho
SELECT ta.AuthorName, te.Title,te.EpisodeType
FROM     tblAuthor ta INNER JOIN
                  tblEpisode te ON te.AuthorId = ta.AuthorId
where te.EpisodeType like '%special%'
order by te.Title

--Q8 Link the continent, country and event tables with inner joins, and then filter by fields from 2 tables
use WorldEvents
SELECT tblEvent.EventName, tblEvent.EventDate, tblCountry.CountryName, tblContinent.ContinentName
FROM     tblContinent INNER JOIN
                  tblCountry ON tblContinent.ContinentID = tblCountry.ContinentID INNER JOIN
                  tblEvent ON tblCountry.CountryID = tblEvent.CountryID
WHERE  (tblCountry.CountryName = N'Russia') OR (tblContinent.ContinentName = N'Antarctic')
--Q9 Use an outer join and criterion to list out the countries which have no corresponding events
use WorldEvents

select *
from tblCountry tc
left join tblEvent te on te.CountryID = tc.CountryID
where te.CategoryID is null

--Q10 Use the Query Designer in SQL Server Management Studio to join multiple tables in a database of music
use Music_01
select * from sys.tables


SELECT Artist.Artist AS [Artist name], Album.Title AS [Album name], Track.Track_name AS [Track name]
FROM     Album INNER JOIN
                  Artist ON Album.Artist_ID = Artist.Artist_ID INNER JOIN
                  Track ON Album.Album_ID = Track.Album_ID
WHERE  (Track.Track_name LIKE N'%easy%') OR
                  (Track.Track_name LIKE N'%simple%')
ORDER BY [Album name]

--Q11 Use basic inner joins to list music albums and their genres before applying filters to the list.
use Music_01
select * from sys.tables

select album.Title, album.[US_sales_(m)] 
from Album
where [US_sales_(m)] between 0.5 and 10

--Q12 Use inner joins to link lots of tables together, with a WHERE clause
use DoctorWho
select * from  sys.tables

select ta.AuthorName, te.Title, td.DoctorName, tey1.EnemyName,
(len(ta.AuthorName)+ len(te.Title)+ len(td.DoctorName)+ len(tey1.EnemyName)) as [Total length] from tblAuthor ta

join tblEpisode te on ta.AuthorId = te.AuthorId

join tblDoctor td on te.DoctorId = td.DoctorId

join tblEpisodeEnemy tey on tey.EpisodeId = te.EpisodeId

join tblEnemy tey1 on tey.EnemyId = tey1.EnemyId

where (len(ta.AuthorName)+ len(te.Title)+ len(td.DoctorName)+ len(tey1.EnemyName)) < 40



--MORE EXOTIC JOINS exercises
--Q1 Use outer joins in SQL queries to return every row from a table of concert tours.

use Music_01
select 
t.Tour_name, t.Start_date, t.Album_ID
from Tour t
--99 rows
select 
t.Tour_name, t.Start_date, t.Album_ID
from Tour t
join Album a on
t.Album_ID = a.Album_ID
--87 rows
select 
t.Tour_name, t.Start_date, isnull(a.Title,'No associated album') Album_title
from Tour t
left join Album a on
t.Album_ID = a.Album_ID
order by 
t.Tour_name

--Q2 Write an SQL outer join to show unmatched records in another table
use DoctorWho

select *
from tblCompanion tc
full join tblEpisodeCompanion te on tc.CompanionId = te.CompanionId
where te.EpisodeId is null

--Q3 Use inner and outer joins in SQL queries to return lists of albums, artists and concert tours.
use Music_01

SELECT Album.Title, Album.Release_date, Artist.Artist, Tour.Tour_name
FROM     Album INNER JOIN
                  Artist ON Album.Artist_ID = Artist.Artist_ID INNER JOIN
                  Tour ON Artist.Artist_ID = Tour.Artist_ID

Select Album.Title, Album.Release_date,
concat(album.Album_mins,'m ',album.Album_secs,'s') as [Album length],
Artist.Artist, 
isnull(Tour.Tour_name,'No associated tour for '+album.Title) as Tour_name
from Album
full join Artist on album.Artist_ID = Artist.Artist_ID
full join Tour on tour.Album_ID = album.Album_ID
where Tour.Album_ID is null
and album.Title like '%road%'
and album.Title not like '%broad%'
order by [Album length] desc

--Q4 Use outer joins in SQL queries to return a list of music artists who don't have any associated concert tours.
use Music_01
SELECT Artist.Artist, 
isnull(Tour.Tour_name, 'No tours found for '+Artist.Artist) as Tour_name
FROM     Artist LEFT OUTER JOIN
                  Tour ON Artist.Artist_ID = Tour.Artist_ID
WHERE  (Tour.Tour_name IS NULL)

--Q5 Create 2 self-joins between a table of families and itself, to show families, their parents and their grandparents
use WorldEvents
select * from sys.tables

select 
 f.FamilyName,
 case when f3.FamilyName is null then '' else F3.FamilyName + '>'
 end +
 case when f2.FamilyName is null then '' else f2.FamilyName + '>'
 end +
 f.FamilyName as [Family Path]
from tblFamily F
left join tblFamily F2 on F2.FamilyID = F.ParentFamilyId
left join tblFamily F3 on F3.FamilyID = F2.ParentFamilyId
order by F.FamilyName

--AGGREGATION AND GROUPING exercises
-- Q1 Use COUNT, MAX and MIN to show statistics about the rows in the events table
use WorldEvents

select 
count(*)[Number of events],max(eventdate) Lastdate, min(EventDate) Firstdate
from tblEvent

--Q2Use the GROUP BY clause in SQL queries to calculate aggregated values for a list of music artists.
use Music_01

select
Artist_type, count(*) as Count
from Artist
group by Artist_type

--Q3 Combine CAST, AVG, COUNT, LEN, UPPER and LEFT to show the average length of event names by category initial
use WorldEvents

select
LEFT(CategoryName,1)[Category initial],COUNT(*)[Number of events],AVG(LEN(EventDetails))[Average event name length]
from tblCategory
join tblEvent on tblEvent.CategoryID = tblCategory.CategoryID
group by LEFT(CategoryName,1)

--Q4 Use GROUP BY and COUNT to report on the number of events for each category
use WorldEvents
select
CategoryName[Category initial],COUNT(*)[Number of events]
from tblCategory
join tblEvent on tblEvent.CategoryID = tblCategory.CategoryID
group by CategoryName

--Q5 Group by 2 fields and use HAVING clause to show popular combinations
use DoctorWho


select
AuthorName, DoctorName, COUNT(*) as [Number of evnts]
from tblEpisode te
join tblAuthor ta on te.AuthorId = ta.AuthorId
join tblDoctor td on td.DoctorId = te.DoctorId
group by AuthorName, DoctorName
having(COUNT(*)>5)

--Q6 Use a complex CASE statement to show the number of events for each century, including the CUBE function
use WorldEvents

select 
	case when (left(EventDate,2)+1) = 21 
		 then concat(left(EventDate,2)+1,'st century') 
		 else concat(left(EventDate,2)+1,'th century') 
	end as Century,
	Count(*)
from tblEvent
group by
(case when (left(EventDate,2)+1) = 21 
		 then concat(left(EventDate,2)+1,'st century') 
		 else concat(left(EventDate,2)+1,'th century') 
	end)

--Q7 Use grouping to show how many episodes each Doctor Who author wrote
use DoctorWho

select
AuthorName, count(*) as [number of episodes], min(EpisodeDate)[Earliest episode date], max(EpisodeDate) [Latest episode date]
from tblEpisode te
left join tblAuthor ta on ta.AuthorId = te.AuthorId  
group by AuthorName
order by count(*) desc

--Q8 Use SELECT, FROM, WHERE, GROUP BY, HAVING and ORDER BY to list non-European busy countries
use WorldEvents

select 
tc1.ContinentName, tc.CountryName, count(*) Count
from tblEvent te
join tblCountry tc on te.CountryID = tc.CountryID
join tblContinent tc1 on tc.ContinentID = tc1.ContinentID and tc1.ContinentName <> 'Europe'
group by tc1.ContinentName, tc.CountryName
having (count(*)>5)

--Q9 Use lots of grouping and criteria to list out year/doctor episode counts
use DoctorWho

select
year(EpisodeDate) Year,EnemyName,count(*)[Number of episodes]
from tblEpisode
join tblEpisodeEnemy on tblEpisode.EpisodeId = tblEpisodeEnemy.EpisodeId
join tblEnemy on tblEpisodeEnemy.EnemyId = tblEnemy.EnemyId
join tblDoctor on tblDoctor.DoctorId = tblEpisode.DoctorId and year(tblDoctor.BirthDate) < 1970
group by year(EpisodeDate),EnemyName
having (count(*)>1)

--Q10 Use SQL queries to group a list of music artists and create statistics related to their albums.
use Music_01

select
Artist.Artist, 
count(Album_ID) [Count of albums], 
cast(sum([US_sales_(m)])as decimal(10,2)) [Sum of sales], 
cast(AVG([US_sales_(m)]) as decimal(10,2)) [Avg of sales]
from Artist
join Album on Artist.Artist_ID = album.Artist_ID and album.US_Billboard_200_peak = 1
group by artist.Artist
having (AVG([US_sales_(m)])>10)
order by count(Album_ID) desc

--Q11 Write SQL queries to group concerts by multiple different geographic columns and create basic aggregations.
use Music_01

select
	Venue.Venue,
	count(*) count,
	sum(Tickets_sold) Sum,
	AVG(Revenue_$) AVG
from venue
join Show on show.Venue_ID = Venue.Venue_ID
group by Venue.Venue
order by count(*) desc


select
	city.City,
	count(*) count,
	sum(Tickets_sold) Sum,
	AVG(Revenue_$) AVG
from venue
join Show on show.Venue_ID = Venue.Venue_ID
join City on city.City_ID = Venue.City_ID
group by city.City
order by count(*) desc

select
	Country.Country,
	count(*) count,
	sum(Tickets_sold) Sum,
	AVG(Revenue_$) AVG
from venue
join Show on show.Venue_ID = Venue.Venue_ID
join City on city.City_ID = Venue.City_ID
join Country on country.Country_ID = city.Country_ID
join Continent on Continent.Continent_ID = Country.Continent_ID
group by country.Country
order by count(*) desc

select
	Continent.Continent,
	count(*) count,
	sum(Tickets_sold) Sum,
	AVG(Revenue_$) AVG
from venue
join Show on show.Venue_ID = Venue.Venue_ID
join City on city.City_ID = Venue.City_ID
join Country on country.Country_ID = city.Country_ID
join Continent on Continent.Continent_ID = Country.Continent_ID
group by Continent.Continent
order by count(*) desc

select
	Continent.Continent,
	Country.Country,
	city.City,
	Venue.Venue,
	count(*) count,
	sum(Tickets_sold) Sum,
	AVG(Revenue_$) AVG
from venue
join Show on show.Venue_ID = Venue.Venue_ID
join City on city.City_ID = Venue.City_ID
join Country on country.Country_ID = city.Country_ID
join Continent on Continent.Continent_ID = Country.Continent_ID
group by
	Continent.Continent,
	Country.Country,
	city.City,
	Venue.Venue
order by count(*) desc


--Q12 Use SQL queries to group a list of albums by multiple columns and create subtotals for the groups.
use Music_01

select
	isnull(Parent_Company.Parent_company,'GRAND') [Parent company],
	isnull(Record_label.Record_label,'TOTAL')[Record label], 
	COUNT(*) [Count of albums], 
	cast(AVG([US_sales_(m)]) as decimal(10,2)) [Avg sales m]
from Album
join Record_Label on Record_label.Record_label_ID = Album.Record_label_ID
join Parent_Company on Parent_company.Parent_company_ID = Record_label.Parent_company_ID
group by Parent_company.Parent_company,Record_label.Record_label with rollup


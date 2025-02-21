Declare @todate datetime, @fromdate datetime
set @fromdate = '2025-01-01'
set @todate = '2025-12-31'
 
;With DateSequence( [Date] ) as
(
    Select @fromdate as [Date]
        union all
    Select dateadd(day, 1, [Date])
        from DateSequence
        where Date < @todate
)

SELECT 
FORMAT(Date,'yyyyMMdd') as ID,
Date,
day(Date) as Day,
cast(day(Date) as varchar) +
CASE
	when DAY(date) in (11,12,13) then 'th'
	when right(DAY(date),1) = 1 then 'st'
	when right(day(Date),1) = 2 then 'nd'
	when right(day(Date),1) = 3 then 'rd'
	else 'th'
end as DaySuffix,
FORMAT(date, 'dddd') as DayofWeek,
datepart(DAY,date) as DayofYear,
datepart(week,date) as WeekofYear,
5-datediff(week,date, EOMONTH(date))as WeekofMonth,
DATEPART(month,date) as Month,
FORMAT(date, 'MMMM') as Monthname,
DATEPART(QUARTER,date) as Quarter,
case
	when DATEPART(QUARTER,date) = 1 then 'First'
	when DATEPART(QUARTER,date) = 2 then 'Second'
	when DATEPART(QUARTER,date) = 3 then 'Third'
	else 'Fouth'
end as QuarterName,
datepart(year,date) as year
FROM DateSequence
OPTION (MAXRECURSION 0)

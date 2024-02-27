Select * from data

-- total episodes

select max(Ep_No) as Max_Ep_No from data
select count(distinct Ep_No) as Count_Distinct_Ep_No from data

-- pitches 

select count(distinct brand) as Count_Distinct_brand from data

--pitches converted

select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) as sum_converted_not_converted from (
select [Amount Invested lakhs], 
case 
when [Amount Invested lakhs] > 0 then 1 
else 0 
end as converted_not_converted 
from data) a

-- total male

select sum(male) as sum_of_male_candidate from data

-- total female

select sum(female) as sum_of_female_candidate from data

--gender ratio

select sum(female)/sum(male) as gender_ratio from data

-- total invested amount

select sum([Amount Invested lakhs]) as sum_amount_invested from data

-- avg equity taken

select avg(a.[Equity Taken %]) as avg_equity from
(select * from data where [Equity Taken %]>0) a

--highest deal taken

select max([Amount Invested lakhs]) from data 

--highest equity taken

select max([Equity Taken %]) from data

-- startups having at least 1 women

select sum(a.female_count) as startups 
from (
select female,case when female>0 then 1 else 0 end as female_count from data) a

-- pitches converted having atleast 1 women

select * from data


select sum(b.female_count) from(

select case when a.female>0 then 1 else 0 end as female_count ,a.*from (
(select * from data where deal!='No Deal')) a)b

-- avg team members

select avg([Team members]) from data

-- amount invested per deal

select avg(a.[Amount Invested lakhs]) as amount_invested_per_deal from
(select * from data where deal!='No Deal') a

-- avg age group of contestants

select [Avg age],count([Avg age]) cnt from data group by [Avg age] order by cnt desc

-- location group of contestants

select location,count(location) cnt from data group by location order by cnt desc

-- sector group of contestants

select Sector,count(Sector) cnt from data group by Sector order by cnt desc

--partner deals

select Partners,count(Partners) cnt from data  where Partners!='-' group by Partners order by cnt desc

-- making the matrix


select * from data

--select 'Vineeta' as keyy,count([Vineeta Amount Invested]) from data where [Vineeta Amount Invested] is not null


--select 'Vineeta' as Investor,count([Vineeta Amount Invested]) as No_of_Investments_Done from data where [Vineeta Amount Invested] is not null AND [Vineeta Amount Invested]!=0

--SELECT 'Vineeta' as Investor,SUM(C.[Vineeta Amount Invested]) as Total_Investment, Round(AVG(C.[Vineeta Equity Taken %]),2) as Avg_Equity_Taken
--FROM (SELECT * FROM dATA  WHERE [Vineeta Equity Taken %]!=0 AND [Vineeta Equity Taken %] IS NOT NULL) C



select 'Vineeta' as Investor, COUNT([Partners]) as Investment_Partner from data
where [Partners] LIKE '%vin%'
union
select 'Ashneer' as Investor, COUNT([Partners]) as Investment_Partner from data
where [Partners] LIKE '%Ash%'
union
select 'aman' as Investor, COUNT([Partners]) as Investment_Partner from data
where [Partners] LIKE '%Ama%'
union
select 'Namita' as Investor, COUNT([Partners]) as Investment_Partner from data
where [Partners] LIKE '%Nam%'
union
select 'Anupam' as Investor, COUNT([Partners]) as Investment_Partner from data
where [Partners] LIKE '%Anu%'
union
select 'Peyush' as Investor, COUNT([Partners]) as Investment_Partner from data
where [Partners] LIKE '%Pey%'

select m.Investor,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.Investor,a.total_deals_present,b.total_deals from(

select 'Vineeta' as Investor,count([Vineeta Amount Invested]) total_deals_present from data where [Vineeta Amount Invested] is not null) a

inner join (
select 'Vineeta' as Investor,count([Vineeta Amount Invested]) total_deals from data 
where [Vineeta Amount Invested] is not null AND [Vineeta Amount Invested]!=0) b 

on a.Investor=b.Investor) m

inner join 

(SELECT 'Vineeta' as Investor,SUM(C.[Vineeta Amount Invested]) total_amount_invested,
AVG(C.[Vineeta Equity Taken %]) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE [Vineeta Equity Taken %]!=0 AND [Vineeta Equity Taken %] IS NOT NULL) C) n

on m.Investor=n.Investor

union

select m.Investor,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.Investor,a.total_deals_present,b.total_deals from(

select 'Ashneer' as Investor,count([Ashneer Amount Invested]) total_deals_present from data where [Ashneer Amount Invested] is not null) a

inner join (
select 'Ashneer' as Investor,count([Ashneer Amount Invested]) total_deals from data 
where [Ashneer Amount Invested] is not null AND [Ashneer Amount Invested]!=0) b 

on a.Investor=b.Investor) m

inner join 

(SELECT 'Ashneer' as Investor,SUM(C.[Ashneer Amount Invested]) total_amount_invested,
AVG(C.[Ashneer Equity Taken %]) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE [Ashneer Equity Taken %]!=0 AND [Ashneer Equity Taken %] IS NOT NULL) C) n

on m.Investor=n.Investor

union

select m.Investor,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.Investor,a.total_deals_present,b.total_deals from(

select 'Namita' as Investor,count([Namita Amount Invested]) total_deals_present from data where [Namita Amount Invested] is not null) a

inner join (
select 'Namita' as Investor,count([Namita Amount Invested]) total_deals from data 
where [Namita Amount Invested] is not null AND [Namita Amount Invested]!=0) b 

on a.Investor=b.Investor) m

inner join 

(SELECT 'Namita' as Investor,SUM(C.[Namita Amount Invested]) total_amount_invested,
AVG(C.[Namita Equity Taken %]) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE [Namita Equity Taken %]!=0 AND [Namita Equity Taken %] IS NOT NULL) C) n

on m.Investor=n.Investor

union

select m.Investor,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.Investor,a.total_deals_present,b.total_deals from(

select 'Anupam' as Investor,count([Anupam Amount Invested]) total_deals_present from data where [Anupam Amount Invested] is not null) a

inner join (
select 'Anupam' as Investor,count([Anupam Amount Invested]) total_deals from data 
where [Anupam Amount Invested] is not null AND [Anupam Amount Invested]!=0) b 

on a.Investor=b.Investor) m

inner join 

(SELECT 'Anupam' as Investor,SUM(C.[Anupam Amount Invested]) total_amount_invested,
AVG(C.[Anupam Equity Taken %]) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE [Anupam Equity Taken %]!=0 AND [Anupam Equity Taken %] IS NOT NULL) C) n

on m.Investor=n.Investor

union

select m.Investor,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.Investor,a.total_deals_present,b.total_deals from(

select 'Aman' as Investor,count([Aman Amount Invested]) total_deals_present from data where [Aman Amount Invested] is not null) a

inner join (
select 'Aman' as Investor,count([Aman Amount Invested]) total_deals from data 
where [Aman Amount Invested] is not null AND [Aman Amount Invested]!=0) b 

on a.Investor=b.Investor) m

inner join 

(SELECT 'Aman' as Investor,SUM(C.[Aman Amount Invested]) total_amount_invested,
AVG(C.[Aman Equity Taken %]) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE [Aman Equity Taken %]!=0 AND [Aman Equity Taken %] IS NOT NULL) C) n

on m.Investor=n.Investor


-- which is the startup in which the highest amount has been invested in each domain/sector


select c.* from 
(select brand,sector,[Amount Invested lakhs],rank() over(partition by sector order by [Amount Invested lakhs] desc) rnk 

from data) c

where c.rnk=1;
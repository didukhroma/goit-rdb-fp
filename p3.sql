-- 3
select country_id, 
avg(cast(Number_rabies as double)) average,
min(cast(Number_rabies as double)) min,
max(cast(Number_rabies as double)) max, 
sum(cast(Number_rabies as double)) sum 
from cases 
where Number_rabies <> '' 
group by country_id
order by average desc
limit 10;
-- 4
select case_id,
country_id,
case_year,
makedate(case_year,1) case_date, 
curdate() case_current_date,
timestampdiff(year,makedate(case_year,1),curdate()) diff_in_years    
from cases;
-- 5 
drop function if exists diffFunction;
delimiter //
create function diffFunction(date_year year)
returns int
deterministic
no sql
begin 
 return timestampdiff(year,makedate(date_year,1),curdate());
end //
delimiter ;

select case_id,
country_id,
case_year,
makedate(case_year,1) case_date, 
curdate() case_current_date,
diffFunction(case_year) diff_in_years  
from cases;
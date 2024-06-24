drop function if exists countDeseasesPerTimePeriod;
delimiter //
create function countDeseasesPerTimePeriod(AmountOfDeseases text, time_period int)
returns double
deterministic
no sql
begin
return round(cast(AmountOfDeseases as double) / time_period,10) ;
end//
delimiter ;

select case_id,
country_id,
case_year,
Number_rabies,
 countDeseasesPerTimePeriod(Number_rabies,12) deseases_per_month,
 countDeseasesPerTimePeriod(Number_rabies,4) deseases_per_quater,
 countDeseasesPerTimePeriod(Number_rabies,6) deseases_per_six_month
 from cases
 where Number_rabies<>'' 
use pandemic;
select * from infectious_cases;

-- create countries
set foreign_key_checks=0;
drop table if exists  countries;
set foreign_key_checks=1;


create table countries(
country_id int primary key auto_increment , 
country_name varchar(90), 
country_code varchar(10));

-- insert data in countries
insert into countries(country_name,country_code) 
select distinct entity,code 
from infectious_cases ;

-- show countries
select * from countries;

-- create cases
set foreign_key_checks=0;
drop table if exists  cases;
set foreign_key_checks=1;

create table cases(
case_id int primary key auto_increment,
country_id int,
case_year year,
Number_yaws varchar(255) null,
polio_cases int not null,
cases_guinea_worm int not null,
Number_rabies varchar(255) null, 
Number_malaria varchar(255) null, 
Number_hiv varchar(255) null, 
Number_tuberculosis varchar(255) null, 
Number_smallpox varchar(255) null, 
Number_cholera_cases varchar(255) null,

foreign key (country_id) references countries(country_id)
);


-- insert data in cases
insert into cases(
country_id, 
case_year,
Number_yaws,
polio_cases,
cases_guinea_worm,
Number_rabies,
Number_malaria,
Number_hiv,
Number_tuberculosis,
Number_smallpox,
Number_cholera_cases
)
select country_id, year,Number_yaws,polio_cases,cases_guinea_worm,Number_rabies,Number_malaria,Number_hiv,Number_tuberculosis,Number_smallpox,Number_cholera_cases
 from infectious_cases i
 inner join countries c on i.entity = c.country_name;
 
 -- show cases
 select * from cases;
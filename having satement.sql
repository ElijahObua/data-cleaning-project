-- group by 
select *
from employee_demographics;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics 
group by gender;

-- order by 
select *
from employee_demographics
order by age desc, gender
;

-- having and where
select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40
;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 70000
;

select occupation, salary
from employee_salary
where occupation or salary != 700 

;

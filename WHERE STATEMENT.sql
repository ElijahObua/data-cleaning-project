-- WHERE CLAUSE

select *
FROM employee_salary
where first_name = 'LESLIE'
;

select *
FROM employee_salary
where semployeealary <= 50000
;

select *
FROM employee_demographics
where gender = 'FEMALE'
;

select *
FROM employee_demographics
where (first_name = 'leslie' and age = 44) or age > 55
;

-- like statement
-- the USe of percent sign (%) and underscore (_)
select *
FROM employee_demographics
where first_name like 'jer%';

select *
FROM employee_demographics
where first_name like 'a__%';


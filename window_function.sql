-- window functions

select gender, avg(salary)
from employee_demographics as dem 
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;
    

select gender, dem.first_name, dem.last_name,
avg(salary) over(partition by gender)
from employee_demographics as dem 
join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;


select gender, dem.first_name, dem.last_name, salary,
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem 
join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;


select gender, dem.first_name, dem.last_name, salary,
row_number() OVER(partition by GENDER order by salary desc) as row_num,
rank() OVER(partition by GENDER order by salary desc) as rank_num,
dense_rank() OVER(partition by GENDER order by salary desc) as dense_rank_num
from employee_demographics as dem 
join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;
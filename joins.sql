-- joins
select * 
from employee_demographics
;

select *
from employee_salary;

select dem.employee_id, occupation, age
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- outer joins
select*
from employee_demographics as dem
left outer join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

select*
from employee_demographics as dem
right outer join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- self join
selecT emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary EMP1
JOIN employee_salary emp2
	on emp1.employee_id +1 = emp2.employee_id
;

-- joining multiple tables together

select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
    ;
select* 
from parks_departments

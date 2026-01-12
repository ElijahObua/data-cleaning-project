select * 
from parks_and_recreation.employee_demographics;

select first_name, 
birth_date,
age,
(age + 10) * 10 + 10
from parks_and_recreation.employee_demographics;
#i dont thing this is fun

select distinct gender, first_name
from parks_and_recreation.employee_demographics;
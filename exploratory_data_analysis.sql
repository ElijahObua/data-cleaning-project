-- exploratory data analysis

SELECT * 
FROM layoffs_staging2;

-- finding the max of total_laid_off and percentage_laid_off
select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;


select *
from layoffs_staging2 
where percentage_laid_off = 1
order by total_laid_off desc;

-- finding the sum of total_laid_off and grouping by company
select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;


-- checking the max date and min date from where the date started
select min(`date`), max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

-- checking coutry with the most laid off
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 2 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

-- sum of total laid off by month
select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;

-- convert to cte to create the rolling total of total laid off by month
with Rolling_Total as 
(select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_offs
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`, total_offs, sum(total_offs) over(order by `month`) as rolling_total 
from Rolling_total;

-- find out companies with the most total laid off by year and ranking them by total laid off

select COMPANY, YEAR(`DATE`), sum(total_laid_off)
from layoffs_staging2
where total_laid_off is not null
group by company, year(`DATE`)
order by 2 desc;

WITH COMPANY_RAINKING (comapny, `year`, total_laid_off) AS 
(select COMPANY, YEAR(`DATE`), sum(total_laid_off)
from layoffs_staging2
where total_laid_off is not null
group by company, year(`DATE`)
order by 3 desc
),  company_year_rank as
(SELECT *, dense_rank() over (partition by `year` order by total_laid_off desc) as ranks
FROM COMPANY_RAINKING
where `year` is not null)
select *
from company_year_rank
where ranks <= 5



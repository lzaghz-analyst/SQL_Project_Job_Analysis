-- CASE function --          

SELECT
    job_title_short,
    job_location,
        case
            when job_location = 'Anywhere' then 'Remote'
            when job_location = 'New York, NY' then 'Local'
            else 'On-Site'
        end as location_category
    from job_postings_fact;

SELECT
    COUNT(job_id) AS number_of_jobs,
        case
            when job_location = 'Anywhere' then 'Remote'
            when job_location = 'New York, NY' then 'Local'
            else 'On-Site'
        end as location_category
    from 
        job_postings_fact
GROUP BY
    location_category;

/* another example*/

SELECT
    count(job_id) AS number_of_jobs,
        case
            WHEN job_title_short = 'Data Analyst' THEN 'The desired job'
            WHEN job_title_short = 'Data Scientist' THEN 'The second desired job'
            else 'Other data jobs'
        END AS position_for_job_application
    FROM
    job_postings_fact
GROUP BY
    position_for_job_application;


/* Practice Problem 1

I want to categorize the salaries from each job posting. To see if it fits in my desired salary range.

- Put salary into different buckets
- Define whats a high, standard, or low salary with our own conditions
- Why? it is easy to determine which job postings are worth looking at based on salary.
  Bucketing is a common practice in data analysis when viewing categories.
- I only want to look at data analyst roles
- Order from highest to lowest
*/

SELECT
    COUNT(job_id) AS number_of_jobs,
    case
     WHEN salary_year_avg < 100000 THEN 'Low Salary'
     WHEN salary_year_avg > 500000 THEN 'High Salary'
     ELSE 'Standard Salary'
    END AS Salary_Categories
FROM 
    job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY Salary_Categories
ORDER BY number_of_jobs DESC;

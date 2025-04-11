/* UNION - combines results from two or more SELECT statements, NOT include DUPLICATE
   Thye need to have the same amounts of columns, and the data type must match
*/

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs


/* UNION ALL - combine the result of two or more SELECT statements, include DUPLICATE
They need to have the same amount of columns, and the data type must match */

/* Practice Problem 1
Question:
- Get the corresponding skill and skill type for each job postings in Q1
- Includes those without any skills, too
- Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000
*/




/*
Problem 8
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70, 000
*/


SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM (
    SELECT * 
    FROM january_jobs
    UNION ALL
    SELECT * 
    FROM february_jobs
    UNION ALL
    SELECT * 
    FROM march_jobs
) AS quarter1_job_postings
WHERE
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC

/*You may use standard method below too, but only when its 1 or 2 or 3 SELECT.
It would be hard if you need to extract from hundreds of SELECT
*/

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
FROM january_jobs
WHERE salary_year_avg > 70000

UNION ALL

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE
FROM february_jobs
WHERE salary_year_avg > 70000

UNION ALL

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE
FROM march_jobs
WHERE salary_year_avg > 70000


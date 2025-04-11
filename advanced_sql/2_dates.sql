/* Practicing for Date Function */

SELECT '2023-02-19'::DATE,  --::DATE is to specify the type of the query which is DATE--
        '123'::INT,         -- if not, it will return STRING not DATE--
        'true'::BOOLEAN,    -- the symbol :: is very important to ensure the return based on each TYPE--
        '3.14'::REAL;  

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
  
FROM 
    job_postings_fact
LIMIT 5;

--A simple example--

SELECT 
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
  
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month 
ORDER BY
    job_posted_count DESC;

/* Problem 4:
Question : Determine the size category ('Small', 'Medium', or 'Large') for each
company by first identifying the number of job postings they have. 
Use a subquery to calculate the total job postings per company.
A company is considered 'Small' if it has less than 10 job postings,
'Medium' if the number of job postings is between 10 and 50,
and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size.
*/


SELECT * FROM job_postings_fact LIMIT 3; -- Just to check --
SELECT * FROM company_dim LIMIT 3; -- Just to check --

WITH company_type_size AS (
    SELECT
        company_id,
        name AS company_name,
        COUNT(*) AS number_of_jobs
    FROM 
        company_dim
    GROUP BY
        company_id
)

SELECT
    company_name,
    company_id,
    number_of_jobs,
    CASE
        WHEN number_of_jobs < 10 THEN 'Small'
        WHEN number_of_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN number_of_jobs > 50 THEN 'Large'
        ELSE 'Other'
    END AS company_size 
FROM
    company_type_size
GROUP BY number_of_jobs;
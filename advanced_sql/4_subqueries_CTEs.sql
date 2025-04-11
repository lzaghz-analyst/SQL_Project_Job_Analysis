-- Query nested inside a larger query. Temporary in-memory table --

SELECT*
FROM (
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- SubQuery ends here --


-- can reference within a SELECT, INSERT, UPDATE, or DELETE statement. Defined with WITH --

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT * 
FROM january_jobs;

-- IN statement, usually used for simple retrieval. For details, use JOIN statement--


SELECT
    company_id,
    name AS company_name
FROM
    company_dim
WHERE 
    company_id IN (
    SELECT 
        company_id
    FROM 
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
    ORDER BY
        company_id
)

/*
Find the companies that have the most job openings.
-Get the total number of job postings per company id (job_posting_facts)
-Return the total number of jobs with the company name (company_dim)
*/

WITH company_job_count AS (
    SELECT
        company_id,
        count(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    name AS company_name,
    total_jobs
FROM
    company_dim
LEFT JOIN
    company_job_count
        ON
            company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;


/* Practice Problem 1
Question: Identify the top 5 skills that are most frequently mentioned in job postings.
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table
and then join this result with the skills_dim table to get the skill names.
*/

SELECT* FROM skills_job_dim LIMIT 3; -- just to check column--
SELECT * FROM skills_dim LIMIT 3; -- just to check column --

WITH top_skills AS ( 
    SELECT
        skill_id,
        COUNT(*) AS total_skills
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)

SELECT
    skills,
    total_skills
FROM 
    skills_dim
LEFT JOIN
    top_skills
    ON
        top_skills.skill_id=skills_dim.skill_id
ORDER BY 
    total_skills DESC
LIMIT 5;

/* Practice Problem 2
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


/*
Find the count of number of remote job postings per skill   -- the question is kinda misleading lol--
    -Display  the top 5 skills by their demand in remote jobs
    -Include skill ID, name, and count of postings requiring the skill
*/

SELECT * FROM job_postings_fact LIMIT 3; -- just to check --
SELECT * FROM skills_dim LIMIT 3; -- just to check --
SELECT * FROM skills_job_dim LIMIT 3; -- just to check --

WITH remote_jobs AS (
SELECT
    skill_id,
    COUNT(*) AS skills_count
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim
    ON
    skills_job_dim.job_id = job_postings_fact.job_id
WHERE 
    job_postings_fact.job_work_from_home = TRUE AND
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT
    skills_dim.skill_id,
    skills AS skill_name,
    skills_count
FROM remote_jobs
    INNER JOIN skills_dim
        ON 
            skills_dim.skill_id = remote_jobs.skill_id
ORDER BY
    skills_count DESC
LIMIT 5;


    
  

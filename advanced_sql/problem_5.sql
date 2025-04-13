/*Problem 5:
Find the count of number of remote job postings per skill   -- the question is kinda misleading lol--
    -Display  the top 5 skills by their demand in remote jobs
    -Include skill ID, name, and count of postings requiring the skill
*/

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
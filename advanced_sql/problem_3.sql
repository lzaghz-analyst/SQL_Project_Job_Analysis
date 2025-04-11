/* Practice Problem 3
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
/*
Question: What skills are required for the top-paying data analyst job?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles'
- Why? It provides a details look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_job AS(
    SELECT
        company_dim.name AS company_name,
        job_id,
        job_title,
        salary_year_avg
    FROM 
        job_postings_fact
        LEFT JOIN
            company_dim
            ON
            company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_job.*,
    skills
FROM top_paying_job
INNER JOIN skills_job_dim ON top_paying_job.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


/*
[
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "sql"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "python"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "r"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "azure"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "databricks"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "aws"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pandas"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "pyspark"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "jupyter"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "excel"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "tableau"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "power bi"
  },
  {
    "company_name": "AT&T",
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "skills": "powerpoint"
  },
  {
    "company_name": "Pinterest Job Advertisements",
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "company_name": "Pinterest Job Advertisements",
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "company_name": "Pinterest Job Advertisements",
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "company_name": "Pinterest Job Advertisements",
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "company_name": "Pinterest Job Advertisements",
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "company_name": "Uclahealthcareers",
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "company_name": "Uclahealthcareers",
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "company_name": "Uclahealthcareers",
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "company_name": "Uclahealthcareers",
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "company_name": "Uclahealthcareers",
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "company_name": "Inclusively",
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "company_name": "Motional",
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "company_name": "SmartAsset",
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "company_name": "Get It Recruit - Information Technology",
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "skills": "r"
  }
]
*/
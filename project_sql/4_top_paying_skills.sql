/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyts and helps
    identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    --job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
Here are the breakdown of the results for top paying skills:
- AI/ML & Data Science Skills Pay Big: Tools like Solidity, DataRobot, PyTorch, TensorFlow, Hugging Face, and dplyr offer top salaries — showing strong demand for machine learning, AutoML, and statistical programming.
- DevOps & Data Engineering Tools Dominate: High-paying skills include Kafka, Airflow, Terraform, Ansible, and VMware, highlighting the value of building robust data pipelines and infrastructure.
- Version Control & Collaboration Tools Matter: Even tools like GitLab, Bitbucket, Atlassian, and Notion are on the list, proving that collaboration, documentation, and workflow tools are key to high-paying data roles.

[
  {
    "skills": "svn",
    "average_salary": "400000"
  },
  {
    "skills": "solidity",
    "average_salary": "179000"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "golang",
    "average_salary": "155000"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633"
  },
  {
    "skills": "vmware",
    "average_salary": "147500"
  },
  {
    "skills": "terraform",
    "average_salary": "146734"
  },
  {
    "skills": "twilio",
    "average_salary": "138500"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126"
  },
  {
    "skills": "kafka",
    "average_salary": "129999"
  },
  {
    "skills": "puppet",
    "average_salary": "129820"
  },
  {
    "skills": "keras",
    "average_salary": "127013"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226"
  },
  {
    "skills": "perl",
    "average_salary": "124686"
  },
  {
    "skills": "ansible",
    "average_salary": "124370"
  },
  {
    "skills": "hugging face",
    "average_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "average_salary": "120647"
  },
  {
    "skills": "cassandra",
    "average_salary": "118407"
  },
  {
    "skills": "notion",
    "average_salary": "118092"
  },
  {
    "skills": "atlassian",
    "average_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "average_salary": "116712"
  },
  {
    "skills": "airflow",
    "average_salary": "116387"
  },
  {
    "skills": "scala",
    "average_salary": "115480"
  }
]
*/


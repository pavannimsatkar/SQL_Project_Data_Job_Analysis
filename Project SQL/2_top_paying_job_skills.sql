/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_skills AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim AS company ON job_postings_fact.company_id = company.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT
        10
)

SELECT 
    top_paying_skills.*,
    skills
FROM top_paying_skills
INNER JOIN skills_job_dim ON top_paying_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;



/* 
Here's the breakdown of the most requested skills across the analyzed job postings:

SQL leads the rankings, appearing in every job posting analyzed.
Python follows closely, demonstrating the growing importance of programming in analytical roles.
Tableau ranks among the top visualization tools, indicating strong demand for dashboarding and business reporting expertise.
R, Snowflake, Pandas, and Excel also appear frequently, showing the need for a balanced combination of analytics, data processing, and reporting skills.
*/
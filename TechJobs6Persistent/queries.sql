-- Capture your answer here for each "Test It With SQL" section of this assignment
    -- write each as comments
    --yes I see tables and yes the tables have columns

--Part 1: List the columns and their data types in the Jobs table.
--Id (int 11), Name (Longtext), EmployerId (Id)
--Part 2: Write a query to list the names of the employers in St. Louis City.
--"SELECT Name FROM employers WHERE Location = 'St. Louis City';"

--Part 3: Write a query to return a list of the names and descriptions of all skills that are attached to jobs in alphabetical order.
    --If a skill does not have a job listed, it should not be included in the results of this query.
    --SELECT DISTINCT Skills.SkillName, Skills.SkillDescription FROM Skills INNER JOIN JobSkill ON Skills.Id = JobSkill.SkillId
--INNER JOIN Jobs ON JobSkill.JobId = Jobs.Id ORDER BY Skills.SkillName ASC;

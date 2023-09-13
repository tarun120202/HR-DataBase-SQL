-- QUESTIONS

-- 1. What is the gender breakdown of employees in the company?
		SELECT gender, COUNT(*) AS count 
        FROM hr 
        WHERE age >= 18 
        GROUP BY gender;
        
-- 2. What is the race/ethnicity breakdown of employees in the company?
		SELECT race, COUNT(*) AS count
		FROM hr
		WHERE age >= 18
		GROUP BY race
		ORDER BY count(*) DESC;
        
-- 3. What is the age distribution of employees in the company?
		SELECT 
		MIN(age) AS youngest,
		MAX(age) AS oldest
		FROM hr
		WHERE age >= 18;
		
        SELECT FLOOR(age/10)*10 AS age_group, COUNT(*) AS count
		FROM hr
		WHERE age >= 18
		GROUP BY FLOOR(age/10)*10;
        
        SELECT 
		CASE 
		WHEN age >= 18 AND age <= 24 THEN '18-24'
		WHEN age >= 25 AND age <= 34 THEN '25-34'
		WHEN age >= 35 AND age <= 44 THEN '35-44'
		WHEN age >= 45 AND age <= 54 THEN '45-54'
		WHEN age >= 55 AND age <= 64 THEN '55-64'
		ELSE '65+' 
		END AS age_group, 
		COUNT(*) AS count
		FROM hr
		WHERE age >= 18
		GROUP BY age_group
		ORDER BY age_group;
        
        SELECT 
		CASE 
		WHEN age >= 18 AND age <= 24 THEN '18-24'
		WHEN age >= 25 AND age <= 34 THEN '25-34'
		WHEN age >= 35 AND age <= 44 THEN '35-44'
		WHEN age >= 45 AND age <= 54 THEN '45-54'
		WHEN age >= 55 AND age <= 64 THEN '55-64'
		ELSE '65+' 
		END AS age_group, gender,
		COUNT(*) AS count
		FROM hr
	WHERE age >= 18
	GROUP BY age_group, gender
	ORDER BY age_group, gender;
        
-- 4. How many employees work at headquarters versus remote locations?
		SELECT location, COUNT(*) as count
		FROM hr
		WHERE age >= 18
		GROUP BY location;
	
-- 5. How does the gender distribution vary across departments and job titles?
		SELECT department, gender, COUNT(*) as count
		FROM hr
		WHERE age >= 18
		GROUP BY department, gender
		ORDER BY department;
	
-- 6. What is the distribution of job titles across the company?
		SELECT jobtitle, COUNT(*) as count
		FROM hr
		WHERE age >= 18
		GROUP BY jobtitle
		ORDER BY jobtitle DESC;

-- 7. What is the distribution of employees across locations by city and state?
		SELECT location_state, COUNT(*) as count
		FROM hr
		WHERE age >= 18
		GROUP BY location_state
		ORDER BY count DESC;

-- 8. What is the tenure distribution for each department?
		SELECT department, ROUND(AVG(DATEDIFF(CURDATE(), termdate)/365),0) as avg_tenure
		FROM hr
		WHERE termdate <= CURDATE() AND age >= 18
		GROUP BY department;
	
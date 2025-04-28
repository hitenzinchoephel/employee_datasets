
	   -- List of Business problems to be solved 

	   ----------------------------------------------------------------------------
	   ----------------------------------------------------------------------------

	   	-- Q.1 Find the top 3 highest paid employees in each department 
					
		-- Q.2 Find the average salary of employees hired in the past 5 years
				
		-- Q.3 Find the employees whose salary is less than the average salary of employees hired in the last 5 yrs
		
		-- Q.4 Find the employees whose salary is greater or equal than the average salary of employees hired in the last 5 yrs
		
		-- Q.5 Find the higest salary employees 
				
		-- Q.6 Find the 2nd highest salary of the employee 
		
		-- Q.7 Find the nth highest salary using cte 
	
		-- Q.8 Find the first an last name from full name column( name )
				
		-- Q.9 Find the percentage of department salary
		
		-- Q.10 Find the max and min salary of employee

		-- Q.11 How many employees joined in each year?

		
	   ----------------------------------------------------------------------------
	   ----------------------------------------------------------------------------

		--=================  START ===========
	   
		-- Q.1 Find the top 3 highest paid employees in each department 
	
		WITH
			CTE AS (
				SELECT
					EMP_ID,
					NAME,
					DEPARTMENT,
					SALARY,
					DENSE_RANK() OVER (
						PARTITION BY
							DEPARTMENT
						ORDER BY
							SALARY DESC
					) AS RNK
				FROM
					EMPLOYEE
			)
		SELECT
			*
		FROM
			CTE
		WHERE
			RNK <= 3
			
		-- Q.2 Find the average salary of employees hired in the past 5 years
	
		SELECT
			ROUND(AVG(SALARY), 2) AS AVERAGE_SALARY
		FROM
			EMPLOYEE
		WHERE
			JOINING_DATE >= CAST(CURRENT_DATE - INTERVAL '5 years' AS DATE)
			-- Answer is 83714.29 
			
		-- Q.3 Find the employees whose salary is less than the average salary of employees hired in the last 5 yrs
	
		SELECT
			*
		FROM
			EMPLOYEE
		WHERE
			SALARY < (
				SELECT
					ROUND(AVG(SALARY), 2) AS AVERAGE_SALARY
				FROM
					EMPLOYEE
				WHERE
					JOINING_DATE >= CAST(CURRENT_DATE - INTERVAL '5 years' AS DATE)
			)
			
		-- Q.4 Find the employees whose salary is greater or equal than the average salary of employees hired in the last 5 yrs
		
		SELECT
			*
		FROM
			EMPLOYEE
		WHERE
			SALARY >= (
				SELECT
					ROUND(AVG(SALARY), 2) AS AVERAGE_SALARY
				FROM
					EMPLOYEE
				WHERE
					JOINING_DATE >= CAST(CURRENT_DATE - INTERVAL '5 years' AS DATE)
			)
		-- Q.5 Find the higest salary employees 
	
		SELECT
			*
		FROM
			EMPLOYEE
		WHERE
			SALARY = (
				SELECT
					MAX(SALARY)
				FROM
					EMPLOYEE
			)
			
		-- Q.6 Find the 2nd highest salary of the employee 

	
		SELECT
			MAX(SALARY)
		FROM
			EMPLOYEE
		WHERE
			SALARY < (
				SELECT
					MAX(SALARY)
				FROM
					EMPLOYEE
			)
			
		-- Q.7 Find the nth highest salary using cte 
	
		WITH
			CTE_SALARY_RANK AS (
				SELECT
					*,
					ROW_NUMBER() OVER (
						ORDER BY
							SALARY DESC
					) AS RN
				FROM
					EMPLOYEE
			)
		SELECT
			*
		FROM
			CTE_SALARY_RANK
		WHERE
			RN = 2
			
		-- Q.8 Find the first an last name from full name column( name )
		
		SELECT
			*,
			SUBSTRING(
				NAME
				FROM
					1 FOR POSITION(' ' IN NAME) - 1
			) AS FIRST_NAME,
			SUBSTRING(
				NAME
				FROM
					POSITION(' ' IN NAME) + 1
			) AS LAST_NAME
		FROM
			EMPLOYEE
		
		-- Q.9 Find the percentage of department salary 
	
		SELECT
			DEPARTMENT,
			SUM(SALARY) AS TOTAL,
			ROUND(
				SUM(SALARY) * 100.00 / (
					SELECT
						SUM(SALARY)
					FROM
						EMPLOYEE
				),
				2
			) AS PERCENTAGE
		FROM
			EMPLOYEE
		GROUP BY
			1
		ORDER BY
			TOTAL DESC


		-- Q.10 Find the max and min salary of employee

		SELECT 
			   MAX(salary) AS max_salary, 
			   MIN(salary) AS min_salary
		FROM employee

		-- Q.11 How many employees joined in each year?

		SELECT 
			EXTRACT('year' FROM joining_date) AS year,
			COUNT(*) AS no_of_emp_joined 
		FROM employee
		GROUP BY year 
		ORDER BY year

-- ================= END OF PROJECT ==========================

		
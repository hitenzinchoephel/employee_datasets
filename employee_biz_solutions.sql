
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
	
	-- Q.12 Find the mean and median  salary

	
   ----------------------------------------------------------------------------
   ----------------------------------------------------------------------------

	-- START --   
   
-- Q.1 Find the top 3 highest paid employees in each department 


    With cte as (
	select
		emp_id,
		name,
		depart,
		salary,
		dense_rank() over (partition by department order by salary desc) AS RNK
        from employee)
   select * from cte where rnk<=3;

--  Q.2 Find the average salary of employees hired in the past 5 years

	select
             round(avg(salary), 2) as average_salary
         from employee
         where joining_date >= cast(current_date - interval '5 years' as date);

--  Q.3 Find the employees whose salary is less than the average salary of employees hired in the last 5 yrs

       select *
       from employee
       where salary < (select round(avg(salary), 2) as average_salary from employee
                        where joining_date >= cast(current_date - interval '5 years' as date)
			);
--  Q.4 Find the employees whose salary is greater or equal than the average salary of employees hired in the last 5 yrs
		
      select * from employee
		where salary >= ( select round(avg(salary), 2) as average_salary from employee
                                  where joining_date  >= cast(current_date - interval '5 years' as date)) ;

-- Q.5 Find the higest salary employees 

	select * from employee where salary = ( select  max(salary) from employee )

			
-- Q.6 Find the 2nd highest salary of the employee 

		select max(salary) from employee
		      where salary <(select max(salary) from employee)
			
-- Q.7 Find the nth highest salary using cte  (here we wil find second )

     with cte_salary_rank as (
	select *,
		  row_number() over (order by salary desc) as rn
	from employee
	)	
     select * from cte_salary_rank where rn = 2


-- Q.8 Find the first an last name from full name column( name )

	select *,
	   substring(name from 1 for position(' ' in name) - 1) as first_name,
	   substring(name from position(' ' in name) + 1) as last_name
	from employee

		
--  Q.9 Find the percentage of department salary 

    select
	department,
	sum(salary) as total,
	round(sum(salary) * 100.00 / (select sum(salary)from employee),2) as percentage
    from employee
    group by 1
    order by total desc


-- Q.10 Find the max and min salary of employee
 
        select 
           max(salary) AS max_salary, 
            min(salary) AS min_salary
        from employee

  
-- Q.11 How many employees joined in each year?

          select 
              extract('year' from joining_date) as year,
              count(*) as no_of_emp_joined 
          from employee
          group by year
          order by year

 -- Q.12 Find mean and median salary of employees

        -- mean salary --

	select round(avg(salary),2) as average_salary from employee

		-- median salary --

	select percentile_cont(0.5) within group(order by salary) as median_salary from employee


        --  END OF PROJECT -- 

	

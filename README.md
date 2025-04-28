# Employee datasets data analysis using PostgreSQL

# Overview
This Employee dataset mini project involes solving basic to intermediate business problems. Here the goal is to extract valuable insights and answer business problems. We will be using PostgreSQL as a tool to solve the problems. 

# Objective 
* Find descriptive statistics as min, max and percentile_cont.
* Find central tendency statistics as mean and median.
* Explore other metrics which will be helpful to make decisions.

# Schemas 
```sql
		DROP TABLE IF EXISTS employee;
	
		CREATE TABLE employee (
			emp_id int primary key,
			name varchar(30),
			department varchar(20),
			salary numeric(10, 2) check (salary > 0),
			joining_date date
		)
```



# Q.1 Find the top 3 highest paid employees in each department 

```sql
    With cte as (
					select
					emp_id,
					name,
					depart,
					salary,
					dense_rank() over (partition by department order by salary desc) AS RNK
				from employee
			)
		select * from cte where rnk<=3;
```


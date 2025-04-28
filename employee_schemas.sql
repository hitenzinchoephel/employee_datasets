		-- Start  of schemas 
		
		-- Drop if employee table exist 
		DROP TABLE IF EXISTS employee;
		
	    -- Create a table called employee 
		
		CREATE TABLE employee (
			emp_id int primary key,
			name varchar(30),
			department varchar(20),
			salary numeric(10, 2) check (salary > 0),
			joining_date date
		)
		
		-- Insert the records in employee table 
		
		INSERT INTO employee ( emp_id, name, department, salary, joining_date) 
		VALUES  
		    (101, 'Alice Johnson', 'Finance', 75000.00, '2020-03-15'),
		    (102, 'Bob Smith', 'Engineering', 90000.00, '2019-07-22'),
		    (103, 'Charlie Brown', 'Human Resources', 60000.00, '2021-01-10'),
		    (104, 'David White', 'Marketing', 70000.00, '2018-06-05'),
		    (105, 'Emma Davis', 'Engineering', 98000.00, '2022-09-12'),
		    (106, 'Franklin Harris', 'Finance', 72000.00, '2017-11-23'),
		    (107, 'Grace Miller', 'Engineering', 98000.00, '2021-05-18'),
		    (108, 'Hannah Wilson', 'Human Resources', 65000.00, '2019-09-30'),
		    (109, 'Ian Thompson', 'Marketing', 73000.00, '2020-12-14'),
		    (110, 'Jackie Lewis', 'Engineering', 87000.00, '2016-04-25'),
		    (111, 'Katherine Scott', 'Finance', 78000.00, '2022-07-19'),
		    (112, 'Leo Martin', 'Human Resources', 63000.00, '2018-10-08'),
		    (113, 'Maria Gonzalez', 'Marketing', 76000.00, '2019-06-21'),
		    (114, 'Nathan Walker', 'Engineering', 99000.00, '2023-02-11'),
		    (115, 'Olivia King', 'Finance', 80000.00, '2021-08-27');
		
		-- Peform a select query to see the records of employee
		       select * from employee 
		
			-- End of schemas 
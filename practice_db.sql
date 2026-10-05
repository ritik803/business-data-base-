CREATE DATABASE sql_practice;
USE sql_practice;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employee_projects;

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL,
    location TEXT
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department_id INTEGER,
    manager_id INTEGER,          
    hire_date TEXT,             
    salary REAL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY,
    project_name TEXT NOT NULL,
    department_id INTEGER,
    budget REAL,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE employee_projects (
    employee_id INTEGER,
    project_id INTEGER,
    hours_logged REAL,
    role TEXT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO departments VALUES
(1, 'Engineering', 'Bangalore'),
(2, 'Sales', 'Mumbai'),
(3, 'Marketing', 'Delhi'),
(4, 'HR', 'Bangalore'),
(5, 'Finance', 'Mumbai');

INSERT INTO employees VALUES
(1, 'Amit', 'Sharma', 1, NULL, '2015-03-01', 220000),
(2, 'Priya', 'Nair', 1, 1, '2016-07-15', 150000),
(3, 'Rahul', 'Verma', 1, 1, '2018-01-10', 130000),
(4, 'Sneha', 'Kapoor', 1, 2, '2020-05-23', 95000),
(5, 'Vikram', 'Singh', 2, NULL, '2014-11-11', 200000),
(6, 'Anita', 'Desai', 2, 5, '2017-09-01', 110000),
(7, 'Karan', 'Mehta', 2, 5, '2021-02-14', 85000),
(8, 'Neha', 'Joshi', 3, NULL, '2019-06-01', 140000),
(9, 'Rohit', 'Gupta', 3, 8, '2022-08-19', 78000),
(10, 'Divya', 'Iyer', 4, NULL, '2013-04-04', 160000),
(11, 'Arjun', 'Reddy', 4, 10, '2020-10-10', 90000),
(12, 'Pooja', 'Malhotra', 5, NULL, '2016-01-20', 175000),
(13, 'Suresh', 'Rao', 5, 12, '2021-11-05', 88000),
(14, 'Meera', 'Pillai', NULL, NULL, '2023-01-15', 60000),  -- unassigned dept, no manager
(15, 'Aditya', 'Kumar', 1, 2, '2023-03-01', 92000);

INSERT INTO projects VALUES
(1, 'Website Revamp', 1, 500000, '2023-01-01', '2023-06-30'),
(2, 'Mobile App Launch', 1, 800000, '2023-02-15', '2023-12-31'),
(3, 'Q3 Sales Push', 2, 300000, '2023-07-01', '2023-09-30'),
(4, 'Brand Campaign', 3, 450000, '2023-03-01', '2023-08-31'),
(5, 'Payroll System Upgrade', 4, 200000, '2023-01-10', '2023-04-10'),
(6, 'Audit 2023', 5, 150000, '2023-01-01', '2023-03-31'),
(7, 'Data Pipeline Migration', 1, 600000, '2023-05-01', NULL); -- ongoing, no end date

INSERT INTO employee_projects VALUES
(1, 1, 120, 'Lead'),
(2, 1, 300, 'Developer'),
(3, 1, 280, 'Developer'),
(2, 2, 200, 'Lead'),
(4, 2, 350, 'Developer'),
(15, 2, 150, 'Developer'),
(5, 3, 180, 'Lead'),
(6, 3, 220, 'Sales Rep'),
(7, 3, 190, 'Sales Rep'),
(8, 4, 160, 'Lead'),
(9, 4, 240, 'Marketing Associate'),
(10, 5, 100, 'Lead'),
(11, 5, 260, 'Analyst'),
(12, 6, 90, 'Lead'),
(13, 6, 210, 'Auditor'),
(3, 7, 50, 'Developer'),
(15, 7, 40, 'Developer');



-- SALES SCHEMA

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT,
    signup_date TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    status TEXT,  -- 'completed', 'cancelled', 'pending'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Ravi Kumar', 'Bangalore', '2022-01-15'),
(2, 'Sunita Rani', 'Delhi', '2022-03-20'),
(3, 'Manoj Tiwari', 'Mumbai', '2022-05-11'),
(4, 'Kavita Joshi', 'Pune', '2022-07-09'),
(5, 'Deepak Chawla', 'Bangalore', '2023-01-02'),
(6, 'Anjali Bhatt', 'Chennai', '2023-02-18'),
(7, 'Rakesh Yadav', 'Delhi', '2023-04-25'),
(8, 'Shalini Menon', 'Kochi', '2023-06-30');

INSERT INTO products VALUES
(1, 'Wireless Mouse', 'Electronics', 799),
(2, 'Mechanical Keyboard', 'Electronics', 2999),
(3, 'USB-C Cable', 'Electronics', 299),
(4, 'Office Chair', 'Furniture', 6499),
(5, 'Standing Desk', 'Furniture', 15999),
(6, 'Notebook Set', 'Stationery', 199),
(7, 'Water Bottle', 'Lifestyle', 499),
(8, 'Backpack', 'Lifestyle', 1899);

INSERT INTO orders VALUES
(1, 1, '2023-01-05', 'completed'),
(2, 2, '2023-01-20', 'completed'),
(3, 1, '2023-02-14', 'cancelled'),
(4, 3, '2023-03-01', 'completed'),
(5, 4, '2023-03-15', 'completed'),
(6, 5, '2023-04-02', 'pending'),
(7, 2, '2023-04-18', 'completed'),
(8, 6, '2023-05-05', 'completed'),
(9, 7, '2023-05-20', 'cancelled'),
(10, 1, '2023-06-01', 'completed'),
(11, 8, '2023-06-15', 'completed'),
(12, 3, '2023-07-01', 'pending'),
(13, 5, '2023-07-20', 'completed'),
(14, 4, '2023-08-05', 'completed');

INSERT INTO order_items VALUES
(1, 1, 1, 2, 799),
(2, 1, 3, 3, 299),
(3, 2, 4, 1, 6499),
(4, 3, 2, 1, 2999),
(5, 4, 5, 1, 15999),
(6, 5, 6, 5, 199),
(7, 5, 7, 2, 499),
(8, 6, 8, 1, 1899),
(9, 7, 1, 1, 799),
(10, 7, 2, 1, 2999),
(11, 8, 3, 10, 299),
(12, 9, 4, 1, 6499),
(13, 10, 7, 3, 499),
(14, 10, 6, 2, 199),
(15, 11, 5, 1, 15999),
(16, 12, 8, 2, 1899),
(17, 13, 1, 4, 799),
(18, 14, 2, 2, 2999);

-- 1.Retrieve all active employees belonging to the 'Engineering' department.
SELECT 
    e.employee_id, e.first_name, e.last_name, d.department_name
FROM
    employees e
        INNER JOIN
    departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'Engineering';


-- 2.List all products with a unit price exceeding ₹1,000, sorted in descending order of price.
SELECT 
    *
FROM
    products
WHERE
    price > 1000
ORDER BY price DESC;


-- 3.Identify all employees hired after January 1, 2020.
SELECT 
    *
FROM
    employees
WHERE
    hire_date > 2020 - 01 - 01;


-- 4.Extract customer profiles located in either Bangalore or Delhi.
SELECT 
    *
FROM
    customers
WHERE
    city = 'Bangalore' OR city = 'Delhi';

-- . 5.Display each employee alongside their corresponding department name.
SELECT 
    e.first_name, e.last_name, d.department_name
FROM
    employees e
        INNER JOIN
    departments d ON e.department_id = d.department_id;
    
-- 6.Fetch order details including customer names and respective order dates.
SELECT 
    o.order_id, c.customer_name, o.order_date
FROM
    orders o
        INNER JOIN
    customers c ON o.customer_id = c.customer_id;


-- 7.Retrieve a comprehensive list of all projects mapped to their assigned departments.
SELECT 
    p.project_name, d.department_name
FROM
    projects p
        INNER JOIN
    departments d ON p.department_id = d.department_id;
    
    
-- 8.List line items, product names, and ordered quantities specifically for order_id = 5
SELECT 
    oi.order_id, p.product_name, p.price
FROM
    order_items oi
        INNER JOIN
    products p ON oi.product_id = p.product_id
WHERE
    oi.order_id = 5;


-- 9.Identify all employees who are currently not assigned to any department (unassigned records).
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    department_id IS NULL;
    

-- 10.Calculate the total salary expenditure across each department.
SELECT 
    d.department_name, SUM(e.salary) AS total_salary
FROM
    departments d
        INNER JOIN
    employees e ON d.department_id = e.department_id
GROUP BY d.department_name;


-- 11.Compute the total revenue generated per order (quantity × unit_price).
SELECT 
    o.order_id,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM
    orders o
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;


-- . 12.Filter and identify departments with an employee headcount greater than 3.
SELECT 
    department_id, COUNT(*) AS total_emp
FROM
    employees
GROUP BY department_id
HAVING total_emp > 3;


-- 13.Determine the average product price across each merchandise category.
SELECT 
    category, ROUND(AVG(price), 2) AS avg_price
FROM
    products
GROUP BY category;


-- 14.Identify high-frequency customers who have placed more than 2 orders.
SELECT 
    customer_id, COUNT(*) AS cus
FROM
    orders
GROUP BY customer_id
HAVING cus > 2;


-- 15.Identify employees whose compensation exceeds the average salary of their respective department.
SELECT 
    employee_id, first_name, salary
FROM
    employees e1
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees e2
        WHERE
            e1.department_id = e2.department_id);


-- 16.Find unsold inventory: list all products that have never been ordered.
SELECT 
    p.product_name
FROM
    products p
        LEFT JOIN
    order_items oi ON p.product_id = oi.product_id
WHERE
    oi.product_id IS NULL;


-- 17.Determine the highest-spending customer based exclusively on completed orders.
SELECT 
    c.customer_name,
    SUM(oi.unit_price * oi.quantity) AS total_rev
FROM
    customers c
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    status = 'completed'
GROUP BY c.customer_name
ORDER BY total_rev DESC
LIMIT 3;


-- 18.Identify all employees serving in managerial roles (individuals referenced as a manager_id).
SELECT 
    employee_id, first_name
FROM
    employees
WHERE
    employee_id IN (SELECT 
            manager_id
        FROM
            employees
        WHERE
            manager_id IS NOT NULL);


-- 19.Rank employees by salary within each individual department using window functions.
select d.department_name , e.first_name , e.salary,
dense_rank() over (partition by d.department_name order by e.salary desc) as salary_rank
from departments d 
inner join employees e 
on d.department_id = e.department_id;


-- 20.Extract the highest-paid employee from each department.
with top_salary as  (select d.department_name , e.first_name , e.salary,
dense_rank() over (partition by d.department_name order by salary desc) as top_salary 
from departments d 
inner join employees e 
on d.department_id = e.department_id )
select * from top_salary 
where top_salary = 1;


-- 21.Calculate the cumulative running revenue of completed orders chronologically over time.
with cum as (select o.order_date , o.status ,
sum(oi.unit_price * oi.quantity) over (partition by o.order_date order by o.order_date) as running_total from orders o
inner join order_items oi 
on o.order_id = oi.order_id)
select * from cum 
where status = 'completed';


-- 22.Calculate the salary variance between each employee and the next highest-earning peer in their department.
with salary_diff as (select d.department_name , e.first_name , e.salary , 
dense_rank() over (partition by d.department_name order by e.salary desc ) as highest_salary 
from departments d inner join employees e 
on d.department_id = e.department_id)
select department_name ,
max(case when highest_salary = 1 then salary end) as highest_salaryy,
max(case when highest_salary = 2 then salary end) as sec_salary,
max(case when highest_salary = 1 then salary end) -
max(case when highest_salary = 2 then salary end) as salary_difff
from salary_diff
where highest_salary in (1,2)
group by department_name;



-- 23.Map each employee to their designated reporting manager using a self-join
SELECT 
    e.first_name AS emp_name, m.first_name AS manager_name
FROM
    employees e
        LEFT JOIN
    employees m ON e.manager_id = m.employee_id;


-- 24.Identify employees who earn a higher salary than their direct manager.
SELECT 
    e.first_name AS emp_name,
    e.salary AS emp_salary,
    m.first_name AS manager_name,
    m.salary AS manager_salary
FROM
    employees e
        INNER JOIN
    employees m ON e.manager_id = e.employee_id
WHERE
    e.salary > m.salary;






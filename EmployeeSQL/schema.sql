CREATE TABLE Department (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Title (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL REFERENCES Title(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Salary (
    emp_no INT PRIMARY KEY REFERENCES Employee(emp_no),
    salary INT NOT NULL
);

CREATE TABLE DeptEmp (
    emp_no INT REFERENCES Employee(emp_no),
    dept_no VARCHAR(4) REFERENCES Department(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE DeptManager (
    dept_no VARCHAR(4) REFERENCES Department(dept_no),
    emp_no INT REFERENCES Employee(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);


Department
----------
dept_no PK varchar(4)
dept_name varchar(50) UNIQUE

Employee
--------
emp_no PK int
emp_title_id varchar(5) FK >- Title.title_id
birth_date date
first_name varchar(50)
last_name varchar(50)
sex char(1)
hire_date date

Title
-----
title_id PK varchar(5)
title varchar(50)

Salary
------
emp_no INT PK FK >- Employee.emp_no
salary INT

DeptEmp
-------
emp_no INT PK FK >- Employee.emp_no
dept_no VARCHAR(4) PK FK >- Department.dept_no

DeptManager
-----------
dept_no varchar(4) PK FK >- Department.dept_no
emp_no int PK FK >- Employee.emp_no

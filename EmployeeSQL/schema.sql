DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_employees CASCADE;
DROP TABLE IF EXISTS Managers CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;

-- Titles table
CREATE table Titles(
    title_id varchar(10) NOT NULL,
    title varchar(30) NOT NULL
    Primary key (title_id))

-- Employees data table
CREATE table Employees(
    emp_no varchar(10) NOT NULL,
    emp_title_id varchar(10) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(35) NOT NULL,
    last_name varchar(35) NOT NULL,
    sex varchar(2) NOT NULL,
    hire_date date NOT NULL,
    Primary key (emp_no)
    Foreign key(emp_title_id) references Titles(title_id))  

-- Departments table
CREATE table Departments(
    dept_no varchar(10) NOT NULL,
    dept_name varchar(25) NOT NULL,
    Primary key (dept_no))

-- Employees by Department table
CREATE table Dept_employees(
    emp_no varchar(10) NOT NULL,
    dept_no varchar(10) NOT NULL,
    Foreign key (emp_no) references Employees(emp_no),
    Foreign key (dept_no) references Departments(dept_no))

-- Managers table
CREATE table Managers(
    dept_no varchar(10) NOT NULL,
    emp_no varchar(10) NOT NULL,
    Foreign key (emp_no) references Employees(emp_no),
    Foreign key (dept_no) references Departments(dept_no))


-- Salaries table
CREATE table Salaries(
    emp_no varchar(10) NOT NULL,
    salary money NOT NULL,
    Foreign key (emp_no) references Employees(emp_no))

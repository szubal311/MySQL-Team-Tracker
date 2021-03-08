-- DROP DATABASE IF EXISTS employees_db; -- 

CREATE DATABASE employees_db;

USE employees_db;

CREATE TABLE department (
	id INTEGER NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR (50),
    PRIMARY KEY (id)
    
);

INSERT INTO department (dept_name)
VALUES ("Sales");

INSERT INTO department (dept_name)
VALUES ("Marketing");

INSERT INTO department (dept_name)
VALUES ("Finance");

INSERT INTO department (dept_name)
VALUES ("Product");


CREATE TABLE role (
	id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR (50) NOT NULL,
    salary DECIMAL (10,2)NOT NULL,
    department_id INTEGER NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO role (title, salary, department_id)
VALUES ("Sales Manager", 100000, 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Sale sperson", 80000, 1);

INSERT INTO role (title, salary, department_id)
VALUES ("Director of Marketing", 250000, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Email Marketing Specialist", 120000, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Digital Marketing Specialist", 140000, 2);

INSERT INTO role (title, salary, department_id)
VALUES ("Accountant", 125000, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Corporate Controller", 175000, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Payroll Manager", 130000, 3);

INSERT INTO role (title, salary, department_id)
VALUES ("Product Manager", 250000, 4);

INSERT INTO role (title, salary, department_id)
VALUES ("Full-Stack Developer", 275000, 4);

INSERT INTO role (title, salary, department_id)
VALUES ("UX Designer", 220000, 4);


CREATE TABLE employee ( 
id INTEGER NOT NULL AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
role_id INTEGER NOT NULL,
manager_name VARCHAR (50),
PRIMARY KEY (id)	
);

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Din", "Djarn", 1, null);

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Cal", "Kestis", 2, "Din Djarn");

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Wanda", "Maximoff", 3, null);

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Desmond", "Miles", 4, "Wanda Maximov");

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Ezio", "Auditore", 5, null);

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Stephen", "Strange", 6, "Ezio Auditore");

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Tony", "Stark", 7, null);

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Scott", "Lang", 8, "Sarah Lourde");

INSERT INTO employee (first_name, last_name, role_id, manager_name)
VALUES ("Luke", "Skywalker", 3, "Ezio Auditore");

-- DROP TABLE department; -- 
-- DROP TABLE role; -- 
-- DROP TABLE employee; -- 







-- DROP DATABASE IF EXISTS employees_db; -- 

CREATE DATABASE employees_db;

USE employees_db;

CREATE TABLE department (
	dept_id INTEGER NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR (50),
    PRIMARY KEY (dept_id)
    
);

INSERT INTO department (dept_name)
VALUES ("Management");

INSERT INTO department (dept_name)
VALUES ("Marketing");

INSERT INTO department (dept_name)
VALUES ("Product");


CREATE TABLE company_roles (
	role_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR (50) NOT NULL,
    salary DECIMAL (10,2)NOT NULL,
    dept_id INTEGER NOT NULL,
    PRIMARY KEY (role_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO company_roles (title, salary, dept_id)
VALUES ("General Manager", 400000, 1);

INSERT INTO company_roles (title, salary, dept_id)
VALUES ("Director of Marketing", 300000, 2);

INSERT INTO company_roles (title, salary, dept_id)
VALUES ("Marketing Specialist", 180000, 2);

INSERT INTO company_roles (title, salary, dept_id)
VALUES ("Product Manager", 280000, 3);

INSERT INTO company_roles (title, salary, dept_id)
VALUES ("Full-Stack Developer", 275000, 3);

INSERT INTO company_roles (title, salary, dept_id)
VALUES ("UX Designer", 220000, 3);


CREATE TABLE employee ( 
employ_id INTEGER NOT NULL AUTO_INCREMENT,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
employ_role_id INTEGER NOT NULL,
manager_id INTEGER,
PRIMARY KEY (employ_id),
FOREIGN KEY (employ_role_id) REFERENCES company_roles(role_id),
FOREIGN KEY (manager_id) REFERENCES employee(employ_id)
);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Din", "Djarn", 1, null);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Wanda", "Maximoff", 2, 1);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Cal", "Kestis", 3, 2);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Ezio", "Auditore", 4, 1);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Desmond", "Miles", 3, 2);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Stephen", "Strange", 6, 4);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Tony", "Stark", 5, 4);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Scott", "Lang", 5, 4);

INSERT INTO employee (first_name, last_name, employ_role_id, manager_id)
VALUES ("Luke", "Skywalker", 3, 2);

-- DROP TABLE department; -- 
-- DROP TABLE role; -- 
-- DROP TABLE employee; -- 







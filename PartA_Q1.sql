-- Write the query to create the 4 tables below.
-- Question 1: --
/*Create a table called client with the following columns:

id- an auto-incrementing integer which is the primary key, size 11
first_name- a varchar with a maximum length of 255 characters, cannot be null
last_name- a varchar with a maximum length of 255 characters, cannot be null
email- a varchar with a maximum length of 255 characters, cannot be null
The combination of the first_name and last_name must be unique in this table.  Name this constraint as full_name*/

CREATE TABLE `client`(
`id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,
`last_name` varchar(255) NOT NULL,
`email` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT full_name UNIQUE (first_name, last_name)
)ENGINE=InnoDB;

/*id- an auto-incrementing integer which is the primary key, size 11
first_name- a varchar of maximum length 255, cannot be null
last_name- a varchar of maximum length 255, cannot be null
start_date- a date, cannot be null
email- a varchar with a maximum length of 255 characters, cannot be null
The combination of the first_nameand last_name must be unique in this table. Name this constraint as full_name*/

CREATE TABLE `employee`(
`id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,
`last_name` varchar(255) NOT NULL,
`start_date` DATE NOT NULL,
`email` varchar(255) NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT full_name UNIQUE (first_name, last_name)
)ENGINE=InnoDB;

/*Create a table called project with the following columns:

id- an auto-incrementing integer which is the primary key, size 11
title- a varchar of maximum length 255, cannot be null
comments- a text column
cid- an integer which is a foreign key reference to the client table
The project title must be unique in this table*/

CREATE TABLE `project`(
`id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(255) NOT NULL,
`comments` TEXT,
`cid` INT,
PRIMARY KEY (`id`),
FOREIGN KEY (`cid`) REFERENCES `client` (`id`)
)ENGINE=InnoDB;


/*Create a table called works_on representing a many-to-many relationship between employees and projects, with the following properties:

pid- an integer which is a foreign key reference to the project table
eid- an integer which is a foreign key reference to the employee table
due_date- a date, not null
The primary key is a combination of eid and pid*/

CREATE TABLE `works_on`(
`pid` INT,
`eid` INT,
`due_date` DATE NOT NULL,
FOREIGN KEY (`pid`) REFERENCES `project` (`id`),
FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
PRIMARY KEY (`pid`, `eid`)
)ENGINE=InnoDB;

-- Leave the queries below untouched. These are to test your submission correctly.
-- Test that the tables were created
DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created 
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE REFERENCED_TABLE_SCHEMA = 'grade';



















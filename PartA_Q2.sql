--Insert data in the tables

--Client TABLE

INSERT INTO client (first_name, last_name, email) VALUES ('Sarah', 'Smith', 'smiths@hello.com');
INSERT INTO client (first_name, last_name, email) VALUES ('Miguel', 'Cabrera', 'mc@hello.com');
INSERT INTO client (first_name, last_name, email) VALUES ('Bo', 'Chan''g', 'bochang@hello.com');

--Employee TABLE
INSERT INTO employee (first_name, last_name, start_date, email) VALUES ('Anaya', 'Jaiswal', '2008-04-10', 'ajaiswal@hello.com');
INSERT INTO employee (first_name, last_name, start_date, email) VALUES ('Michael', 'Fern', '2015-07-19', 'michaelf@hello.com');
INSERT INTO employee (first_name, last_name, start_date, email) VALUES ('Abdul', 'Rehman', '2018-02-27', 'rehman@hello.com');

--Project TABLE
INSERT INTO project (cid, title, comments) VALUES (
	(SELECT id FROM client WHERE first_name='Sara' AND last_name='Smith'),
	'Diamond',
	'Should be done by Jan 2019');
	
INSERT INTO project (cid, title, comments) VALUES (
	(SELECT id FROM client WHERE first_name='Bo' AND last_name='Chan''g'),
	'Chan''g',
	'Ongoing maintenance');
	
INSERT INTO project (cid, title, comments) VALUES (
	(SELECT id FROM client WHERE first_name='Miguel' AND last_name='Cabrera'),
	'The Robinson Project',
	NULL);
	
--Works on TABLE
INSERT INTO works_on (eid, pid, due_date) VALUES(
	(SELECT id FROM employee WHERE first_name='Anaya' AND last_name='Jaiswal'),
	(SELECT cid FROM project WHERE title='Chan''g'),
	'2020-11-19');
	
INSERT INTO works_on (eid, pid, due_date) VALUES(
	(SELECT id FROM employee WHERE first_name='Michael' AND last_name='Fern'),
	(SELECT cid FROM project WHERE title='The Robinson Project'),
	'2020-12-05');

INSERT INTO works_on (eid, pid, due_date) VALUES(
	(SELECT id FROM employee WHERE first_name='Abdul' AND last_name='Rehman'),
	(SELECT cid FROM project WHERE title='Diamond'),
	'2021-01-01');	
	
	
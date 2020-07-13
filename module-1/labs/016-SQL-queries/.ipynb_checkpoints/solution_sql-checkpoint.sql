-- 1.1 TABLE CREATION
CREATE TABLE employees(role text,
					   name text,
					   years_employed bigint,
					   building text
					  );
					  
-- 1.2 INSERT VALUES
INSERT INTO employees (role,name,years_employed,building)
VALUES ('Engineer', 'Becky A.', 4, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Engineer', 'Dan B.', 2, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Engineer', 'Sharon F.', 6, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Engineer', 'Dan M.', 4, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Engineer', 'Malcom', 1, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Artist', 'Tylar S.', 2, 'Empire State');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Artist', 'Sherman', 8, 'Empire State');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Artist', 'Jakob J.', 6, 'Empire State');

INSERT INTO employees (role,name,years_employed,building)
VALUES	('Artist', 'Lillia A.', 7, 'Empire State');
	
INSERT INTO employees (role,name,years_employed,building)
VALUES ('Artist', 'Brandon', 7, 'Empire State');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Manager', 'Scott K.', 9, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Manager', 'Shirlee M.', 3, 'Burj Khalifa');

INSERT INTO employees (role,name,years_employed,building)
VALUES ('Manager', 'Daria O.', 6, 'Empire State');

INSERT INTO employees (role,name,years_employed)
VALUES ('Engineer', 'Yancy I.', 0);

INSERT INTO employees (role,name,years_employed)
VALUES ('Artisti', 'Oliver P.', 0);

-- 2.1 CREATING SECONDARY TABLES

CREATE TABLE role_info(role_id int,
					   rolename text)
					   
INSERT INTO role_info (role_id, rolename)
VALUES (1,'Engineer');

INSERT INTO role_info (role_id, rolename)
VALUES (2,'Artist');

INSERT INTO role_info (role_id, rolename)
VALUES (3,'Manager');

-- 2.2 CREATING THE BUILDING INFORMATION
CREATE TABLE building_info(building_id int,
						  building_name text,
						  height int
						 );
						 
INSERT INTO building_info (building_id,building_name,height)
VALUES (1, 'Burj Khalifa', 381);

INSERT INTO building_info (building_id,building_name,height)
VALUES (2, 'Empire State', 828);

-- 3.1 UPDATE ORIGINAL TABLE

UPDATE employees
SET role = role_info.role_id FROM role_info
WHERE employees.role = role_info.rolename;

-- 4.2 BRING RESULTS BACK

SELECT 

SELECT table1.column1, table2.column2...
FROM table1
INNER JOIN table2
ON table1.common_field = table2.common_field;


-- 
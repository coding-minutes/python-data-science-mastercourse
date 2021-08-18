-- Creating and Deleting Databases 

SHOW DATABASES;
CREATE DATABASE abc;
SELECT DATABASE();
USE abc;
DROP DATABASE abc;

-- Creating and Deleting Tables

CREATE TABLE students(
	name varchar(50),
	roll_no int
);
DROP TABLE students;

-- Alter(Modify) Tables

ALTER TABLE students ADD class int;
ALTER TABLE students ADD age varchar(10);
ALTER TABLE students DROP COLUMN class;
ALTER TABLE students ALTER COLUMN age int;


-- Table Constraints

CREATE TABLE students(
	id int NOT NULL UNIQUE PRIMARY KEY,
	name varchar(50) NOT NULL DEFAULT 'Unnamed',
	age int NOT NULL,
	class int NOT NULL
);

-- Insert Records

INSERT INTO students
(id, name, age, class)
VALUES
(1, 'mohit', 18, 12),
(2, 'rohit', 17, 11),
(3, 'jatin', 14, 8),
(4, 'shweta', 19,12),
(5, 'prateek', 14, 8),
(6, 'vishnu', 12, 7),
(7, 'mahesh', 17, 10),
(8, 'aparna', 16, 11),
(9, 'jatin', 17, 11),
(10, 'rohit', 13, 8);


-- SELECT Statement

SELECT * FROM students;
SELECT name FROM students;
SELECT id,name FROM students;
SELECT class, age, id, name FROM students;

SELECT DISTINCT name FROM students;
SELECT DISTINCT name, class FROM students;

-- Limit, Offset, OrderBy

SELECT * FROM students LIMIT 3;
SELECT * FROM students LIMIT 3 OFFSET 5;
SELECT * FROM students ORDER BY class;
SELECT * FROM students ORDER BY class, age;
SELECT * FROM students ORDER BY class DESC, age DESC;

-- Where Clause

SELECT * FROM students WHERE class = 12;
SELECT * FROM students WHERE id=5;
SELECT * FROM students WHERE age < 16;
SELECT * FROM students WHERE name='jatin';

-- Logical Operators

SELECT * FROM students WHERE class >= 11 AND age <18;
SELECT * FROM students WHERE class >= 11 OR age <15;
SELECT * FROM students WHERE NOT name = 'jatin';
SELECT * FROM students WHERE age BETWEEN 13 AND 17;
SELECT * FROM students WHERE name IN('jatin','aparna', 'rohit');
SELECT * FROM students WHERE name LIKE 'a%';
SELECT * FROM students WHERE name LIKE '%a';
SELECT * FROM students WHERE name LIKE '%ti%';


-- Update and Delete

UPDATE students SET class = 10 WHERE id = 5;
UPDATE students SET name='ronit', age = 19 WHERE id = 10;
UPDATE students SET name = 'ronit';
DELETE FROM students WHERE age < 16;
DELETE FROM students;

-- Aggregate Functions

SELECT COUNT(DISTINCT name) AS 'UNIQ NAMES' FROM students;
SELECT MIN(age) FROM students;
SELECT MAX(age) FROM students;
SELECT AVG(age) FROM students;
SELECT SUM(age) FROM students;

-- GROUPBY

SELECT class FROM students GROUP BY class;
SELECT class, count(name) count_name FROM students GROUP BY class;
SELECT class, count(name) count_name FROM students GROUP BY class HAVING count_name>2;

-- Creating Marks Table

CREATE TABLE marks(
	id int NOT NULL,
	subject varchar(10) NOT NULL,
	marks int NOT NULL,
	PRIMARY KEY (id, subject)
);

INSERT INTO marks
(id, subject, marks)
VALUES
(9, 'maths', 89),
(2, 'english', 75),
(1, 'maths', 91),
(4, 'science', 97),
(10, 'computer', 83),
(1, 'english', 55),
(3, 'maths', 58);


-- JOINS

SELECT students.id,name,class,subject,marks
FROM students, marks
WHERE students.id = marks.id;


SELECT students.id,name,class,subject,marks
FROM students
JOIN marks
ON students.id = marks.id;


SELECT students.id,name,class,subject,marks
FROM students
LEFT JOIN marks
ON students.id = marks.id;


SELECT students.id,name,class,subject,marks
FROM students
RIGHT JOIN marks
ON students.id = marks.id;



SELECT students.id,name,class,subject,marks
FROM students
LEFT JOIN marks
ON students.id = marks.id
UNION
SELECT marks.id,name,class,subject,marks
FROM students
RIGHT JOIN marks
ON students.id = marks.id;


-- GRANT and REVOKE

CREATE USER 'mohit'@'localhost' IDENTIFIED BY 'mohit@123'
GRANT SELECT ON School.* TO 'mohit'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR  'mohit'@'localhost'; 

REVOKE SELECT ON School.* FROM 'mohit'@'localhost';

DROP USER 'mohit'@'localhost';


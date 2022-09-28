-- CREATE DATABASE test_1;

-- USE test_1;

-- CREATE TABLE Departments (id INTEGER, names VARCHAR(50));
-- INSERT INTO Departments(id, names) 
-- VALUES (1, 'Finance'), 
-- (2, 'Operations'), 
-- (3, 'Deployment');

-- CREATE TABLE Employees (id INTEGER, 
-- names VARCHAR(50), Dep_id INT, Manager_id INT, Salary INT);
-- INSERT INTO Employees(id, names, Dep_id, Manager_id, Salary) 
-- VALUES 
-- (1, 'John Smith', 1, NULL, 2000), 
-- (2, 'Jack Smith', NULL, 1, 1500), 
-- (3, 'Becky Smith', 1, 2, 2000),
-- (4, 'Rebecca Smith', 2, 2, 700),
-- (5, 'Sonny Smith', 3, 1, 3000);

SELECT E.names AS Employee, D.names AS Department
FROM Employees AS E
LEFT JOIN Departments AS D
ON E.Dep_id = D.id;

SELECT D.names AS Department, MAX(E.Salary) AS Salary
FROM Employees AS E
RIGHT JOIN Departments AS D
ON E.Dep_id = D.id
GROUP BY D.names
ORDER BY Salary DESC;
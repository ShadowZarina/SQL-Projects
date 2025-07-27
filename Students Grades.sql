-- Create a table listing students' first and last names, IDs, and courses
CREATE TABLE students (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Courses VARCHAR(50) NOT NULL,
);

-- Insert the data of first 10 students
INSERT INTO students (ID, FirstName, LastName, Courses) VALUES 
(11004, 'Mary', 'Dwellings', 'Nursing'),
(11010, 'Johnathan', 'White', 'Computer Science'),
(11008, 'Naomi', 'Richards', 'Nursing'),
(11001, 'Libby', 'Benton', 'Architecture'),
(11006, 'Scott', 'Petersen', 'Advertising Arts'),
(11005, 'Evan', 'Graham', 'Fine Arts'),
(11007, 'Aiden', 'Rasmussen', 'Computer Science'),
(11002, 'Lydia', 'Cooper', 'Advertising Arts'),
(11009, 'Cadence', 'Wells', 'Advertising Arts'),
(11003, 'Scott', 'Dean', 'Computer Science');

-- Create a table listing students' first and last names, and grades
CREATE TABLE students_grades (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Grades DECIMAL(4,1) 
);

-- Input data of first 10 students
INSERT INTO students_grades (ID, FirstName, LastName, Grades) VALUES 
(11004, 'Mary','Dwellings', 94.5),
(11010, 'Johnathan','White', 90.1),
(11008, 'Naomi','Richards', 72.9),
(11001, 'Libby','Benton', 98.7),
(11006, 'Scott','Petersen', 81.6),
(11005, 'Evan','Graham', 89.0),
(11007, 'Aiden','Rasmussen', 93.9),
(11002, 'Lydia','Cooper', 78.1),
(11009, 'Cadence','Wells', 88.5),
(11003, 'Scott','Dean', 73.7);

-- Select everything from the students table
SELECT * 
FROM students;

-- Arrange all students by ID number
SELECT *
FROM students
ORDER BY ID ASC;

-- Select everything from the students_grades table
SELECT * 
FROM students_grades;

-- Rename table to "Students" 
EXEC sp_rename 'students', 'Students';

-- Rename table to "Students_Grades" 
EXEC sp_rename 'students_grades', 'Students_Grades';

-- List all students and their IDs, courses and average grades together
SELECT s.ID, s.FirstName, s.LastName, s.Courses, g.Grades
FROM Students s
JOIN Students_Grades g
    ON s.ID = g.ID 
    AND s.FirstName = g.FirstName 
    AND s.LastName = g.LastName;

-- Update the grades of the student named Scott Dean
UPDATE Students_Grades
SET Grades = 79.9
WHERE FirstName = 'Scott'
AND LastName = 'Dean';

-- Order the students by their grades in descending order
SELECT s.ID, s.FirstName, s.LastName, s.Courses, g.Grades
FROM Students s
JOIN Students_Grades g
    ON s.ID = g.ID 
    AND s.FirstName = g.FirstName 
    AND s.LastName = g.LastName
ORDER BY Grades DESC;

-- List all the students who failed a course
SELECT s.ID, s.FirstName, s.LastName, s.Courses, g.Grades
FROM Students s
JOIN Students_Grades g
    ON s.ID = g.ID 
    AND s.FirstName = g.FirstName 
    AND s.LastName = g.LastName
WHERE g.Grades > 80
ORDER BY Grades DESC;

-- Create view of all students with their average grades in descending order
CREATE VIEW Students_Avg_Grades AS
SELECT 
    s.ID,
    CONCAT(s.FirstName,' ', s.LastName) AS FullName,
    g.Grades AS AverageGrade
FROM Students s
JOIN Students_Grades g ON s.ID = g.ID;

SELECT * FROM Students_Avg_Grades
ORDER BY AverageGrade DESC

-- Show all students who are only in the Advertising Arts course
SELECT *
FROM Students
WHERE Courses = 'Advertising Arts';

-- Retrieve the top 3 performing students
SELECT TOP 3 s.ID, s.FirstName, s.LastName, s.Courses, g.Grades
FROM Students s
JOIN Students_Grades g
    ON s.ID = g.ID 
    AND s.FirstName = g.FirstName 
    AND s.LastName = g.LastName
WHERE g.Grades > 80
ORDER BY Grades DESC;

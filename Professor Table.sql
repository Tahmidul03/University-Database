CREATE TABLE PROFESSOR_INFO1 (
    Professor_Name CHAR (30) NOT NULL,
    Instructor_ID VARCHAR(9) NOT NULL PRIMARY KEY,
    Department_Teach CHAR (30) NOT NULL,
    Year_Teaching INT NOT NULL,
    Professor_Email VARCHAR (30) NOT NULL
);

DESCRIBE PROFESSOR_INFO1;

INSERT INTO PROFESSOR_INFO1 (Professor_Name, Instructor_ID, Department_Teach, Year_Teaching, Professor_Email)
VALUES

('Michael Cummins', 'X05948239', 'Computer Science', 4, 'michaelcummins@mystjohns.edu'),
('Fazel Keshy', 'X06667788', 'Computer Science', 5, 'fazelkeshy@mystjohns.edu'),
('Troja Eraldy', 'X03459876', 'Information Technology', 9, 'trojaeraldy@mystjohns.edu'),
('Ghazy Puya', 'X03910847', 'Data Science', 5, 'ghazypuya@mystjohns.edu'),
('Buky Chan', 'X01298472', 'Healthcare Informatics', 6,'bukychan@mystjohns.edu'),
('Sarah Connor', 'X05556677', 'Mathematics', 10, 'sarahconnor@mystjohns.edu'),
('John Doe', 'X05432123', 'Physics', 8, 'johndoe@mystjohns.edu'),
('Jane Smith', 'X07894567', 'Chemistry', 7, 'janesmith@mystjohns.edu'),
('Paul Jackson', 'X08965432', 'History', 6, 'pauljackson@mystjohns.edu'),
('Emily Davis', 'X01234567', 'Biology', 5, 'emilydavis@mystjohns.edu'),
('David Miller', 'X07891234', 'Philosophy', 9, 'davidmiller@mystjohns.edu'),
('Sophia Wilson', 'X09871234', 'English', 4, 'sophiawilson@mystjohns.edu'),
('James Johnson', 'X06654321', 'Art', 11, 'jamesjohnson@mystjohns.edu'),
('Olivia Martinez', 'X05467890', 'Political Science', 12, 'oliviamartinez@mystjohns.edu'),
('Liam Brown', 'X07896543', 'Economics', 7, 'liambrown@mystjohns.edu'),
('Emma Anderson', 'X06543219', 'Sociology', 3, 'emmaanderson@mystjohns.edu'),
('Noah Taylor', 'X07890234', 'Music', 8, 'noahtaylor@mystjohns.edu'),
('Isabella Thomas', 'X09875432', 'Drama', 5, 'isabellathomas@mystjohns.edu'),
('Ava Harris', 'X05678910', 'Psychology', 6, 'avaharris@mystjohns.edu'),
('Mason Clark', 'X07894512', 'Engineering', 4, 'masonclark@mystjohns.edu');

SELECT * FROM sakila.PROFESSOR_INFO1;

#Group entire table by Department teachings ascending alphebetically ANF Years teaching Decending
SELECT * FROM PROFESSOR_INFO1
ORDER BY Department_Teach ASC, Year_Teaching DESC;

#averages years teaching by professors per department 
SELECT Department_Teach, AVG(Year_Teaching) AS Average_Years
FROM PROFESSOR_INFO1
GROUP BY Department_Teach;

#Count number of professors per department
SELECT Department_Teach, COUNT(*) AS Number_of_Professors
FROM PROFESSOR_INFO1
GROUP BY Department_Teach;

#Find what professors taught between 5-10 years
SELECT Professor_Name, Year_Teaching
FROM PROFESSOR_INFO1
WHERE Year_Teaching > 4 AND Year_Teaching < 9;

#Find information of professors teaching Computer Science Department 
SELECT*
FROM PROFESSOR_INFO1
WHERE Department_Teach = 'Computer Science';

#Add another column to randomly rank each professor (To perform procedure, I must disable safe mode on SQL)
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE PROFESSOR_INFO1 ADD COLUMN Professor_Rank VARCHAR(4);
UPDATE PROFESSOR_INFO1
SET Professor_Rank = CASE
    WHEN RAND() < 0.5 THEN 'Good'
    ELSE 'Bad'
END;
SELECT * FROM PROFESSOR_INFO1;

#Enables safe mode on SQL
SET SQL_SAFE_UPDATES = 1;



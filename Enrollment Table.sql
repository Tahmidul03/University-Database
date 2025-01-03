CREATE TABLE ENROLLMENT2 (
    totalstudent_ID INT NOT NULL PRIMARY KEY,
    ID VARCHAR(9) NOT NULL,
    Average_Grade FLOAT NOT NULL,
    Section_ID INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES STUDENT_Table1(ID)
);

DESCRIBE ENROLLMENT2;

INSERT INTO ENROLLMENT2 (totalstudent_ID, ID, Average_Grade, Section_ID)
VALUES
    (1, "XO1234567", 3.9, 1011),
    (2, "XO2345678", 2.7, 2022),
    (3, "XO3456789", 3.2, 3033),
    (4, "XO4567890", 3.5, 4044),
    (5, "XO5678901", 3.1, 5055),
    (6, "XO6789012", 3.4, 6066),
    (7, "XO7890123", 3.0, 7077),
    (8, "XO8901234", 2.9, 8088),
    (9, "XO9012345", 3.3, 9099),
    (10, "XO0123456", 3.8, 1010),
    (11, "XO4284291", 2.5, 9871),
    (12, "XO1123456", 2.6, 1111),
    (13, "XO2123456", 2.8, 1212),
    (14, "XO5823345", 3.1, 2398),
    (15, "XO3123456", 3.7, 1313),
    (16, "XO4123456", 4.0, 1414),
    (17, "XO5123456", 3.6, 1515),
    (18, "XO3486739", 2.8, 4718),
    (19, "XO4751133", 3.3, 5621),
    (20, "XO4862819", 3.0, 1199);


SELECT * FROM sakila.ENROLLMENT2;

#Finding Average Grade and grouped by Section ID
SELECT Section_ID, AVG(Average_Grade) AS Average_Section_Grade
FROM ENROLLMENT2
GROUP BY Section_ID;

#Which Sections have average GPA of 3 and above?
SELECT ID, Average_Grade
FROM ENROLLMENT2
WHERE Average_Grade > 2.9;

#List all information of Enrollment based on Total Student (Desceneding order)
SELECT * FROM ENROLLMENT2
ORDER BY totalstudent_ID DESC;

#Which Sections have average GPA below 3.0?
SELECT ID, Average_Grade
FROM ENROLLMENT2
WHERE Average_Grade < 2.9;

#Display Max, Min, and Average GPA of students enrolled per class
SELECT Section_ID, 
	MAX(Average_Grade) AS Max_Grade,
	MIN(Average_Grade) AS Min_Grade,
	AVG(Average_Grade) AS Avg_Grade
FROM ENROLL
GROUP BY Section_ID;

#See if any student is enrolled in more than 1 class
SELECT ID, COUNT(Section_ID) AS Number_of_Sections
FROM ENROLLMENT2
GROUP BY ID
HAVING COUNT(Section_ID) > 1;

#Add another column to rate whether a class is Good or not based on Average_Grade
# to do so, I must diable safe mode on SQL

SET SQL_SAFE_UPDATES = 0;
UPDATE ENROLLMENT2
SET Class_Status = CASE
    WHEN Average_Grade > 3.1 THEN 'Good Class'
    WHEN Average_Grade > 2.75 THEN 'Ok Class'
    ELSE 'Bad Class'
END;
SELECT * FROM ENROLLMENT2;

#Enables safe mode on SQL
SET SQL_SAFE_UPDATES = 1;
        

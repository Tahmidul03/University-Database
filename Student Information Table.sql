CREATE TABLE STUDENT_Table1 (
		ID VARCHAR(9) NOT NULL PRIMARY KEY,
        Name CHAR (40) NOT NULL,
        major CHAR (7) NOT NULL,
        student_email VARCHAR(50) NOT NULL,
        GPA_ID FLOAT(2)
);

DESCRIBE STUDENT_Table1;

INSERT INTO STUDENT_Table1 (ID, Name, major, student_email, GPA_ID)
VALUES
("XO3486739", "Tommy Haque", "Comp", "tommyhaque20@mystjohns.edu", "3.5"),
("XO5823345", "Colten Benjamin", "IT", "coltenbenjamin19@mystjohns.edu", "2.9"),
("XO4751133", "Jennifer Alam", "HCI", "jenniferalam21@mystjohns.edu", "3.5"),
("XO4284291", "Justin Kyan", "CCS", "justinkyan20@mystjohns.edu", "3.3"),
("XO4862819", "Chris Caliendo", "DS", "chriscaliendo19@mystjohns.edu","2.9"),
("XO1234567", "Amelia Bennett", "Bio", "ameliabennett20@mystjohns.edu", 3.8),
("XO2345678", "John Smith", "Chem", "johnsmith21@mystjohns.edu", 3.1),
("XO3456789", "Sophia Johnson", "Phys", "sophiajohnson22@mystjohns.edu", 3.4),
("XO4567890", "Liam Brown", "Math", "liambrown19@mystjohns.edu", 3.6),
("XO5678901", "Emma Davis", "Hist", "emmadavis20@mystjohns.edu", 3.2),
("XO6789012", "Noah Wilson", "Eng", "noahwilson21@mystjohns.edu", 3.7),
("XO7890123", "Olivia Martinez", "Phil", "oliviamartinez22@mystjohns.edu", 3.3),
("XO8901234", "Mason Taylor", "Bio", "masontaylor20@mystjohns.edu", 3.1),
("XO9012345", "Ava Anderson", "Art", "avaanderson21@mystjohns.edu", 3.5),
("XO0123456", "Ethan Thomas", "Comp", "ethanthomas22@mystjohns.edu", 3.6),
("XO1123456", "Isabella Harris", "IT", "isabellaharris19@mystjohns.edu", 3.0),
("XO2123456", "James Martin", "HCI", "jamesmartin20@mystjohns.edu", 2.8),
("XO3123456", "Mia Thompson", "CCS", "miathompson21@mystjohns.edu", 3.4),
("XO4123456", "Alexander Garcia", "DS", "alexandergarcia22@mystjohns.edu", 3.9),
("XO5123456", "Charlotte Martinez", "Eng", "charlottemartinez19@mystjohns.edu", 3.7);

SELECT * FROM sakila.STUDENT_Table1;

SELECT major, COUNT(*) AS Number_of_Students
FROM STUDENT_Table1
GROUP BY major;

#Calculate how many students have Same GPA
SELECT GPA_ID, COUNT(*) AS Number_of_Students
FROM STUDENT_Table1
GROUP BY GPA_ID
HAVING COUNT(*) > 1;

#List Rows where students GPA is above 3
SELECT * FROM STUDENT_Table1
WHERE GPA_ID > 3.0;

#List Rows where Students GPA is below 3
SELECT * FROM STUDENT_Table1
WHERE GPA_ID < 3.0;

#Order the table based on GPA (Ascending Order) and Name (Descending Order)
SELECT * FROM STUDENT_Table1
ORDER BY GPA_ID ASC, Name DESC;

#Calculate highest and lowest GPA for each Major
SELECT major, 
	MAX(GPA_ID) AS Highest_GPA, 
    MIN(GPA_ID) AS Lowest_GPA
FROM STUDENT_Table1
GROUP BY major;

#Add another column to rate whether a class is Good or not based on Average_Grade. To do so, I must diable safe mode on SQL
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE STUDENT_Table1 ADD COLUMN Student_Rank VARCHAR(4);
UPDATE STUDENT_Table1
SET Student_Rank = CASE
    WHEN GPA_ID > 3.1 THEN 'Good'
    WHEN GPA_ID > 2.75 THEN 'Ok'
    ELSE 'Bad'
END;
SELECT * FROM sakila.STUDENT_Table1;

#Enables safe mode on SQL
SET SQL_SAFE_UPDATES = 1;


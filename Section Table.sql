CREATE TABLE SECTION2 (
	Section_ID VARCHAR (7) NOT NULL PRIMARY KEY,
	Cource_ID VARCHAR (10) NOT NULL,
	Instructor_ID VARCHAR(9) NOT NULL, 
	Semester_ID CHAR (6) NOT NULL,
	Building_ID CHAR (20) NOT NULL,
	Year_ID INT (4) NOT NULL,
	FOREIGN KEY (Cource_ID) REFERENCES COURSE_INFO1(Cource_ID),
	FOREIGN KEY (Instructor_ID) REFERENCES PROFESSOR_INFO1(Instructor_ID)
);

DESCRIBE SECTION2;

INSERT INTO SECTION2 (Section_ID, Cource_ID, Instructor_ID, Semester_ID, Building_ID, Year_ID)
VALUES
	('Sul202', 'CUS101', 'X05948239', 'Fall', 'Sullivan Hall', '2023'),
    ('Sul303', "IT202", 'X06667788', 'Fall', 'Sullivan Hall', '2023'),
    ('Mar209', "HCI303", 'X03459876', 'Spring', 'Marilac Hall', '2024'),
    ('SJH411', "DS101", 'X03910847', 'Spring', 'St Johns Hall', '2024'),
    ('Mar315', "CS5050", 'X01298472', 'Fall', 'Marillac Hall', '2025'),
    ('Bio101', 'BIO101', 'X01234567', 'Fall', 'Science Hall', '2023'),
    ('Chem202', 'CHEM202', 'X07894567', 'Spring', 'Albert Hall', '2024'),
    ('Phys303', 'PHYS303', 'X05432123', 'Fall', 'Albert Hall', '2023'),
    ('Math404', 'MATH404', 'X05556677', 'Spring', 'Marillac Hall', '2024'),
    ('Hist505', 'HIST505', 'X08965432', 'Fall', 'Marillac Hall', '2023'),
    ('Eng606', 'ENG606', 'X09871234', 'Spring', 'Dangelo Center', '2024'),
    ('Phil707', 'PHIL707', 'X07891234', 'Fall', 'Marillac Hall', '2023'),
    ('Art808', 'ART808', 'X06654321', 'Spring', 'Marillac Hall', '2024'),
    ('CSS909', 'CSS909', 'X07894512', 'Fall', 'Sullivan Hall', '2025'),
    ('HCI111', 'HCI111', 'X03459876', 'Spring', 'Sullivan Hall', '2024'),
    ('Data222', 'DATA222', 'X03910847', 'Fall', 'Sullivan Hall', '2025'),
    ('IT333', 'IT333', 'X06667788', 'Spring', 'Marillac Hall', '2024'),
    ('DS444', 'DS444', 'X01298472', 'Fall', 'Sullivan Hall', '2025'),
    ('COMP555', 'COMP555', 'X05948239', 'Spring', 'Dangelo Center', '2024'),
    ('CCS666', 'CCS666', 'X06654321', 'Fall', 'St Johns Hall', '2025');
    
SELECT * FROM sakila.SECTION2;

#Complex way to rearrange table by semesters
SELECT * FROM SECTION2
ORDER BY CASE Semester_ID
		WHEN 'Fall' THEN 1
		WHEN 'Spring' THEN 2
	END;
 
#Order table by years and semesters if possible
SELECT * FROM SECTION2
ORDER BY Year_ID ASC, Semester_ID ASC;

#Counts number of sections taught per year, however ordered by years (Decend order)
SELECT Year_ID, COUNT(*) AS Number_of_Sections
FROM SECTION2
GROUP BY Year_ID
ORDER BY Year_ID DESC;

#Finds information about sections teaching Spring 2023
SELECT * FROM SECTION2
WHERE Year_ID = 2023 AND Semester_ID = 'Spring'
ORDER BY Section_ID ASC;

#Counts how many sections held per building and list in Section Decending order
SELECT Building_ID, COUNT(*) AS Sections_Held
FROM SECTION2
GROUP BY Building_ID
ORDER BY Sections_Held DESC;

#Computes average number of semesters taught for each building
SELECT Semester_ID, AVG(Building_ID) AS Average_Semester
FROM SECTION2
GROUP BY Semester_ID;
    



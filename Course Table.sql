CREATE TABLE COURSE_INFO1 (
		Cource_ID VARCHAR (10) NOT NULL PRIMARY KEY,
        Name_ID VARCHAR (50) NOT NULL,
        Department_ID CHAR (10) NOT NULL,
        Major_ID CHAR (10) NOT NULL,
        Credits_ID INT(1) NOT NULL
);

DESCRIBE COURSE_INFO1;

INSERT INTO COURSE_INFO1 (Cource_ID, Name_ID, Department_ID, Major_ID, Credits_ID)
VALUES
    ("CUS101", "Program1", "CS", "COMP", "3"),
    ("IT202", "Network2", "IT", "IT", "3"),
    ("HCI303", "Healthcare Data", "HCI", "COMP", "3"),
    ("DS101", "Data Science Basics", "DS", "DATA", "3"),
    ("CS5050", "Crypto Advance", "CSS", "CSS", "3"),
	("BIO101", "Biology Basics", "BIO", "BIO", 3),
	("CHEM202", "Organic Chemistry", "CHEM", "CHEM", 3),
	("PHYS303", "Quantum Physics", "PHYS", "PHYS", 3),
	("MATH404", "Calculus I", "MATH", "MATH", 3),
	("HIST505", "World History", "HIST", "HIST", 3),
	("ENG606", "English Literature", "ENG", "ENG", 3),
	("PHIL707", "Philosophy of Mind", "PHIL", "PHIL", 3),
	("ART808", "Modern Art", "ART", "ART", 3),
	("CSS909", "Advanced Cybersecurity", "CSS", "CSS", 3),
	("HCI111", "Intro to HCI", "HCI", "HCI", 3),
	("DATA222", "Advanced Data Science", "DS", "DATA", 3),
	("IT333", "IT Project Management", "IT", "IT", 3),
	("DS444", "Machine Learning", "DS", "DATA", 3),
	("COMP555", "Advanced Programming", "CS", "COMP", 3),
	("CCS666", "Cloud Computing", "CSS", "CSS", 3);


SELECT * FROM sakila.COURSE_INFO1;

#Counts number of courses taught per department
SELECT Department_ID, 
COUNT(*) AS Number_of_Courses FROM COURSE_INFO1
GROUP BY Department_ID;

#Counts how many different Majors are involved
SELECT COUNT(DISTINCT Major_ID) AS Number_of_Majors
FROM COURSE_INFO1;

#Displays info of how many courses taught per department and Major (Ascending order list)
SELECT Department_ID, Major_ID, COUNT(*) AS Number_of_Courses
FROM COURSE_INFO1
GROUP BY Department_ID, Major_ID
ORDER BY Department_ID DESC, Major_ID DESC;

#Complete information about courses taught by Comp Major
SELECT Cource_ID, Name_ID, Department_ID, Major_ID, Credits_ID
FROM COURSE_INFO1
WHERE Major_ID = 'COMP';

#Which Major has most courses taught
SELECT Major_ID
FROM COURSE_INFO1
GROUP BY Major_ID
ORDER BY COUNT(*) DESC
LIMIT 1;

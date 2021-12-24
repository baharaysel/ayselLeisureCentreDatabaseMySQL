CREATE SCHEMA `Aysel_Leisure_Centre` ;
--  Database Project
-- Introduction
-- You have been asked to develop a database for a local leisure 
-- centre, as they are in the process of upgrading their existing paper base
--  record keeping system building for their swimming pool. They would
--  like to use the database to help them manage their swimming lessons. 
--  Below are the entities and their attributes which were extracted from 
--  their paper-based system by a database developer who never got to implement 
--  the database for the local leisure centre. Use the entities and their attributes 
--  provided to create the respective tables. In addition, the leisure centre has now 
--  decided that they want two databases. A database implemented using SQL and a second 
--  NoSQL database, preferably using MySQL workbench and MongoDB respectively.   It is 
--  the view that once the databases are successfully implemented, the leisure centre 
--  would then decide which of the databases they would possibly integrate with 
--  a front-end Python application.  


-- Course (courseID, Level, Sessions, Instructor, startDate, LessonTime)
-- Lessons (LessonID, CourseID, MemberID) 
-- Members (MemberID, Firstname, Surname, DOB, Address, City)

-- The above highlighted in green are the primary keys. first 3


USE `Aysel_Leisure_Centre`;

-- Creating table course
CREATE TABLE `Aysel_Leisure_Centre`.`Course` (
  `courseID` INT NOT NULL,
  `Level` INT NOT NULL,
  `Sessions` INT NULL,
  `Instructor` VARCHAR(45) NULL,
  `startDate` DATE NULL,
  `LessonTime` VARCHAR(45) NULL,
  PRIMARY KEY (`courseID`)
  )
  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
  ;
  
  -- Creating table Members

CREATE TABLE `Aysel_Leisure_Centre`.`members` (
  `memberID` VARCHAR(45) NOT NULL,
  `Firstname` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  PRIMARY KEY (`memberID`))
  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
;

-- Creating table Lessons

CREATE TABLE `Aysel_Leisure_Centre`.`Lessons` (
  `LessonID` VARCHAR(45) NOT NULL,
  `courseID` INT NULL,
  `memberID` VARCHAR(45) NULL,
  PRIMARY KEY (`LessonID`),
  FOREIGN KEY (`courseID`) REFERENCES `Aysel_Leisure_Centre`.`course` (`courseID`),
  FOREIGN KEY (`memberID`) REFERENCES `Aysel_Leisure_Centre`.`members` (`memberID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
;

    



--  inserting data to course
INSERT INTO `Aysel_Leisure_Centre`.`course`
(`courseID`,
`Level`,
`Sessions`,
`Instructor`,
`startDate`,
`LessonTime`)
VALUES
(1,1,30,'Gulcan Akbulut','2022-01-01','Morning'),
(2,1,45,'Alice Brown','2022-01-01','Morning'),
(3,2,45,'Davide Male','2022-03-01', 'Morning'),
(4,2,50,'Darwin Mal','2022-05-01', 'Morning'),
(5,2,60,'Andrea Mal', '2022-06-01','Afternoon'),
(6,2,60,'George Iron', '2022-07-01','Afternoon'),
(7,2,45,'Ali Mal', '2022-08-01','Evening')
;

-- Inserting Data to Members
INSERT INTO `Aysel_Leisure_Centre`.`members`
(`memberID`,
`Firstname`,
`Surname`,
`DOB`,
`Address`,
`City`)
VALUES
('0001A','Gulcan','Akbulut','1993-06-01', NULL, NULL),
('0001B','Alice','Brown','1993-06-01', NULL, NULL),
('0001C','Davide','Male','1993-06-01', NULL, NULL),
('0001D','Darwin','Mal','1993-06-01', '34 Church Street', NULL),
('0001E','Andrea','Mabal','1993-06-01', NULL, NULL),
('0001F','George','Iron','1993-06-01', NULL, NULL),
('0001G','Ali','Khan','1993-06-01', '23 Fulham Road', NULL),
('0002A','Artur','Pale','1993-06-01', NULL, NULL),
('0002B','Berk','Palab','1973-01-01', NULL, NULL),
('0002C','Fatma','Paleb','1983-01-01','W6 8PB', 'London'),
('0002D','Patrick','Paleb','1963-01-01','199 The Broadway SW19 1NL', 'London'),
('0002E','Anna','Pala','1993-01-01', NULL, 'London'),
('0002F','Abbie','Pale','1983-01-01', NULL, 'London'),
('0002G','Sophie','Pale','2000-01-01', '2 Spencer', 'London')
;

--  Inserting Data to Lessons
INSERT INTO `Aysel_Leisure_Centre`.`Lessons`
(`LessonID`,
`courseID`,
`memberID`)
VALUES
(1,1,'0001A'),
(2,2,'0001B'),
(3,3,'0001C'),
(4,4,'0001D'),
(5,5,'0001E'),
(6,6,'0001F'),
(7,7,'0001G')
;


--               Querries

-- A1   Where courseID is equals to a number below 5 and the first name of any of the instructors 
SELECT Instructor FROM Course WHERE courseID < 5;

-- A2  Where courseID is equals to a number above 5 and the lesson time is in the morning or afternoon. 
SELECT Instructor FROM Course WHERE courseID > 5 AND (LessonTime='morning' or LessonTime='afternoon');

-- B1  ORDER BY startDate in “course” table
SELECT Instructor, startDate FROM Course WHERE courseID < 5 ORDER BY startDate; 
SELECT Instructor, startDate FROM Course WHERE courseID >5 AND (LessonTime='morning' or LessonTime='afternoon') ORDER BY startDate;

-- B2  ORDER BY MemberID in “members” table
SELECT c.Instructor, m.memberID FROM course c
JOIN members m
ON c.Instructor=CONCAT(m.firstname,' ',m.surname)
WHERE courseID < 5 ORDER BY  memberID ASC;

-- C1  UPDATE Members table, change the addresses of any three members.
UPDATE `Aysel_Leisure_Centre`.`members`
SET
`Address` = 'London'
WHERE memberID='0001A';

UPDATE `Aysel_Leisure_Centre`.`members`
SET
`Address` = 'London'
WHERE memberID='0001B';

UPDATE `Aysel_Leisure_Centre`.`members`
SET
`Address` = 'London'
WHERE memberID='0001C';

-- C2 UPDATE  Course table, change the startDate and lesson time for three of the sessions.
UPDATE `Aysel_Leisure_Centre`.`Course`
SET
`startDate` ='2022-02-03',
`LessonTime` = 'evening'
WHERE `courseID` = 1;

UPDATE `Aysel_Leisure_Centre`.`Course`
SET
`startDate` ='2022-02-05',
`LessonTime` = 'evening'
WHERE `courseID` = 2;

UPDATE `Aysel_Leisure_Centre`.`Course`
SET
`startDate` ='2022-02-06',
`LessonTime` = 'evening'
WHERE `courseID` = 3;

 -- D  Use the SQL MIN () and MAX () Functions to return the smallest and largest value  
 -- D1(Of the LessonID column in the “lesson” table)
 SELECT MIN(LessonID), MAX(LessonID) FROM Lessons;
 -- D2 Of the membersID column in the “members” table 
 SELECT MIN(memberID), MAX(memberID) FROM members;
 
 -- E1 Count the total number of members in the “members” table
 SELECT COUNT(members.memberID) AS 'total Number of members' FROM members;
 -- E2 Count the total number of sessions in the” COURSE” table
 SELECT COUNT(course.sessions) AS 'total number of sessions' FROM course;
 
 -- E3  Find the average session time for all “sessions” in course table 
 SELECT ROUND(AVG(course.sessions)) AS 'Average Session Time in minutes' FROM course;
 
 -- Fa  Find all the people from the “members” table whose last name starts with A.
 SELECT Firstname, Surname FROM members WHERE surname LIKE 'A%';
 -- Fb Find all the people from the “members” table whose last name ends with A.
  SELECT Firstname, Surname FROM members WHERE surname LIKE '%A';
 -- Fc Find all the people from the “members” table that have "ab" in any position in the last name.
  SELECT Firstname, Surname FROM members WHERE surname LIKE '%ab%';
 -- Fd  Find all the people from the “members” table that that have "b" in the second position in their first name
   SELECT Firstname, Surname FROM members WHERE firstname LIKE '_b%';
 -- Fe Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length:
   SELECT Firstname, Surname FROM members WHERE surname LIKE 'a__%';
 -- Ff Find all the people from the “members” table whose last name starts with "a" and ends with "t"
   SELECT Firstname, Surname FROM members WHERE surname LIKE 'a%t';
 -- Fg Find all the people from the “members” table whose last name does not starts with "a" and ends with "y"
   SELECT Firstname, Surname FROM members WHERE surname NOT LIKE 'a%y';
   
   
-- G What do you understand by LEFT and RIGHT join? Explain with an example.
-- on left join left column table isimportant rest of the columns length it need to be same as left one not longer even.
-- right join right second table date length is more important.
select c.instructor, c.courseID,l.memberID, m.address
from course c
left join lessons l
on c.courseID = l.courseID
left join members m
on l.memberID = M.memberID;


select c.instructor, c.courseID,l.memberID, m.address
from course c
left join lessons l
on c.courseID = l.courseID
right join members m
on l.memberID = M.memberID;
 

 
 
 












    
    




--Creating database
CREATE DATABASE SCHOOL_DB;
    DEFAULT CHARACTER SET = 'utf8mb4';
--member 2
CREATE TABLE classroom (
    classroom_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    building VARCHAR(50),
    capacity INT
);
INSERT INTO classroom (classroom_id, room_number, building, capacity) VALUES
(1, 'A101', 'Main Building', 30),
(2, 'B203', 'Science Wing', 25),
(3, 'C110', 'Arts Building', 40),
(4, 'A205', 'Main Building', 20);

INSERT INTO classroom (classroom_id, room_number,building,capacity)VALUES
(5, 'D301', 'Engineering Hall', 35);
UPDATE Classroom
SET capacity = 32
WHERE classroom_id = 1;

DELETE FROM classroom
WHERE classroom_id = 5;

SELECT * FROM classroom
WHERE building="Main Building';
--member 1

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

INSERT INTO Students (student_id, name, email, classroom_id, enrollment_date)
VALUES
(6, 'Gatete Keza', 'gatet@alustudent.com', 1, '2024-09-01'),
(7, 'Aline Uwase', 'alin@alustudent.com', 4, '2024-09-01'),
(9, 'Eric Niyonzima', 'erric@alustudent.com', 5, '2024-09-02'),
(12, 'Diane Mukamana', 'dian@alustudent.com', 6, '2024-09-02'),
(8, 'Jean Baptiste', 'jeann@alustudent.com', 101, '2024-09-03');

UPDATE Students
SET email = 'gatete.new@alustudent.com'
WHERE student_id = 6;

INSERT INTO Students (student_id, name, email, classroom_id, enrollment_date)
VALUES (999, 'Temp Student', 'temp@alustudent.com', 200, '2024-09-04');

DELETE FROM Students
WHERE student_id = 999;



SELECT * FROM Students
WHERE classroom_id = 1;
--member 3
CREATE TABLE Faculty(
    Faculty_id INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Department VARCHAR(50)
);

SELECT * From Faculty;
INSERT INTO Faculty(Faculty_id, Name, Email, Department)
VALUES
(001, 'Health sciences', 'sciencesH@gmail.com', 'Sciences Department'),
(002, ' Engineering & Technology', 'engintech@gmail.com', 'Engineering Department'),
(003, 'Faculty of Science', 'scifa@gmail.com', 'Science Department'),
(004, 'Faculty of Education', 'educulty@gmail.com', 'Education Department'),
(005, 'Faculty of Social Sciences', 'soscienc@gmail.com', 'Social Department');

SELECT * From Faculty WHERE Department = 'Science Department';
UPDATE Faculty SET Email = 'sceinces@gmail.com' WHERE Faculty_id = 3;

DELETE From Faculty
WHERE Faculty_id = 005;

SELECT *
From Faculty
WHERE Faculty_id = 004;
--member 4
CREATE TABLE Courses (
    course_id     INT PRIMARY KEY,
    course_name   VARCHAR(100) NOT NULL,
    credits       INT,
    faculty_id    INT,
    classroom_id  INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);
 
 

INSERT INTO Courses (course_id, course_name, credits, faculty_id, classroom_id) VALUES
(1, 'Introduction to Databases', 3, 1, 1),
(2, 'Data Structures',           4, 2, 4),
(3, 'Web Development',           3, 3, 5),
(4, 'Software Engineering',      4, 4, 6),
(5, 'Computer Networks',         3, 1, 101);
 

UPDATE Courses
SET credits = 4
WHERE course_id = 1;
 

DELETE FROM Courses
WHERE course_id = 5;
 

SELECT *
FROM Courses
WHERE credits >= 4;
 
    
-- member 5/ Extra caricula activities
CREATE TABLE Extra_Curricular_Activities(
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(100),
    category VARCHAR(255),
    faculty_advisor_id INT,
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(Faculty_id)
);
--inserting
INSERT INTO Extra_Curricular_Activities (activity_id, activity_name, category, faculty_advisor_id) VALUES
(1, 'Football Club', 'Sports', 4),
(2, 'Debate Club', 'Academic', 3),
(3, 'Coding Club', 'Technology', 1),
(4, 'Drama Club', 'Arts', 4),
(5, 'Math Society', 'Academic', 2);
Insert INTO `Extra_Curricular_Activities`(activity_id, activity_name, category, faculty_advisor_id) VALUES
(6, 'Basket club', 'Sports', 4);
-- selecting
select * from `Extra_Curricular_Activities`;
--update 
UPDATE `Extra_Curricular_Activities` set activity_name='Hackathon' where activity_id=3;
--delete
DELETE from `Extra_Curricular_Activities` where activity_id=6;
-- join clause
SELECT `Extra_Curricular_Activities`.activity_id,`Extra_Curricular_Activities`.activity_name, `Extra_Curricular_Activities`.category, `Faculty`.`Name` from `Extra_Curricular_Activities` join `Faculty` where `Extra_Curricular_Activities`.faculty_advisor_id=`Faculty`.`Faculty_id`

-- member5 student_Courses
CREATE Table Student_Courses(
    student_course_id INT primary key AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    Foreign Key (student_id) REFERENCES Students(student_id),
    Foreign Key (course_id) REFERENCES Courses(course_id)
);
-- insert
INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(5, 5);
--Select
select * from `Student_Courses`;

-- update
UPDATE `Student_Courses` SET course_id=3 where student_id=5;
--delete everything in Student_course
delete from `Student_Courses`;
--member 5/ student_activities
CREATE Table Student_Activities(
    student_activity_id INT primary key AUTO_INCREMENT,
    student_id INT,
    activity_id INT,
    Foreign Key (student_id) REFERENCES Students(student_id),
    Foreign Key (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

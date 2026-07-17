
CREATE DATABASE SCHOOL_DB;
    DEFAULT CHARACTER SET = 'utf8mb4';

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

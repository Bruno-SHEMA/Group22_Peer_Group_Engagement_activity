CREATE DATABASE SCHOOL_DB;
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE TABLE classroom (
    classroom_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    building VARCHAR(50),
    capacity INT
);

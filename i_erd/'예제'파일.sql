### i_erd >>> '예제' 파일 ###

create database if not exists `school_db`;

-- Students 테이블 생성
USE school_db;
CREATE TABLE Students (
    학생ID INT PRIMARY KEY,
    이름 VARCHAR(100),
    전공 VARCHAR(100),
    입학년도 INT
);

-- Professors 테이블 생성
CREATE TABLE Professors (
    교수ID INT PRIMARY KEY,
    이름 VARCHAR(100),
    학과 VARCHAR(100),
    사무실위치 VARCHAR(100)
);

-- Courses 테이블 생성
CREATE TABLE Courses (
    강의ID INT PRIMARY KEY,
    강의명 VARCHAR(100),
    담당교수ID INT,
    학점수 INT,
    FOREIGN KEY (담당교수ID) REFERENCES Professors(교수ID)
);

-- Enrollments 테이블 생성
CREATE TABLE Enrollments (
    수강ID INT PRIMARY KEY,
    학생ID INT,
    강의ID INT,
    수강년도 INT,
    학기 INT,
    FOREIGN KEY (학생ID) REFERENCES Students(학생ID),
    FOREIGN KEY (강의ID) REFERENCES Courses(강의ID)
);

-- Students
INSERT INTO Students VALUES (1, 'Alice', 'Computer Science', 2020);
INSERT INTO Students VALUES (2, 'Bob', 'Mathematics', 2021);
INSERT INTO Students VALUES (3, 'Charlie', 'Physics', 2022);

-- Professors
INSERT INTO Professors VALUES (1, 'Dr. Smith', 'Computer Science', 'Room 101');
INSERT INTO Professors VALUES (2, 'Dr. Johnson', 'Mathematics', 'Room 102');
INSERT INTO Professors VALUES (3, 'Dr. Williams', 'Physics', 'Room 103');

-- Courses
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses VALUES (2, 'Calculus I', 2, 4);
INSERT INTO Courses VALUES (3, 'Mechanics', 3, 4);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, 2023, 1);
INSERT INTO Enrollments VALUES (2, 2, 2, 2023, 1);
INSERT INTO Enrollments VALUES (3, 3, 3, 2023, 1);

SELECT 이름, 입학년도 
FROM Students
where 전공 = 'Computer Science';

select 강의명, 학점수 
from Courses
where 담당교수ID = 2;

select 
	S.학생ID, S.이름 
from Students S
	join Enrollments E
	on S.학생ID = E.학생ID
where
	E.수강년도 = 2023 and E.학기 = 1;

    
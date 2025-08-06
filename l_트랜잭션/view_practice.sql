### j_뷰 >>> view_practice ###

### 뷰 연습 문제 ###
CREATE DATABASE IF NOT EXISTS `school`;
USE `school`;

create table `students` (
	student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    major varchar(20)
); 

create table `courses` (
	course_id int primary key,
    course_name varchar(100),
    instructor varchar(100),
    credit_hours int
);

create table `student_courses` (
	student_id int,
    course_id int,
	primary key(student_id, course_id),
    foreign key(student_id) references students(student_id),
    foreign key(course_id) references courses(course_id)
    
);

drop view if exists student_course_view;

create view student_course_view
as
	select
		concat(S.first_name, S.last_name) as 'student name'
        , C.course_name
        , C.instructor
	from 	
		student_courses SC
			inner join students S
				on SC.student_id = S.student_id
			inner join courses C
				on SC.course_id = C.course_id;

select * from student_course_view;

    

	
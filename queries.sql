create table course(
courseID int PRIMARY KEY NOT NULL,
name varchar(255) NOT NULL
);
describe course;
insert into course(courseID, name)
values
(112, 'Computer Engineering'),
(113, 'Information Technology'),
(114, 'Mechanical Engineering'),
(115, 'EXTC'),
(116, 'Data Science');
select * from course;

create table students(
roll int NOT NULL,
name varchar(255) NOT NULL,
location varchar(255),
sapID bigint PRIMARY key,
courseID int,
Foreign Key(courseID) references course(courseID)
);

show tables;

describe students;

alter table students
add class varchar(255);
alter table students
drop class;

insert into students(roll, name, location, sapID, courseID)
values
(182, 'Vivan Shah', 'Borivali', 60004230030, 112),
(188, 'Yash Kehalkar', 'Kandivali', 60004230010,113),
(181, 'Vishvesh Shrikant', 'Ghatkopar', 60004230179,112),
(176, 'Vedang Kakade', 'Vashi', 60004230200,113),
(190, 'Aryan Mehta', 'Andheri', 60004230300, 114),
(191, 'Siddhi Patel', 'Malad', 60004230301, 112),
(192, 'Rohan Desai', 'Thane', 60004230302, 116),
(193, 'Aisha Gupta', 'Bandra', 60004230303, 115),
(194, 'Karan Gupta', 'Powai', 60004230304, 113),
(195, 'Meera Joshi', 'Dadar', 60004230305, 114),
(196, 'Niharika Jain', 'Vile Parle', 60004230306, 112),
(197, 'Aman Verma', 'Chembur', 60004230307, 116),
(198, 'Ritika Shah', 'Borivali', 60004230308, 115),
(164, 'Tanish Shah', 'Borivali', 60004230089,115);
select * from students;

create table marks(
srno int NOT NULL AUTO_INCREMENT PRIMARY key,
sapID bigint NOT NULL,
subject varchar(255) NOT NULL,
marks int NOT NULL,
exam_date date,
foreign key(sapID) references students(sapID)
);

describe marks;

INSERT INTO marks (sapID, subject, marks, exam_date) VALUES
(60004230030, 'Maths', 78, '2024-11-24'),
(60004230010, 'Physics', 85, '2024-11-25'),
(60004230089, 'Chemistry', 66, '2024-11-26'),
(60004230179, 'Physics', 72, '2024-11-25'),
(60004230200, 'Maths', 91, '2024-11-24'),
(60004230030, 'Chemistry', 89, '2024-11-26'),
(60004230010, 'Biology', 80, '2024-11-27'),
(60004230200, 'Physics', 88, '2024-11-25'),
(60004230179, 'Biology', 74, '2024-11-27'),
(60004230089, 'Maths', 61, '2024-11-24'),
(60004230010, 'Maths', 77, '2024-11-24'),
(60004230200, 'Chemistry', 83, '2024-11-26'),
(60004230089, 'Physics', 70, '2024-11-25');

select * from marks;

select name, location from students;

-- For truth table like
select location = 'Borivali' from students;

-- For printing rows with cerain constraints
select * from students where location = 'Borivali';
select * from marks  where marks>=80;

select count(*) as total_students from students;
select AVG(marks) as average from marks where subject = 'Maths' OR 'Chemistry';
select min(marks) as min_marks from marks where subject = 'Biology';
select max(marks) as max_marks from marks where subject = 'Biology';

SELECT courseID, COUNT(*) AS num_students FROM students GROUP BY courseID;
select subject, Avg(marks) as avg_marks from marks group by subject having avg(marks) >=77;

select location, count(*) as people_staying from students group by location;

select sapID, max(marks) as marks from marks group by sapID having max(marks)<75;

select * from students order by name ASC;
select *from marks order by marks ASC;

select * from students order by location desc;

update course
set name = 'CS'
where courseID = 112;

select * from marks
order by marks asc
limit 4;

select * from students
where name LIKE '%a';

select * from students
where location like '%ad%';

select * from students where location in ('Borivali', 'Malad', 'Ghatkopar');

select marks.marks,students.roll,marks.subject, students.name from marks
join students on marks.sapID = students.sapID
where marks.subject in ('Chemistry','Maths');

CREATE VIEW student_total_marks AS 
SELECT students.name, SUM(marks.marks) AS total_marks 
FROM students 
JOIN marks ON students.sapID = marks.sapID 
GROUP BY students.name;
SELECT * FROM student_total_marks;

create view total_marks as
select students.name, Avg(marks) as average_marks
from students 
join marks on marks.sapID = students.sapID
group by students.name;

select * from total_marks;
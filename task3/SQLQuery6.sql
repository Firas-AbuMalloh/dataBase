create database School ;

create table Students (  --many to many with courses table 
ID int PRIMARY KEY identity(1,1),     --many to many with Assignments table 
fullName varchar(200),
BirthDate Date,
address varchar(200)
);

INSERT INTO Students (FullName, BirthDate, Address)
VALUES 
('Ahmed Ali', '2000-05-15', '123 Main St, Cairo, Egypt'),
('Mona Mohamed', '2001-08-22', '456 Elm St, Alexandria, Egypt'),
('Omar Khaled', '1999-03-10', '789 Oak St, Giza, Egypt'),
('Lina Samir', '2002-11-30', '321 Pine St, Luxor, Egypt'),
('Youssef Ahmed', '2000-07-25', '654 Maple St, Aswan, Egypt');


select * from Students 
where BirthDate > '2000-08-26';


create table family_info(
ID int PRIMARY KEY identity(1,1),
FullName varchar(50),
PhoneNum Varchar(15) not null unique,
StudentsID int,
foreign KEy (StudentsID) references Students(ID)
);

INSERT INTO family_info (FullName, PhoneNum, StudentsID)
VALUES 
('Ali Ahmed', '01012345678', 1), 
('Mohamed Samir', '01123456789', 2),
('Khaled Omar', '01234567890', 3),
('Samir Hassan', '01567891234', 4), 
('Ahmed Youssef', '01098765432', 5); 

create table Courses (       --many to many with students table 
ID INT PRIMARy KEY identity(1,1),
name varchar(50),
description varchar(255),
Resource varchar(250)
);

insert into Courses (Name, Description, Resource)
VALUES 
('Mathematics', 'Basic Algebra and Geometry', 'example'),
('Physics', 'Introduction to Mechanics and Thermodynamics', 'example'),
('Chemistry', 'Fundamentals of Organic and Inorganic Chemistry', 'example'),
('Biology', 'Study of Living Organisms and Ecosystems', 'example'),
('History', 'World History from Ancient to Modern Times', 'example');


create table Students_Courses(

std_ID INT,
course_ID INT,
foreign key (std_ID) references Students(ID),
foreign key (course_ID) references Courses(ID)
);
insert into Students_Courses 
values (1,2),
(2,1),
(3,2),
(4,1);

create table Classes (    
ID INT PRIMARY KEY identity(1,1),
RoomNumber int,
schedule date,
 classCode varchar(50),
 CourseID int,
 foreign key (CourseID) references Courses(ID)

 );

 create table Assignments(     --many to many with students table 
 ID int PRIMARY KEY identity(1,1),
 Name varchar(50),
 description varchar(255),
 duedate date ,
 States varchar(10),
  CourseID int,
 foreign key (CourseID) references Courses(ID)
 );


 
create table Students_assignments(
Students_ID int  ,
assignments_ID int ,
foreign key (Students_ID) references Students(ID),
foreign key (assignments_ID) references Assignments(ID)
);

INSERT INTO Students_assignments (Students_ID, assignments_ID)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);

 create table attendance(
 ID int PRIMARY KEY identity(1,1),
 attendancedate date,
 absence varchar(50) ,
 reason varchar(50),
 StudentsID int,
foreign key (StudentsID) references Students(ID)

 );

INSERT INTO attendance (attendancedate, absence, reason, StudentsID)
VALUES
  ('2024-01-01', 'Present', 'On time', 1),
  ('2024-01-03', 'Absent', 'Medical reason', 1),
  ('2024-01-05', 'Present', 'On time', 3);




 --1- Select students in a specific birth date ?

 
select * from Students 
where BirthDate > '2000-08-26';

--2- Select details of a course by its name ? 

select * from Courses where name = 'Mathematics';


--3-Add a new column 'Email' to the Students table ?

alter table Students
add Email varchar(50);

--4- Insert a new student record ?


INSERT INTO Students (FullName, BirthDate, Address)
VALUES ('mohammad Tobasi','1995/11/07','alhusn');


--5- Select students who have relatives listed in the system ? 

select * from Students std
inner join family_info f on std.ID = f.StudentsID;

--6- Select students who are enrolled in a specific course (e.g : Math) ? 


select * from Students

inner join Students_Courses on std_ID = Students.ID
inner join Courses on Students_Courses.course_ID = Courses.ID
where Courses.name ='Mathematics';

--7- Select students who have submitted and passed a specific assignment (e.g : sql  Assignment ) ? 


select * from Students
inner join Students_assignments on Students_assignments.Students_ID = Students.ID
inner join assignments on Students_assignments.assignments_ID = assignments.ID
where assignments.status = 0 and assignments.name = 'Math Assignment 1' ;

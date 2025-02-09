
create database Library1;


CREATE TABLE Books (
    BookID  INT PRIMARY KEY,
	AuthorID INT ,
    Title  VARCHAR(50),
    PublishedYear  date,
	CopiesAvailable  INT,
    BookCategory varchar(50),
	FOREIgn KEY(AuthorID) REFERENCES Authors (AuthorID)
	);

	
CREATE TABLE NullBooks (
    BookID  INT ,
	AuthorID INT ,
    Title  VARCHAR(50),
    PublishedYear  date,
	CopiesAvailable  INT,
    BookCategory varchar(50),
	);

create table Authors (
AuthorID INT PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
BirthYear DATE
);


insert into Authors (AuthorID,FirstName,LastName, BirthYear)
values
(6,'Firas','Abumalloh','1995-07-26'),
(2,'Firas','Abumalloh','1995-07-26'),
(3,'Firas','Abumalloh','1995-07-26'),
(4,'Firas','Abumalloh','1995-07-26'),
(5,'Firas','Abumalloh','1995-07-26')
;

insert into Books (BooKID,TItle,PublishedYear,CopiesAvailable, BookCategory)
values
(1,'Book1',1995,50,'Herror'),
(2,'Book2',2002,50,'Herror'),
(3,'Book3',2009,50,'Herror'),
(4,'Book4',1885,50,'Herror'),
(5,'Book5',2013,50,'Herror');


select * from Books

select * from Authors

select * from NullBooks

select min(CopiesAvailable) from Books

select BooKID,TItle,CopiesAvailable from Books where CopiesAvailable=(select max(CopiesAvailable)from Books);


select avg(PublishedYear)from Books

select count(BookID)from Books

ALTER TABLE Authors 
ADD Email VARCHAR(50);

ALTER TABLE Authors 
ADD  Phone_Number VARCHAR(50);

drop table Authors;



UPDATE Students
SET Grade = 'x'
WHERE StudentID = 1;




DELETE FROM Students
WHERE StudentID = 3;




TRUNCATE TABLE Students;




DROP TABLE Students;





DROP DATABASE SchoolDB;
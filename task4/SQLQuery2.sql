
create table Books(
	ID INT PRIMARY KEY,
	Title varchar(50) not null,
	Author varchar(50) not null,
	Genre varchar(50),
	PublicationYear DATE,
	AvailabilityStatus varchar(15)
);


create table Members(
	ID INT PRIMARY KEY,
	Name varchar(50) not null,
	ContactInformation varchar(50) not null,
	MembershipType  varchar(50),
	RegistrationDate Date
);

create table borrowing(           --Many-to-Many Relationship
	ID INT PRIMARY KEY,
	MemberID_FK INT,
	BookID_FK INT,
	BorrowingDate date,
	dueDate date,
	returnDate date,

	foreign KEY (MemberID_FK) references Books(ID),
	foreign Key (BookID_FK) references Members(ID)
);


create table staff(
	ID INT PRIMARY KEY,
	Name varchar(50) Not Null,
	ContactInfo varchar(100),
	AssignedSection varchar(50),
	EmploymentDate Date

);


create table Categories (
	ID INT PRIMARY KEY,
	Name varchar(50),
	Description varchar(200),
	BooksID_FK INt,

	foreign KEY (BooksID_FK) references  Books(ID)

);


create table Reservations (      --Many-to-Many Relationship)
	ID INT PRIMARY KEY,
	MemberID_FK INt,
	BookID_FK INT,
	ReservationDate date,
	Status varchar(15),              --(Pending, Cancelled, Completed).

	foreign key (MemberID_FK) references Members(ID),
	foreign key (BookID_FK) references Books(ID)

);

create table Financial_fines (
	ID INT PRIMARY KEY,
	MemberID_FK INT,
	Amount INT,
	PaymentStatus varchar(10)                    --(Paid, Unpaid).

	foreign key (MemberID_FK) references Members(ID) 
); 


--------------------------------------------------------------------------------------------
							--INSERT
--------------------------------------------------------------------------------------------
-- 10 records for books table 

INSERT INTO Books (ID, Title, Author, Genre, PublicationYear, AvailabilityStatus)
VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11', 'Available'),
(2, '1984', 'George Orwell', 'Dystopian', '1949-06-08', 'Borrowed'),
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 'Available'),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10', 'Available'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '1951-07-16', 'Borrowed'),
(6, 'Moby Dick', 'Herman Melville', 'Adventure', '1851-10-18', 'Available'),
(7, 'War and Peace', 'Leo Tolstoy', 'Historical', '1869-01-01', 'Available'),
(8, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '1937-09-21', 'Borrowed'),
(9, 'The Alchemist', 'Paulo Coelho', 'Philosophical', '1988-01-01', 'Available'),
(10, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', '1954-07-29', 'Available');

-- 10 records for members table 

INSERT INTO Members (ID, Name, ContactInformation, MembershipType,  RegistrationDate)
VALUES 
(1, 'John Doe', 'john.doe@example.com', 'Premium',  '2023-01-10'),
(2, 'Jane Smith', 'jane.smith@example.com', 'Basic', '2023-02-15'),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'Gold' ,'2023-03-05'),
(4, 'Michael Brown', 'michael.brown@example.com', 'Premium', '2023-04-20'),
(5, 'Emily Davis', 'emily.davis@example.com', 'Basic',  '2023-05-01'),
(6, 'David Wilson', 'david.wilson@example.com', 'Silver',  '2023-06-10'),
(7, 'Sarah Miller', 'sarah.miller@example.com', 'Gold', '2023-07-15'),
(8, 'James Taylor', 'james.taylor@example.com', 'Basic',  '2023-08-22'),
(9, 'Laura Anderson', 'laura.anderson@example.com', 'Premium', '2023-09-30'),
(10, 'Robert Clark', 'robert.clark@example.com', 'Silver', '2023-10-05');
UPDATE Members 
SET MembershipType = 
    CASE 
        WHEN MembershipType = 'Premium' THEN 'Teacher'
        WHEN MembershipType = 'Gold' THEN 'Teacher'
        WHEN MembershipType = 'Silver' THEN 'Visitor'
        WHEN MembershipType = 'Basic' THEN 'Student'
        ELSE 'Visitor' -- Default case if any other values exist
    END;




-- 10 record for borrowing table 

INSERT INTO borrowing (ID, MemberID_FK, BookID_FK, BorrowingDate, dueDate, returnDate) VALUES
(1, 1, 1, '2024-02-01', '2024-02-15', '2024-02-10'),
(2, 2, 2, '2024-02-03', '2024-02-17', NULL),
(3, 3, 3, '2024-02-05', '2024-02-19', '2024-02-18'),
(4, 4, 4, '2024-02-07', '2024-02-21', NULL),
(5, 5, 5, '2024-02-09', '2024-02-23', '2024-02-22'),
(6, 6, 6, '2024-02-11', '2024-02-25', NULL),
(7, 7, 7, '2024-02-13', '2024-02-27', '2024-02-26'),
(8, 8, 8, '2024-02-15', '2024-02-29', NULL),
(9, 9, 9, '2024-02-17', '2024-03-02', '2024-03-01'),
(10,10,10, '2024-02-19', '2024-03-04', NULL);

-- 10 records for staff table 

INSERT INTO staff (ID, Name, ContactInfo, AssignedSection, EmploymentDate) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'Circulation', '2018-05-12'),
(2, 'Bob Smith', 'bob.smith@example.com', 'Reference', '2019-07-23'),
(3, 'Charlie Davis', 'charlie.davis@example.com', 'Children’s Section', '2020-09-15'),
(4, 'Diana Roberts', 'diana.roberts@example.com', 'Acquisitions', '2017-03-30'),
(5, 'Edward Miller', 'edward.miller@example.com', 'Periodicals', '2021-01-10'),
(6, 'Fiona White', 'fiona.white@example.com', 'Technical Services', '2016-11-05'),
(7, 'George Brown', 'george.brown@example.com', 'Archives', '2015-06-18'),
(8, 'Hannah Wilson', 'hannah.wilson@example.com', 'Special Collections', '2022-04-20'),
(9, 'Ian Taylor', 'ian.taylor@example.com', 'Administration', '2019-08-14'),
(10, 'Jessica Martin', 'jessica.martin@example.com', 'Customer Service', '2023-02-07');


INSERT INTO Categories (ID, Name, Description, BooksID_FK) VALUES
(1, 'Fiction', 'Fictional books with imaginative storytelling', 1),
(2, 'Dystopian', 'Books set in a dystopian future', 2),
(3, 'Romance', 'Love stories and romantic fiction', 3),
(4, 'Classic', 'Timeless literary masterpieces', 4),
(5, 'Adventure', 'Exciting and action-packed narratives', 6),
(6, 'Historical', 'Books based on historical events', 7),
(7, 'Fantasy', 'Magical and mythical stories', 8),
(8, 'Philosophical', 'Books exploring deep philosophical themes', 9),
(9, 'Fantasy', 'Epic fantasy sagas and world-building', 10),
(10, 'Literary Fiction', 'Books focused on character-driven stories', 5);


INSERT INTO Reservations (ID, MemberID_FK, BookID_FK, ReservationDate, Status) VALUES
(1, 1, 1, '2024-02-01', 'Pending'),
(2, 2, 2, '2024-02-02', 'Completed'),
(3, 3, 3, '2024-02-03', 'Cancelled'),
(4, 4, 4, '2024-02-04', 'Pending'),
(5, 5, 5, '2024-02-05', 'Completed'),
(6, 6, 6, '2024-02-06', 'Pending'),
(7, 7, 7, '2024-02-07', 'Cancelled'),
(8, 8, 8, '2024-02-08', 'Completed'),
(9, 9, 9, '2024-02-09', 'Pending'),
(10, 10, 10, '2024-02-10', 'Cancelled');


INSERT INTO Financial_fines (ID, MemberID_FK, Amount, PaymentStatus) VALUES
(1, 1, 10, 'Paid'),
(2, 2, 15, 'Unpaid'),
(3, 3, 5, 'Paid'),
(4, 4, 20, 'Unpaid'),
(5, 5, 10, 'Paid'),
(6, 6, 25, 'Unpaid'),
(7, 7, 30, 'Paid'),
(8, 8, 15, 'Unpaid'),
(9, 9, 10, 'Paid'),
(10, 10, 20, 'Unpaid');



--------------------------------------------------------------------------------------------
--1. Select members who registered on a specific date
--------------------------------------------------------------------------------------------

select * from Members where RegistrationDate = '2023-09-30';

--------------------------------------------------------------------------------------------
--2. Select details of a book by its title
--------------------------------------------------------------------------------------------

select * from Books where Title = 'To Kill a Mockingbird';

--------------------------------------------------------------------------------------------
--3. Add a new column ‘Email’ to the Members table
--------------------------------------------------------------------------------------------

alter table Members
add Email varchar(50) ;

--------------------------------------------------------------------------------------------
--4. Insert a new member record
--------------------------------------------------------------------------------------------

insert into Members (ID, Name, ContactInformation, MembershipType ,RegistrationDate, Email )
Values(11, 'Omar', '9876543210', 'Student', '2024-06-05',' Omar@gmail.com');

--------------------------------------------------------------------------------------------
--5. Select members who have reservations in the system
--------------------------------------------------------------------------------------------

select *
from Members
inner join Reservations on Reservations.MemberID_FK =Members.ID
inner join Books on  Reservations.BookID_FK = Books.ID;

--------------------------------------------------------------------------------------------
--6. Select members who have borrowed a specific book
--------------------------------------------------------------------------------------------

select * 
from Members
inner join borrowing on borrowing.MemberID_FK = Members.ID
inner join Books on  borrowing.BookID_FK = Books.ID;

--------------------------------------------------------------------------------------------
--7. Select members who have borrowed and returned a specific book
--------------------------------------------------------------------------------------------

insert into Books (ID, Title,Author, Genre, PublicationYear, AvailabilityStatus)
Values (11,'C# Programming', 'Firas Abumalloh','Programming' ,'2024-04-06','Borrowed')

insert into borrowing(ID,MemberID_FK,BookID_FK,BorrowingDate,dueDate,returnDate)
Values(11,11,11,'2023-02-04','2023-02-15','2023-02-11')
		
		select * 
		from Members
		inner join borrowing on Members.ID = borrowing.MemberID_FK 
		inner join Books on Books.ID = borrowing.BookID_FK
		where Books.Title = 'C# Programming';

--------------------------------------------------------------------------------------------
--8. Find members who made a late return
-------------------------------------------------------------------------------------------


insert into Books (ID, Title,Author, Genre, PublicationYear, AvailabilityStatus)
Values (12,'Java Programming', 'Ammar Abumalloh','Programming' ,'2024-04-06','Borrowed')


insert into Members (ID, Name, ContactInformation, MembershipType ,RegistrationDate, Email )
Values(12, 'Ammar', '98765432123', 'Student', '2024-06-05',' Ammar@gmail.com');

insert into borrowing(ID,MemberID_FK,BookID_FK,BorrowingDate,dueDate,returnDate)
Values(12,12,12,'2023-02-04','2023-02-15','2023-02-16')

select * 
from Members
inner join borrowing on Members.ID = borrowing.MemberID_FK
inner join Books on Books.ID = borrowing.BookID_FK
where borrowing.dueDate < borrowing.returnDate

-------------------------------------------------------------------------------------------
--9. Select books borrowed more than 3 times
------------------------------------------------------------------------------------------

insert into borrowing(ID,MemberID_FK,BookID_FK,BorrowingDate,dueDate,returnDate)
Values(13,11,12,'2023-02-04','2023-02-15','2023-02-16'),
(14,11,12,'2023-02-04','2023-02-15','2023-02-16'),
(15,11,12,'2023-02-04','2023-02-15','2023-02-16')

select Books.ID,Books.Title, count(borrowing.BookID_FK)
from borrowing 
inner join Books on Books.ID = borrowing.BookID_FK
group by Books.Title ,Books.ID
Having count(borrowing.BookID_FK) > 3

-------------------------------------------------------------------------------------------
--10. Find members who have borrowed books between two dates
------------------------------------------------------------------------------------------

select * from Members
inner join borrowing on borrowing.MemberID_FK = Members.ID
where borrowing.BorrowingDate between('2024-01-01')and ('10-01-2024')


-------------------------------------------------------------------------------------------
--11. Count the total number of books in the library
------------------------------------------------------------------------------------------

select Count(Books.ID) as 'Books We Have'
from Books 
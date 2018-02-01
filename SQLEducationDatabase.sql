use master
go
drop database if exists Education
go
create database Education
go
use Education
go
create table Major (
	Id int primary key identity(1,1),
	Description varchar(50),
	MinSat int default 1000
);
go
insert into Major (Description, MinSat) values ('Business', 1200)
insert into Major (Description, MinSat) values ('Communications', 900)
insert into Major (Description, MinSat) values ('Math', 1450)
insert into Major (Description, MinSat) values ('Engineering', 1450)
insert into Major (Description, MinSat) values ('Management', 1300)
go
create table Student (
	Id int primary key identity(1,1),
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	GPA decimal(3,1),
	SAT int,
	MajorId int foreign key references Major(Id)
)
go
insert into student (FirstName, LastName, GPA, SAT, MajorId) values ('Aaron', 'Zell', 3.2, 1250, 3)
insert into student (FirstName, LastName, GPA, SAT, MajorId) values ('Bill', 'Yatil', 3.7, 1420, 5)
insert into student (FirstName, LastName, GPA, SAT, MajorId) values ('Cory', 'Xe', 3.1, 1120, 1)
insert into student (FirstName, LastName, GPA, SAT, MajorId) values ('Devin', 'Waite', 2.9, 1030, 2)
go
create table Class (
	Id int primary key identity(1,1),
	Description varchar(50)
)
go
insert into Class (Description) values ('English 101') -- 1
insert into Class (Description) values ('English 102') -- 2
insert into Class (Description) values ('English 103') -- 3
insert into Class (Description) values ('Math 101') -- 4
insert into Class (Description) values ('Math 102') -- 5
insert into Class (Description) values ('Math 103') -- 6
insert into Class (Description) values ('Micro Economics') -- 7
insert into Class (Description) values ('Macro Economics') -- 8
insert into Class (Description) values ('American History') -- 9
insert into Class (Description) values ('World History') -- 10
insert into Class (Description) values ('European History') -- 11
insert into Class (Description) values ('Information Systems 101') -- 12
insert into Class (Description) values ('Information Systems 102') -- 13
insert into Class (Description) values ('Information Systems 103') -- 14
go
create table Schedule (
	Id int primary key identity(1,1),
	StudentId int foreign key references Student(Id),
	ClassId int foreign key references Class(Id),
	Grade varchar(2)
)
go
insert into Schedule (StudentId, ClassId) values (1,3) 
insert into Schedule (StudentId, ClassId) values (1,5) 
insert into Schedule (StudentId, ClassId) values (1,9) 
insert into Schedule (StudentId, ClassId) values (1,12) 
insert into Schedule (StudentId, ClassId) values (2,1)
insert into Schedule (StudentId, ClassId) values (2,4)
insert into Schedule (StudentId, ClassId) values (2,7)
insert into Schedule (StudentId, ClassId) values (2,8)
insert into Schedule (StudentId, ClassId) values (3,3)
insert into Schedule (StudentId, ClassId) values (3,6)
insert into Schedule (StudentId, ClassId) values (3,9)
insert into Schedule (StudentId, ClassId) values (3,12)
insert into Schedule (StudentId, ClassId) values (4,2)
insert into Schedule (StudentId, ClassId) values (4,6)
insert into Schedule (StudentId, ClassId) values (4,8)
insert into Schedule (StudentId, ClassId) values (4,10)
go
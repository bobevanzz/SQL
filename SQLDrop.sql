use master
go
drop database if exists Corporate
go
create database Corporate
go
use Corporate
drop table if exists Employee
drop table if exists Manager
drop table if exists Department
go
create table Department(
Id int primary key identity (1,1),
Name nvarchar(80) not null,
CostCenter int not null check(CostCenter >= 100000 and CostCenter <=999999),
Active nvarchar(80) not null)
go
select * from Department
insert into Department (Name,CostCenter, Active) values ('Sales', 100000, 'Active')
go
create table Manager(
Id int primary key identity (1,1),
FirstName nvarchar(80) not null,
LastName nvarchar(80) not null ,
DepartmentId int foreign key references Department(Id),)
go
insert into Manager (FirstName,LastName) values ('Steve','Jobs')
go
create table Employee(
Id int primary key identity (1,1),
ManagerId int  foreign key references Manager(Id),
FirstName nvarchar(80) not null,
LastName nvarchar(80) not null ,
Birthday datetime not null ,
Job nvarchar(80),)
go
insert into Employee (FirstName,LastName,Birthday,Job) 
values ('Sandy','Perkins','1989-11-12 ','Sales Person')


Select CONCAT(e.FirstName, ' ',e.LastName) as 'Employee',
		e.Birthday,
		e.Job,
		CONCAT(m.FirstName, ' ', m.LastName) as 'Manager',
		d.Name as 'Department',
		d.CostCenter
	from employee e
	join manager m
		on m.id= e.ManagerId
	join Department d
	on d.Id=m.DepartmentId
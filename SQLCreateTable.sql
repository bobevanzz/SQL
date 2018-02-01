-- drop the tables in order, depending on the foreign keys
drop table if exists ToDo
drop table if exists Category
go
--create table category aka every table that doesnt have a foreign key first
create table Category(
Id int primary key identity (1,1),
[Description] nvarchar(80) not null
)
go
insert into Category (Description) values ('Personal')
insert into Category (Description) values ('Work')
go
--create table ToDo with foreign key linking to the Category
create table ToDo(
Id int primary key identity (1,1),
Task nvarchar(80) not null,
Priority int not null default 3
	check (Priority > 0 and Priority < 6),
Completed bit not null default 0,
DueDate datetime,
CategoryId int foreign key references Category(Id)
)
go
insert into Todo (Task, DueDate, CategoryId)
values ('Review Lisa''s project', '2018-2-1 12:00:00', 2)
insert into Todo (Task, DueDate, CategoryId)
values ('Pizza for lunch', '2018-2-1 12:30:00', 1)
go
--grouping the tables together
select Task, Priority, DueDate, c.Description as 'Category'
from todo t 
join category c
	on t.CategoryId = c.Id
select * from category
select * from ToDo
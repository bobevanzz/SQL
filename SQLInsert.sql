--Insert Syntax
select * from student
Insert into Student
Values('Greg', 'Doud', 3.5, 1250, 3)
select * from student

select * from student
Insert into Student
values  ('Mike', 'Jones', 4,1200,1),
		('Nate','Blevins', 3.5, 1300,3),
		('Chris','Breezy',3.3,1400,5),
		('Steve','Austin',3.1,1235,4),
		('Bob','Evans',3.7,1145,2),
		('Christina','Aguilera',4.0,1350,1),
		('Michael','Johnson',3.2,1500,4),
		('Jennifer','Hudson',4.0,1457,3),
		('Cong','Cong',3.8,1490,2)


Insert into class (description) 
values ('Blockchain Theory') 
Insert into class (description) 
Values('Whats up with that?') 
Insert into class (description)
Values('Advanced Complaining')
select * from class

select * from class
--Add Greg to a new class with a C
Insert into schedule (StudentId, ClassId, Grade)
Values (5,16,'A+')
select * from schedule

select * from student
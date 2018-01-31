--update Aaron's sat
update student set
sat = 1450
where id=1
-- change Cory's last name spelling 
update Student set
	LastName = 'Xey'
	where Id = 3
select * from student
--set Bill's major to same as Aaron
update student set
MajorId = 3
where Id = 2
select * from student
-- update everyones GPA + a tenth of a point 
update student set
GPA = GPA + 0.1
select * from student
--Change devins major to undecided
update student set
MajorId = Null
where Id = 4
select * from student

-- add  to micro and macro economics
update class set 
Description = Description + '301'
--where Description = 'Micro Economics' and Description = 'Macro Economics'
  WHERE id in (7,8)

select * from class
	where Id in (select Id from class where CHARINDEX('Economics', description) >0)
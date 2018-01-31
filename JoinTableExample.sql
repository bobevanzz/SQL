-- create a list of all students and majors
select s.FirstName, s.LastName, s.SAT, s.GPA, m.Description as 'Major'
from Student s
join Major m
on m.Id = s.MajorId


-- Display student taking Math 102
select s.FirstName, s.LastName 
from class c
join schedule sc
on sc.classId= c.Id
join student s on s.Id = sc.StudentId

-- display all classes for students with a major of math
select CONCAT(s.FirstName, ' ',s.LastName) as 'Name', c.Description as 'Class' from Student s
join major m on m.Id= s.MajorId
join Schedule sc on sc.StudentId = s.Id
join class c on c.Id= sc.ClassId
where m.Description = 'Math'

 
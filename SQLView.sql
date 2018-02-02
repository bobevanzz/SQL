--if you want to run this query over and over then you would change create view to alter view
alter view ClassesForStudent as 
select CONCAT(s.FirstName , ' ', s.LastName) as 'Name',
		s.GPA, s.SAT,
		m.Description as 'Major',
		c.Description as 'Class'
from student s
join major m
	on m.id = s.majorid
join schedule sc
	on sc.studentid = s.Id
join class c
	on c.id=sc.ClassId
--order by s.LastName, c.Description this is commented out becuase you already have them in the CONCAT

select * from ClassesForStudent where Name='Aaron Zell' order by class desc


 --students that are taking a certain class
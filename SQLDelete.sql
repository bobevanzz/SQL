--Delete European History class from students
delete from Schedule
where ClassId in (	
	select id from class
	where description = 'English 101'
)
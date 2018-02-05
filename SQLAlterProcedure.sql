--Alter procedure to select data, insert parameters
alter procedure GetAllStudents
	@GpaGreaterThanOrEqualTo decimal (4,1) = 0.0,
	@SatGTE int = 400
as 
BEGIN
	Select Id, Concat(FirstName, ' ', LastName) as 'Name', GPA, SAT
	 from student
	 where GPA>= @GpaGreaterThanOrEqualTo 
	 and sat>=@SatGTE
	 order by LastName
END
go
exec GetAllStudents @SatGTE=1500;


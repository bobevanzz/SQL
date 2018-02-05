--This is used when adding data into an already stored procedure
/*alter procedure HelloWorldSproc
	@Name nvarchar(15) = 'everyone',
	@Nbr int = 0
AS	
begin
	Print 'Hello, World to ' + @Name + 'Whose favorite number is' + CAST(@Nbr as varchar);
end
go
--
exec HelloWorldSproc @Name='Bob', @nbr=8;
*/
/*
alter procedure meowmeow
	@nbr int = 3
AS
begin Print CAST (@nbr as varchar) + ' * 2 = ' + CAST (@nbr*2 as varchar)
end
go
exec meowmeow @nbr=15;
*/
alter procedure math
	@nbr1 int = 0,
	@nbr2 int =0
AS
begin Print Concat ('The sum of', @nbr1, ' and ', @nbr2, ' is ', @nbr1+@nbr2);
end
go
exec math @nbr1=5, @nbr2=7;
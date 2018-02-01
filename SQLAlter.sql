alter table employee
	alter column cellphone nvarchar(12) not null
go

/*
update employee set
	cellphone = '513-555-1212'
go
*/
select * from employee
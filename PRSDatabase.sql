use master
drop database if exists PRSTEST
create database PRSTEST
use PRSTEST 
drop table if exists [User]
drop table if exists Vendor
drop table if exists Product
drop table if exists PurchaseRequest
drop table if exists PurchaseRequestLineItems

Create table [User] (
	Id int not null primary key identity (1,1),
	UserName nvarchar(30) not null,
	Password nvarchar(30) not null,
	FirstName nvarchar(30) not null,
	LastName nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar(75),
	IsReviewer bit not null default 0, --the user is not necessarily a reviewer so default is 0,-- 
	--but if they are then we would add a value in our insert--
	IsAdmin bit not null default 0, --same as above--
	DateCreated datetime not null default getdate(), 
	DateUpdated datetime,
)

-- to support unique UserNames
create unique index IX_Username
on [User](Username)


Insert into [User] 
	(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin, DateCreated) 
	values('bevans', 'cloud123', 'Bob', 'Evans', '513-264-2574', 'bobevans547@gmail.com', 1, 1, ' ')
Insert into [User]
	(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin, DateCreated)
	values('mjones', 'cloud456', 'Mike', 'Jones', '513-264-1588', 'mikejones@gmail.com', 1, 0, ' ')
Insert into [User]
	(Username, Password, FirstName, LastName, Phone, Email, IsReviewer, IsAdmin, DateCreated)
	values('mjackson', 'hehe123', 'Michael', 'Jackson', '513-123-4567','thriller@gmail.com', 0, 0, ' ')

Create table Vendor (
	Id int not null primary key identity (1,1),
	Code nvarchar(10) not null,
	Name nvarchar(30) not null,
	Address nvarchar (30) not null,
	City nvarchar (255) not null,
	State nvarchar (2) not null,
	Zip nvarchar (5) not null,
	Phone nvarchar (12),
	Email varchar (100),
	IsRecommended bit not null default 0,
	Active bit not null default 1,
	DateCreated datetime not null default getdate(), 
	DateUpdated datetime,
	UpdatedByUser int foreign key references [User](id)
	)
go

create unique index IUX_Code
on Vendor(Code)

go

Insert into Vendor 
	(Code, Name, Address, City, State, Zip, Phone, Email, IsRecommended, Active,DateCreated) values
	('SAM', 'Sam''s Club', '1234 Main Street', 'Cincinnati', 'OH', '45202','513-777-0022', 'info@samsclub.com', 1, ' ', ' ')

Insert into Vendor 
	(Code, Name, Address, City, State, Zip, Phone, Email, IsRecommended, Active,DateCreated) values
	('WAL', 'WalMart', '202 South Street', 'Cincinnati', 'OH', '45202','513-222-5588', 'main@walmart.com', 0, ' ', ' ')

Insert into Vendor 
	(Code, Name, Address, City, State, Zip, Phone, Email, IsRecommended, Active,DateCreated) values
	('AMZ', 'Amazon', '111 Third Street', 'Hebron', 'KY', '45202','513-581-8968', 'info@amazon.com', 1, ' ', ' ')
go

Create table Product (
	Id int not null primary key identity (1,1),
	VendorID int foreign key references Vendor(id),
	VendorPartNumber varchar(50) not null,
	Name varchar(150) not null,
	Price Decimal(10,2) not null,
	Unit varchar(255) not null,
	PhotoPath varchar(255),
	Active bit not null default 1,
	DateCreated datetime not null default getdate(), 
	DateUpdated datetime,
	)
go

Insert into Product 
	(VendorPartNumber, Name, Price, Unit, Active, DateCreated) values
	('OFCYU1', 'Office Desk', '599.00', '1', ' ',' ')

Insert into Product 
	(VendorPartNumber, Name, Price, Unit, Active, DateCreated) values
	('TO9034', 'Printer', '148.00', '2',' ',' ')

Insert into Product 
	(VendorPartNumber, Name, Price, Unit, Active, DateCreated) values
	('PDHSI45', 'Office Chair', '299.00', '1',' ',' ')

Insert into Product 
	(VendorPartNumber, Name, Price, Unit, Active, DateCreated) values
	('CAWE532', 'Desk Organizer', '25.50', '1',' ',' ')

Insert into Product 
	(VendorPartNumber, Name, Price, Unit, Active, DateCreated) values
	('WER870', 'File Cabinet', '240.00', '1', ' ',' ')

Insert into Product 
	(VendorPartNumber, Name, Price, Unit, Active, DateCreated) values
	('PGIDNZA2', '4kTelevision', '1542.00', '1',' ',' ')

go

create table PurchaseRequest(
Id int not null primary key identity (1,1),
[Description] nvarchar(80) not null,
Justification nvarchar(255),
DateNeeded date not null default (dateadd(day,(7),getdate())),
DeliveryMode nvarchar(25),
[Status] nvarchar(10) not null default 'NEW',  
Total decimal not null default 0,
Active bit not null default 1,
UserId int not null foreign key references [User](Id)
)
go

Insert into PurchaseRequest 
	(Description, Justification, DateNeeded,DeliveryMode,[Status],Total,UserId) values
	('My first 4k tv', 'I deserve it', ' ', 'UPS', 0, 0,'1')

Insert into PurchaseRequest 
	(Description, Justification, DateNeeded,DeliveryMode,[Status],Total,UserId) values
	('Board Meeting', 'For the bonuses', ' ','UPS',' ',1, '2')

Insert into PurchaseRequest 
	(Description, Justification, DateNeeded,DeliveryMode,[Status],Total,UserId) values
	('Public demo', 'For funding', ' ', 'FedEx', ' ', 1,'3')
	
go
Create table PurchaseRequestLineItems (
Id int not null primary key identity (1,1),
PurchaseRequestId int not null foreign key references PurchaseRequest(Id),
ProductId int not null foreign key references Product(Id),
Quantity int not null default 1
)
go

Insert into PurchaseRequestLineItems
(Quantity, PurchaseRequestId, ProductId) values (' ','1','1')
Insert into PurchaseRequestLineItems
(Quantity, PurchaseRequestId, ProductId) values (' ','2','2')
Insert into PurchaseRequestLineItems
(Quantity, PurchaseRequestId, ProductId) values (' ','3','3')
go

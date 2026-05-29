alter table tblEmployee3
add constraint PK_tblEmployee PRIMARY KEY (EmployeeNumber)

insert into tblEmployee3(EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, 
EmployeeGovernmentID, DateOfBirth, Department) 
values (2004, 'FirstName', 'MiddleName', 'LastName', 'AB12345FI', '2014-01-01', 'Accounts')

delete from tblEmployee3
where EmployeeNumber = 2004

alter table tblEmployee3
drop constraint PK_tblEmployee

create table tblEmployee4
(EmployeeNumber int CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),
EmployeeName nvarchar(20))

insert into tblEmployee4
values ('My Name'),
('My Name')

select * from tblEmployee4

delete from tblEmployee4

truncate table tblEmployee4


insert into tblEmployee4(EmployeeNumber, EmployeeName)
values (3, 'My Name'), (4, 'My Name')

SET IDENTITY_INSERT tblEmployee4 ON

insert into tblEmployee4(EmployeeNumber, EmployeeName)
values (38, 'My Name'), (39, 'My Name')

SET IDENTITY_INSERT tblEmployee4 OFF

drop table tblEmployee4

select @@IDENTITY
select SCOPE_IDENTITY()

select IDENT_CURRENT('dbo.tblEmployee2')

create table tblEmployee5
(EmployeeNumber int CONSTRAINT PK_tblEmployee3 PRIMARY KEY IDENTITY(1,1),
EmployeeName nvarchar(20))

insert into tblEmployee5
values ('My Name'),
('My Name')

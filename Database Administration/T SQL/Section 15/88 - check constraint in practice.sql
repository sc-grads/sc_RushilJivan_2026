alter table tblTransaction3
add constraint chkAmount check (Amount>-1000 and Amount < 1000)

insert into tblTransaction3
values (1010, '2014-01-01', 1)

alter table tblEmployee3 with nocheck
add constraint chkMiddleName check
(REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName or EmployeeMiddleName is null)

alter table tblEmployee3
drop constraint chkMiddleName

begin tran
  insert into tblEmployee3
  values (2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts')
  select * from tblEmployee3 where EmployeeNumber = 2003
rollback tran

alter table tblEmployee3 with nocheck
add constraint chkDateOfBirth check (DateOfBirth between '1900-01-01' and getdate())

begin tran
  insert into tblEmployee3
  values (2003, 'A', 'B', 'C', 'D', '2115-01-01', 'Accounts')
  select * from tblEmployee3 where EmployeeNumber = 2003
rollback tran

create table tblEmployee4
(EmployeeMiddleName varchar(50) null, constraint CK_EmployeeMiddleName check
(REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName or EmployeeMiddleName is null))

drop table tblEmployee4

alter table tblEmployee3
drop chkDateOfBirth
alter table tblEmployee3
drop chkMiddleName
alter table tblTransaction3
drop chkAmount

alter table tblTransaction3
add DateOfEntry datetime

alter table tblTransaction3
add constraint defDateOfEntry DEFAULT GETDATE() for DateOfEntry;

delete from tblTransaction where EmployeeNumber < 3

insert into tblTransaction3(Amount, DateOfTransaction, EmployeeNumber)
values (1, '2014-01-01', 1)

insert into tblTransaction3(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
values (2, '2014-01-02', 1, '2013-01-01')

select * from tblTransaction3 where EmployeeNumber < 3

create table tblTransaction4
(Amount smallmoney not null,
DateOfTransaction smalldatetime not null,
EmployeeNumber int not null,
DateOfEntry datetime null CONSTRAINT tblTransaction2_defDateOfEntry DEFAULT GETDATE())

insert into tblTransaction4(Amount, DateOfTransaction, EmployeeNumber)
values (1, '2014-01-01', 1)
insert into tblTransaction4(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
values (2, '2014-01-02', 1, '2013-01-01')

select * from tblTransaction4 where EmployeeNumber < 3

drop table tblTransaction4

alter table tblTransaction3
drop column DateOfEntry

alter table tblTransaction3
drop constraint defDateOfEntry

BEGIN TRAN

ALTER TABLE tblTransaction3
ADD DateOfEntry datetime
DEFAULT GETDATE() WITH VALUES

SELECT * FROM tblTransaction3

ROLLBACK TRAN

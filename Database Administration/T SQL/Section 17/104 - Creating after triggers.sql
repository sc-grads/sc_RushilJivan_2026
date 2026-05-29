ALTER TRIGGER TR_tblTransaction
ON tblTransaction3
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
	--insert into tblTransaction4
	select *, 'Inserted' from Inserted
	--insert into tblTransaction4
	select *, 'Deleted' from Deleted
END
GO

BEGIN TRAN
insert into tblTransaction3(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123,'2015-07-10', 123)
--delete tblTransaction 
--where EmployeeNumber = 123 and DateOfTransaction = '2015-07-10'
ROLLBACK TRAN
GO
DISABLE TRIGGER TR_tblTransaction ON tblTransaction3;
GO
ENABLE TRIGGER TR_tblTransaction ON tblTransaction3;
GO
DROP TRIGGER TR_tblTransaction;
GO

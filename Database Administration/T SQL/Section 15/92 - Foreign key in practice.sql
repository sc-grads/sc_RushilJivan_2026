BEGIN TRAN
ALTER TABLE tblTransaction3 ALTER COLUMN EmployeeNumber INT NULL 
ALTER TABLE tblTransaction3 ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber
ALTER TABLE tblTransaction3 WITH NOCHECK
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
REFERENCES tblEmployee3(EmployeeNumber)
ON UPDATE CASCADE
ON DELETE set default
--UPDATE tblEmployee SET EmployeeNumber = 9123 Where EmployeeNumber = 123
DELETE tblEmployee3 Where EmployeeNumber = 123

SELECT E.EmployeeNumber, T.*
FROM tblEmployee3 as E
RIGHT JOIN tblTransaction3 as T
on E.EmployeeNumber = T.EmployeeNumber
where T.Amount IN (-179.47, 786.22, -967.36, 957.03)

ROLLBACK TRAN

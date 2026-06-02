CREATE FUNCTION TransList(@EmployeeNumber int)
RETURNS @TransList TABLE
(Amount smallmoney,
DateOfTransaction smalldatetime,
EmployeeNumber int)
AS
BEGIN

	INSERT INTO @TransList
	SELECT * FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber

	RETURN
END



SELECT * FROM dbo.TransList(123)
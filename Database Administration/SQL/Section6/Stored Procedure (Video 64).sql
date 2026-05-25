
--CREATE PROCEDURE [dbo].[SelectAllPersonAddress]
--AS
--SELECT * FROM  Person.Address
--go;

--GO


-----------------------

--exec [dbo].[SelectAllPersonAddress]

-------------------------------------------------

--drop procedure [dbo].[SelectAllPersonAddress]

----------------
CREATE PROCEDURE SelectAllPersonAddressWithParam @City NVARCHAR(30)
AS

-- BEGIN
SET NOCOUNT ON

SELECT * FROM  Person.Address where City = @city;

-- END
--GO



--------------------------

exec SelectAllPersonAddressWithParam @city = 'New York'

-------------------------------

exec SelectAllPersonAddressWithParam @city = 'Miami'
exec SelectAllPersonAddressWithParam 'Miami'

----------------------------------

drop procedure [SelectAllPersonAddressWithParam]

--------------------------

CREATE PROCEDURE SelectAllPersonAddressWithParams1 @City NVARCHAR(30) = 'New York'
AS

--BEGIN
SET NOCOUNT ON

SELECT * FROM  Person.Address where City = @city;

--END
--GO


-------------------

exec SelectAllPersonAddressWithParams1 'Miami'

------------------------------------------

CREATE PROCEDURE [dbo].[SelectAllPersonAddressWithParams] (@City NVARCHAR(30) = 'New York',@stateProvinceid int)
AS

BEGIN
SET NOCOUNT ON

SELECT * FROM  Person.Address where City = @city;

END
GO


----------------------

CREATE PROCEDURE [dbo].[SelectAllPersonAddressWithParamswithEncryption] (@City NVARCHAR(30) = 'New York',@stateProvinceid int)
AS

BEGIN
SET NOCOUNT ON

SELECT * FROM  Person.Address where City = @city;

END
GO


-----------------------------------------------

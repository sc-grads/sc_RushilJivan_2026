DECLARE @myvar as numeric(7,2) -- or decimal(7,2) - 5 bytes needed

-- 12345.67 is valid for the above.
-- 123456.7 is not valid 

SET @myvar = 12345.67

SELECT @myvar AS myVariable

GO

DECLARE @myvar as numeric(18,8) 

SET @myvar = 1000000000.12345678

SELECT @myvar AS myVariable 

GO

DECLARE @myvar AS smallmoney = 123456.78917

select @myvar as myVariable

GO

DECLARE @myvar AS float(24) = 123456.7891 

Select @myvar as myVariable 

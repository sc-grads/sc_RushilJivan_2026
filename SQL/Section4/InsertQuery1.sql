USE [OurFirstDatabase]
GO

INSERT INTO [dbo].[personalInfo]
           ([firstName]
           ,[lastName]
           ,[dob]
           ,[ID])
     VALUES
           ('Abbas',
            'Mehmood',
            '02/02/2020',
            777
            )
GO


SELECT * FROM personalInfo


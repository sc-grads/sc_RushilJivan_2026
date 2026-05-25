  USE [AdventureWorks2022]
  GO
  ALTER ROLE [dbdev] ADD MEMBER [LABMSSQL\winuser01]
  GO
  USE [AdventureWorks2022]
  GO
  ALTER ROLE [dbdev] ADD MEMBER [sqluser01]
  GO



  USE [AdventureWorks2022]
GO
CREATE USER [sqluser01] FOR LOGIN [sqluser01]
GO

SELECT pe.state_desc, pe.permission_name  FROM sys.database_principals pr INNER JOIN sys.datatbase_permissions pe
     ON pr.principal_id = pe.grantee_principal_id WHERE pr.principal_id = USER_ID('sqluser01');

SELECT pe.state_desc, pe.permission_name  FROM sys.database_principals pr INNER JOIN sys.datatbase_permissions pe
     ON pr.principal_id = pe.grantee_principal_id WHERE pr.principal_id = USER_ID('LABMSSQL\winuser01');

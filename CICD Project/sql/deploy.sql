IF DB_ID('CloudTunnel-RJ') IS NULL
BEGIN
    PRINT 'Database does not exist. Creating database...';
    CREATE DATABASE [CloudTunnel-RJ];
END
ELSE
BEGIN
    PRINT 'Database already exists. Using existing database...';
END
GO

USE [CloudTunnel-RJ];
GO

IF OBJECT_ID('dbo.DeploymentLog', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.DeploymentLog (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Message NVARCHAR(255),
        CreatedAt DATETIME DEFAULT GETDATE()
    );

    PRINT 'Table DeploymentLog created.';
END
ELSE
BEGIN
    PRINT 'Table DeploymentLog already exists.';
END
GO

INSERT INTO dbo.DeploymentLog (Message)
VALUES ('Deployment executed from CI/CD pipeline');
GO
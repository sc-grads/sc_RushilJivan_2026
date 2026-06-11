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





-- Create Users table if it does not exist
IF OBJECT_ID('dbo.Users', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users
    (
        UserID INT IDENTITY(1,1) PRIMARY KEY,
        FirstName VARCHAR(50) NOT NULL,
        LastName VARCHAR(50) NOT NULL,
        Email VARCHAR(100) NOT NULL,
        CreatedDate DATETIME DEFAULT GETDATE()
    );

    PRINT 'Users table created.';
END
ELSE
BEGIN
    PRINT 'Users table already exists.';
END
GO

-- Insert sample users only if table is empty
IF NOT EXISTS (SELECT 1 FROM dbo.Users)
BEGIN
    INSERT INTO dbo.Users
    (
        FirstName,
        LastName,
        Email
    )
    VALUES
    ('Rushil', 'Jivan', 'rushil.jivan@example.com'),
    ('John', 'Smith', 'john.smith@example.com'),
    ('Sarah', 'Jones', 'sarah.jones@example.com'),
    ('Michael', 'Brown', 'michael.brown@example.com'),
    ('Emma', 'Wilson', 'emma.wilson@example.com');

    PRINT 'Sample users inserted.';
END
ELSE
BEGIN
    PRINT 'Users table already contains data.';
END
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
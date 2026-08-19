CREATE DATABASE TimesheetMigrationDB;
GO



USE TimesheetMigrationDB;
GO

CREATE TABLE Staging_Timesheets
(
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName VARCHAR(200),
    WorkDate DATE,
    DayOfWeek VARCHAR(20),
    ClientName VARCHAR(200),
    ProjectName VARCHAR(200),
    Description VARCHAR(MAX),
    BillableFlag VARCHAR(20),
    Comments VARCHAR(MAX),
    TotalHours DECIMAL(5,2),
    StartTime TIME,
    EndTime TIME,
    SourceFile VARCHAR(255),
    LoadDate DATETIME DEFAULT GETDATE()
);
GO





CREATE TABLE ETL_AuditLog
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    FileName VARCHAR(255),
    Status VARCHAR(50),
    RowsProcessed INT,
    ErrorMessage VARCHAR(MAX),
    ProcessedDate DATETIME DEFAULT GETDATE()
);
GO




USE TimesheetMigrationDB;
GO

CREATE TABLE Consultants
(
    ConsultantID INT IDENTITY(1,1) PRIMARY KEY,
    ConsultantName VARCHAR(200) NOT NULL UNIQUE
);
GO




CREATE TABLE Clients
(
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName VARCHAR(200) NOT NULL UNIQUE
);
GO




CREATE TABLE Projects
(
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    ProjectName VARCHAR(200) NOT NULL,

    CONSTRAINT FK_Projects_Clients
    FOREIGN KEY (ClientID)
    REFERENCES Clients(ClientID)
);
GO






CREATE TABLE Timesheets
(
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,

    ConsultantID INT NOT NULL,
    ProjectID INT NOT NULL,

    WorkDate DATE NOT NULL,
    DayOfWeek VARCHAR(20),

    Description VARCHAR(MAX),
    BillableFlag VARCHAR(20),
    Comments VARCHAR(MAX),

    TotalHours DECIMAL(5,2),

    StartTime TIME,
    EndTime TIME,

    LoadDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Timesheets_Consultants
    FOREIGN KEY (ConsultantID)
    REFERENCES Consultants(ConsultantID),

    CONSTRAINT FK_Timesheets_Projects
    FOREIGN KEY (ProjectID)
    REFERENCES Projects(ProjectID)
);
GO



SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
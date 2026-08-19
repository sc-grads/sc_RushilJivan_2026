CREATE DATABASE TimesheetDBTestNew;
GO

USE TimesheetDBTestNew;
GO

-- ========================================================
-- 1. AUDIT LOGGING TABLE (For ELK Ingestion)
-- ========================================================
CREATE TABLE AuditLogs (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName VARCHAR(100) NOT NULL,
    TaskName VARCHAR(100) NOT NULL,
    SourceFileName VARCHAR(255) NULL,
    RecordsProcessed INT DEFAULT 0,
    Status VARCHAR(50) DEFAULT 'RUNNING', -- RUNNING, SUCCESS, FAILED
    ErrorMessage TEXT NULL,
    LogTimestamp DATETIME DEFAULT GETDATE()
);
GO

-- ========================================================
-- 2. STAGING LAYER (Lax data types to handle messy Excel input)
-- ========================================================
CREATE TABLE Stage_Timesheet (
    StageID INT IDENTITY(1,1) PRIMARY KEY,
    SourceFile VARCHAR(255),
    GraduateName VARCHAR(255),
    GraduateEmail VARCHAR(255),
    ProjectName VARCHAR(255),
    TaskDate VARCHAR(50),      -- Varchar to prevent Excel date formatting crashes
    HoursWorked VARCHAR(50),   -- Varchar to prevent Excel formatting crashes
    TaskDescription VARCHAR(MAX)
);
GO

-- ========================================================
-- 3. CORE NORMALIZED TABLES (3NF Destination)
-- ========================================================
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Graduates (
    GraduateID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(150) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE TimesheetEntries (
    EntryID INT IDENTITY(1,1) PRIMARY KEY,
    GraduateID INT FOREIGN KEY REFERENCES Graduates(GraduateID),
    ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID),
    TaskDate DATE NOT NULL,
    HoursWorked DECIMAL(5,2) NOT NULL,
    TaskDescription VARCHAR(MAX) NULL,
    InsertedAt DATETIME DEFAULT GETDATE(),
    AuditID INT FOREIGN KEY REFERENCES AuditLogs(AuditID) -- Links back to the pipeline run
);
GO
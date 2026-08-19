CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(200) UNIQUE NOT NULL
);


CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName VARCHAR(200) UNIQUE NOT NULL
);



CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    ProjectName VARCHAR(200) NOT NULL,

    CONSTRAINT FK_Projects_Clients
        FOREIGN KEY (ClientID)
        REFERENCES Clients(ClientID)
);




CREATE TABLE FileTracker (
    FileID INT IDENTITY(1,1) PRIMARY KEY,

    FileName VARCHAR(255) NOT NULL,
    EmployeeName VARCHAR(200) NOT NULL,
    Month VARCHAR(50) NOT NULL,

    RecordsRead INT DEFAULT 0,
    RecordsInserted INT DEFAULT 0,
    RecordsFailed INT DEFAULT 0,

    Status VARCHAR(50),
    StartTime DATETIME,
    EndTime DATETIME,

    LoadDate DATETIME DEFAULT GETDATE()
);






CREATE TABLE Staging_Timesheets (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,

    EmployeeName VARCHAR(200),

    Date VARCHAR(50),
    DayOfWeek VARCHAR(50),

    Client VARCHAR(200),
    ClientProjectName VARCHAR(200),

    Description VARCHAR(500),
    BillableOrNonBillable VARCHAR(50),

    Comments VARCHAR(500),

    TotalHours VARCHAR(50),
    StartTime VARCHAR(50),
    EndTime VARCHAR(50),

    SourceFile VARCHAR(255),

    LoadDate DATETIME DEFAULT GETDATE()
);






CREATE TABLE Timesheets (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,

    EmployeeID INT NOT NULL,
    ClientID INT NOT NULL,
    ProjectID INT NOT NULL,

    WorkDate DATE,
    DayOfWeek VARCHAR(20),

    Description VARCHAR(500),
    Comments VARCHAR(500),

    Billable BIT,

    TotalHours DECIMAL(5,2),
    StartTime TIME,
    EndTime TIME,

    SourceFile VARCHAR(255),
    LoadDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Timesheets_Employees FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),

    CONSTRAINT FK_Timesheets_Clients FOREIGN KEY (ClientID)
        REFERENCES Clients(ClientID),

    CONSTRAINT FK_Timesheets_Projects FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);






CREATE INDEX IX_Timesheets_EmployeeID ON Timesheets(EmployeeID);
CREATE INDEX IX_Timesheets_ClientID ON Timesheets(ClientID);
CREATE INDEX IX_Timesheets_WorkDate ON Timesheets(WorkDate);
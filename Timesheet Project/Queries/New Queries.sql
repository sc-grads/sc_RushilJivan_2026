SELECT [StagingID]
      ,[EmployeeSourceFile]
      ,[RawDate]
      ,[RawDayOfWeek]
      ,[RawClient]
      ,[RawProjectName]
      ,[RawDescription]
      ,[RawBillableStatus]
      ,[RawComments]
      ,[RawTotalHours]
      ,[RawStartTime]
      ,[RawEndTime]
      ,[EmployeeName]
  FROM [TimesheetDBTest].[dbo].[StagingTimesheet]


  truncate table stagingtimesheet


  sp_help StagingTimesheet;


  ALTER TABLE StagingTimesheet
ALTER COLUMN EmployeeSourceFile NVARCHAR(MAX);


 ALTER TABLE StagingTimesheet
ALTER COLUMN EmployeeName NVARCHAR(MAX);


SELECT 
    '### ' + t.TABLE_NAME AS [Database Structure]
FROM 
    INFORMATION_SCHEMA.TABLES t
WHERE 
    t.TABLE_TYPE = 'BASE TABLE'

UNION ALL

SELECT 
    '* ' + c.COLUMN_NAME + ' (' + c.DATA_TYPE + 
    CASE 
        WHEN c.CHARACTER_MAXIMUM_LENGTH IS NOT NULL THEN '(' + CAST(c.CHARACTER_MAXIMUM_LENGTH AS VARCHAR) + ')'
        WHEN c.DATA_TYPE IN ('decimal', 'numeric') THEN '(' + CAST(c.NUMERIC_PRECISION AS VARCHAR) + ',' + CAST(c.NUMERIC_SCALE AS VARCHAR) + ')'
        ELSE ''
    END + ') ' + 
    CASE WHEN c.IS_NULLABLE = 'NO' THEN 'NOT NULL' ELSE 'NULL' END
FROM 
    INFORMATION_SCHEMA.COLUMNS c
INNER JOIN 
    INFORMATION_SCHEMA.TABLES t ON c.TABLE_NAME = t.TABLE_NAME
WHERE 
    t.TABLE_TYPE = 'BASE TABLE'
    -- You can filter for specific tables here if needed:
    -- AND t.TABLE_NAME IN ('Employees', 'GraduateTimesheets') 
ORDER BY 
    [Database Structure] ASC;


    SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Timesheet';



SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME IN ('Client', 'Project');


SELECT DISTINCT 
    st.EmployeeName, 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName
FROM StagingTimesheet st
LEFT JOIN Employee e 
    ON e.FirstName = CASE WHEN CHARINDEX('_', st.EmployeeName) > 0 THEN SUBSTRING(st.EmployeeName, 1, CHARINDEX('_', st.EmployeeName) - 1) ELSE st.EmployeeName END;
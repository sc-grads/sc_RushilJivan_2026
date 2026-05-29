SELECT DATENAME(month, DateofBirth) as MonthName, COUNT(*) as NumberEmployees, COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
count(*)-count(EmployeeMiddleName) as NoMiddleName,
format(min(DateOfBirth),'dd-MM-yy') as EarliestDateOfBirth,
format(max(DateOfBirth),'D') as LatestDateOfBirth
FROM tblEmployee2
GROUP BY DATENAME(MONTH,DateOfBirth), DATEPART(MONTH,DateOfBirth)
ORDER BY DATEPART(MONTH,DateOfBirth)

select * from dbo.tblEmployeeTemporal
FOR SYSTEM_TIME
FROM startdatetime TO enddatetime
BETWEEN startdatetime AND enddatetime
CONTAINED IN (startdatetime, enddatetime)

select * from tblEmployee2 join tblTransaction on tblEmployee2.EmployeeNumber = tblTransaction.EmployeeNumber

select tblEmployee2.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployee2 join tblTransaction 
on tblEmployee2.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee2.EmployeeNumber, EmployeeFirstName, EmployeeLastName
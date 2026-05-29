select tblEmployee2.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployee2 left join tblTransaction
on tblEmployee2.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee2.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber

select * from tblEmployee2

select * from tblTransaction where EmployeeNumber = 1046

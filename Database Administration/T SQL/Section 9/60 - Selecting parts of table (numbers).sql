select * from tblEmployee2
where EmployeeNumber > 200

select * from tblEmployee2
where not EmployeeNumber > 200

select * from tblEmployee2
where EmployeeNumber = 200

select * from tblEmployee2
where EmployeeNumber != 200

select * from tblEmployee2
where EmployeeNumber >= 200 and EmployeeNumber <= 209

select * from tblEmployee2
where not (EmployeeNumber >= 200 and EmployeeNumber <= 209)

select * from tblEmployee2
where EmployeeNumber < 200 or EmployeeNumber > 209

select * from tblEmployee2
where EmployeeNumber between 200 and 209

select * from tblEmployee2
where EmployeeNumber not between 200 and 209

select * from tblEmployee2
where EmployeeNumber in (200, 204, 208)

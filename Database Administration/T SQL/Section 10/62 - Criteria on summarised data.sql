select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee2
group by left(EmployeeLastName,1)
order by left(EmployeeLastName,1)


select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee2
group by left(EmployeeLastName,1)
order by count(*)

select top(5) left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee2
group by left(EmployeeLastName,1)
order by left(EmployeeLastName,1)


select top(5) left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee2
group by left(EmployeeLastName,1)
order by count(*) DESC


select left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial
from tblEmployee2
where DateOfBirth > '19860101'
group by left(EmployeeLastName,1)
having count(*)>=20
order by CountOfInitial DESC 

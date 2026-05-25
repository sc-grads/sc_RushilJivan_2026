drop table salesstaff

-----------------------------------------

create table salesstaffdelete
(
staffid int not null primary key,
firstname nvarchar(50) not null,
lastname nvarchar(50) not null,
countryregion nvarchar(50) not null
)

----------------------------------------------

insert into salesstaffdelete
select [BusinessEntityID],[FirstName],[LastName],[CountryRegionName] from [Sales].[vSalesPerson]

-------------------------------------

delete salesstaffdelete

----------------------


delete from salesstaffdelete

--------------------------

delete from salesstaffdelete where countryregion =  'united states'

-----------------------------
begin tran
delete from salesstaffdelete where countryregion =  'united states'

rollback tran

------------------------------

begin tran
delete from salesstaffdelete where countryregion =  'united states'

commit

------------------------

delete from salesstaffdelete where staffid in (select [BusinessEntityID] from [Sales].[vSalesPerson] where SalesLastYear = 0)

-------------------------------------

delete salesstaffdelete 
from  [Sales].[vSalesPerson] sp
inner join salesstaffdelete ss
on sp.[BusinessEntityID] = ss.staffid
where sp.saleslastyear = 0
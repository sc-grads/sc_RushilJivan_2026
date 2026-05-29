select * from tblEmployee2
where DateOfBirth between '19760101' and '19861231'

select * from tblEmployee2
where DateOfBirth >= '19760101' and DateOfBirth < '19870101'

select * from tblEmployee2
where year(DateOfBirth) between 1976 and 1986  -- DONT USE

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee2
GROUP BY year(DateOfBirth)

SELECT * FROM tblEmployee2
where year(DateOfBirth) = 1967

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee2
WHERE 1=1
GROUP BY year(DateOfBirth)
-- non-deterministic

SELECT year(DateOfBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee2
WHERE 1=1
GROUP BY year(DateOfBirth)
ORDER BY year(DateOfBirth) DESC
-- deterministic

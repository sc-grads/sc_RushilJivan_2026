CREATE TABLE [AdventureWorks2022].[sales].[visits] (
visit_id INT PRIMARY KEY IDENTITY (1,1),
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
visited_at DATETIME,
phone VARCHAR(20),
store_id INT NOT NULL,
FOREIGN KEY(store_id) REFERENCES sales.storenew(store_id)
)

CREATE TABLE [AdventureWorks2022].[sales].[storenew] (
store_id INT NOT NULL,
sales INT 
)

SELECT * FROM [AdventureWorks2022].[sales].[visits]


SELECT BusinessEntityID, firstname, lastname, title
into #TempPersonTable
from person.person
where title = 'mr.'


SELECT BusinessEntityID, firstname, lastname, title

from person.person
where title = 'mr.'


SELECT * FROM #TempPersonTable

DROP TABLE #TempPersonTable


CREATE TABLE #TempPersonTable (
BusinessEntityID int,
firstname nvarchar(50),
lastname nvarchar(50),
title nvarchar(50)
)

INSERT INTO #TempPersonTable
SELECT BusinessEntityID, firstname, lastname, title
FROM Person.Person
WHERE title = 'mr.'
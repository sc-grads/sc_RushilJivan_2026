SELECT * FROM Sales.SalesOrderDetail;
 
SELECT ProductID, OrderQty, UnitPrice FROM Sales.SalesOrderDetail;
 
SELECT ProductID, OrderQty AS 'Order Quantity', UnitPrice AS 'Unit Price' FROM Sales.SalesOrderDetail;


--where

SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID=836
 
-- We can also use a comparison operator
 
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty>5
 
-- We can have multiple conditions also
 
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty>5 AND UnitPrice>100
 
-- Finding rows that are between values
 
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10;
 
-- Filtering string values
 
SELECT * FROM Sales.Customer
WHERE LastName='Gates';
 
-- Filtering on a list of values
 
SELECT * FROM Sales.Customer
WHERE LastName IN ('Gates','Harris','Harding')
 
-- Finding company names that include Sports in their name
 
SELECT * FROM Sales.Customer
WHERE CompanyName LIKE '%Sports%'


-- order by


SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10
ORDER BY UnitPrice;
 
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10
ORDER BY OrderQty DESC;


--aggregate functions

SELECT COUNT(ProductID) AS 'Count of Products' FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10;
 
SELECT ProductID FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10 
ORDER BY ProductID;
 
SELECT COUNT(DISTINCT(ProductID)) AS 'Count of Products' FROM Sales.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10;
 
SELECT MAX(OrderQty) FROM Sales.SalesOrderDetail;
 
SELECT ProductID,MAX(OrderQty) FROM Sales.SalesOrderDetail;



--group by

SELECT ProductID,MAX(OrderQty) AS 'Order Quantity' FROM Sales.SalesOrderDetail
GROUP BY ProductID;
 
SELECT ProductID,MAX(OrderQty) AS 'Order Quantity' FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY 'Order Quantity' DESC;



--join 


SELECT Sales.Product.ProductID,Name,ListPrice,OrderQty,LineTotal
FROM Sales.Product INNER JOIN Sales.SalesOrderDetail
ON (Sales.Product.ProductID = Sales.SalesOrderDetail.ProductID);
 
SELECT p.ProductID,p.Name,p.ListPrice,o.OrderQty,o.LineTotal
FROM Sales.Product p INNER JOIN Sales.SalesOrderDetail o
ON (p.ProductID = o.ProductID);
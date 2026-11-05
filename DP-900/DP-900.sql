CREATE TABLE Student
(
    StudentID varchar(100) NOT NULL,
    StudentName varchar(1000),
    PRIMARY KEY (StudentID)
);


CREATE TABLE Course (
    CourseID varchar(100) NOT NULL,
    CourseName varchar(1000),
    Price real,    
    PRIMARY KEY (CourseID)
);
 
CREATE TABLE Orders (
    OrderID varchar(100) NOT NULL,
    CourseID varchar(100),
    CustomerID varchar(100),    
    Discountpercent int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
 
 
INSERT INTO Student(StudentID,StudentName) values ('S1','StudentA');
INSERT INTO Student(StudentID,StudentName) values ('S2','StudentB');
INSERT INTO Student(StudentID,StudentName) values ('S3','StudentC');
 
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C1','AZ-900',99.99);
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C2','DP-900',100.99);
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C3','AZ-104',89.99);
 
INSERT INTO Orders(OrderID,CourseID,StudentID,Discountpercent) values ('O1','C2','S1',90);
INSERT INTO Orders(OrderID,CourseID,StudentID,Discountpercent) values ('O2','C1','S2',50);
INSERT INTO Orders(OrderID,CourseID,StudentID,Discountpercent) values ('O3','C3','S3',60);


CREATE VIEW ProductOrderView
AS
SELECT p.ProductID,p.Name,p.ListPrice,o.OrderQty,o.LineTotal
FROM Sales.Product p INNER JOIN Sales.SalesOrderDetail o
ON (p.ProductID = o.ProductID);
 
SELECT * FROM ProductOrderView;
 
DROP VIEW ProductOrderView;


CREATE TABLE customers
(
CustomerId int,
CustomerName varchar(1000),
Age int)

INSERT INTO Customers(CustomerId,Customername,Age) VALUES (1,'userA',20)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (2,'userB',30)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (3,'userC',31)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (4,'userD',26)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (5,'userE',29)

SELECT * from Customers where CustomerId=3


CREATE CLUSTERED INDEX IX_customers_customerid
    ON dbo.Customers (CustomerId);    


CREATE PROCEDURE ChangeAge
@CustomerID INT,
@NewAge INT
AS
UPDATE Customers
SET age = @NewAge
WHERE CustomerId = @CustomerID


EXEC ChangeAge 2,35;



sqlcmd -S sqlserver355465.database.windows.net -d appdb -U sqladmin -P Azure@123 -I
select * from Customers
GO
:setvar SQLCMDMAXVARTYPEWIDTH 30
:setvar SQLCMDMAXFIXEDTYPEWIDTH 30
select * from Customers
GO
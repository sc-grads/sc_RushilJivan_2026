CREATE DATABASE appdb;

USE appdb;

CREATE TABLE Customer(
	CustomerId VARCHAR(100),
	CustomerName VARCHAR(100)
);


INSERT INTO Customer(CustomerId,CustomerName) VALUES('C1','UserA');
INSERT INTO Customer(CustomerId,CustomerName) VALUES('C2','UserB');
INSERT INTO Customer(CustomerId,CustomerName) VALUES('C3','UserC');


SELECT * from Customer;
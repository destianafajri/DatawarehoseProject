
-- KUERI UNTUK MEMBUAT DIMENSION TABLE --

CREATE TABLE DimCustomer(
	CustomerID int NOT NULL PRIMARY KEY,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Age int NOT NULL,
	Gender varchar(15) NOT NULL, 
	City varchar(30) NOT NULL,
	NoHp numeric NOT NULL
);

CREATE TABLE DimProduct(
	ProductId int NOT NULL PRIMARY KEY,
	ProductName varchar(250) NOT NULL,
	ProductCategory varchar(250) NOT NULL,
	ProductUnitPrice numeric NOT NULL
);

CREATE TABLE DimStatusOrder(
	StatusId int NOT NULL PRIMARY KEY,
	StatusOrder varchar(15) NOT NULL,
	StatusOrderDesc text
);

-- KUERI UNTUK MEMBUAT FACT TABLE --

CREATE TABLE FactSalesOrder(
	OrderId int NOT NULL PRIMARY KEY,
	CustomerId int FOREIGN KEY REFERENCES DimCustomer(CustomerId),
	ProductId int FOREIGN KEY REFERENCES DimProduct(ProductId),
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusId int FOREIGN KEY REFERENCES DimStatusOrder(StatusId),
	OrderDate datetime NOT NULL
);
--For creating the database
Create database BakeryBusiness

Use BakeryBusiness
go
Create Table Countries
(
	Id int primary key identity,
	Name varchar(50) unique not null
)

Create Table Customers
(
	Id int primary key identity,
	FirstName varchar(25) not null,
	LastName varchar(25) not null,
	Gender char(1) not null check(Gender in ('M','F')),
	Age int not null,
	PhoneNumber char(10) not null,
	CountryId int not null references Countries(Id) 
)

Create Table Products
(
	Id int primary key identity,
	Name varchar(25) not null unique,
	Price decimal(10,2) not null check(Price>=0) 
)

Create Table Feedbacks
(
	Id int primary key identity,
	Description varchar(255) not null,
	Rate decimal(10,2) not null Check(Rate>=0 and Rate<=10),
	ProductId int  not null references Products(Id),
	CustomerId int not null references Customers(Id)
)

Create Table Distributors
(
	Id int primary key identity,
	Name varchar(25)  not null unique,
	AddressText varchar(30)  not null,
	Summary varchar(200) not null,
	CountryId int  not null references Countries(Id)
)

Create Table Ingredients
(
	Id int primary key identity,
	Name varchar(30) not null,
	Description varchar(200) not null,
	OriginCountryId int not null references Countries(Id),
	DistributorId int not null references Distributors(Id)
)

Create Table ProductsIngredients
(
	ProductId int  not null references Products(Id),
	IngredientId int  not null references Ingredients(Id)

	Constraint PK_ProductsIngredients primary key (ProductId,IngredientId)
)
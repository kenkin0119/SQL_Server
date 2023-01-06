--------Contraints(條件約束)--------
--primary key Constraints
create table Orders(
	OrderID nchar(8),
	OrderDate datetime default getdate(), --Default constraint
	CustomerID nchar(5) not null,
	primary key(OrderID) --資料表層級的primary key Constraints
)
go

create table Products(
	ProductID nchar(8) primary key, --欄位層級的primary key Constraints
	ProductName nvarchar(40) not null,
	UnitPrice money not null
)
go

create table OrderDetails(
	OrderID nchar(8),
	ProductID nchar(8),
	UnitPrice money not null,
	Quantity int not null,
	UnitToal as UnitPrice*Quantity,
	primary key(OrderID,ProductID)
)
go

-----Unique constraint
create table Customers(
	CustomerID nchar(5) primary key,
	CustomerName nvarchar(30) not null,
	Account nvarchar(20) not null unique,
	Password nvarchar(20) not null
)
go

----check Constraint
create table ProductType(
	ProductTypeID nchar(2) primary key,
	ProductTypeName nvarchar(50) not null,
	ProductTypeValue int not null constraint CK_ProductTypeValueNoLessThenZero check(ProductTypeValue>=0)  --這個要填一個>=0的值
)
go


------Foreign key constraint
create table classes(
	StuId nchar(4),
	CourseID nchar(5),
	ProfessorID nchar(4),
	ClassTime datetime not null,
	Classroom nchar(5) not null,
	primary key(StuId,CourseID,ProfessorID),
	foreign key(StuId) references Students(StuId) on delete no action on update no action,
	foreign key(CourseID) references Courses(CourseID) on delete cascade on update cascade,
	foreign key(ProfessorID) references Professors(ProfessorID) on delete no action on update cascade
)




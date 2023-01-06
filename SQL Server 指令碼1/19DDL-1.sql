--SQL
--DML

create database dbTest
go

use dbTest
go

create database School
go　--批次執行 先傳到資料庫建立物件 再接下去執行

use School
go
----------------------------------------------
create table Students(
	StuId nchar(4) primary key,
	StuName nvarchar(30) not null,
	StuGender bit not null,
	StuTel nvarchar(20),
	StuBirthday datetime not null,
	StuAge as datediff(year,StuBirthday,getdate()) --計算欄位(可有可無 因為可以用select出來算)
)
go


create table Courses(
	CourId nchar(5) primary key,
	CourName nvarchar(30) not null,
	CourCredit tinyint not null
)
go

create table Employee(
	ID nchar(10) primary key,
	EmpName nvarchar(30) not null,
	City nvarchar(5) not null,
	Street nvarchar(50) not null,
	EmpTel nvarchar(20) not null,
	EmpSalary money default 28000, --有預設值的欄位
	Insurance money not null,
	Tax as EmpSalary*0.05, --計算欄位
)
go

create table Professors(
	ProfessorID nchar(4) primary key,
	JobTitle nvarchar(10) not null,
	Department nvarchar(10) not null,
	ID nchar(10) not null
)
go


--SQL
--DML

create database dbTest
go

use dbTest
go

create database School
go�@--�妸���� ���Ǩ��Ʈw�إߪ��� �A���U�h����

use School
go
----------------------------------------------
create table Students(
	StuId nchar(4) primary key,
	StuName nvarchar(30) not null,
	StuGender bit not null,
	StuTel nvarchar(20),
	StuBirthday datetime not null,
	StuAge as datediff(year,StuBirthday,getdate()) --�p�����(�i���i�L �]���i�H��select�X�Ӻ�)
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
	EmpSalary money default 28000, --���w�]�Ȫ����
	Insurance money not null,
	Tax as EmpSalary*0.05, --�p�����
)
go

create table Professors(
	ProfessorID nchar(4) primary key,
	JobTitle nvarchar(10) not null,
	Department nvarchar(10) not null,
	ID nchar(10) not null
)
go


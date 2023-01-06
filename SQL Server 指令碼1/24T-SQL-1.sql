--T-SQL

print 'Hello World'

select 'Hello World'
--------------------------
--變數
--1.純量變數  2.資料表變數
--純量變數 

declare @myName nvarchar(50) = 'Jack'
print @myName
select @myName

declare @number int
set @number=100
select @myName='Jack Lee'
print @number
print @myName
print @nUmBer
--------------------------------------
declare @salary money=50000
print '您的薪水是:'+ cast(@salary as varchar)

declare @birthday datetime ='2022/12/19'
print '您的生日為:'+ convert(varchar,@birthday,120)

select @birthday=生日
from 學生
where 學號='S002'

print '您的生日為:'+ convert(varchar,@birthday,120)

--------------------------------------------------

--資料表變數
declare @StuBirthday table(
	name nvarchar(30),
	birthday datetime
)

insert into @StuBirthday
values('任我行','2022-12-19')


insert into @StuBirthday
select 姓名,生日
from 學生

select * from @StuBirthday

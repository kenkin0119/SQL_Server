--T-SQL

print 'Hello World'

select 'Hello World'
--------------------------
--�ܼ�
--1.�¶q�ܼ�  2.��ƪ��ܼ�
--�¶q�ܼ� 

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
print '�z���~���O:'+ cast(@salary as varchar)

declare @birthday datetime ='2022/12/19'
print '�z���ͤ鬰:'+ convert(varchar,@birthday,120)

select @birthday=�ͤ�
from �ǥ�
where �Ǹ�='S002'

print '�z���ͤ鬰:'+ convert(varchar,@birthday,120)

--------------------------------------------------

--��ƪ��ܼ�
declare @StuBirthday table(
	name nvarchar(30),
	birthday datetime
)

insert into @StuBirthday
values('���ڦ�','2022-12-19')


insert into @StuBirthday
select �m�W,�ͤ�
from �ǥ�

select * from @StuBirthday

--���(function)
--�¶q�Ȩ��(�禡)

--��J���u�������Ҧr���d���~��
create function fnGetSalary(@id char(10))
	returns money
begin
	declare @salary money
	select @salary=�~��
	from ���u
	where �����Ҧr��=@id

	if @salary is null
		return 0

	return @salary

end
-----------------------------------------
go

declare @Salary money

set @Salary= dbo.fnGetSalary('A123456789')

if @Salary=0
	print '�d�L���H�~��'
else
	print '�~�ꬰ'+cast(@salary as varchar)



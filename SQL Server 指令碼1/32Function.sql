--函數(function)
--純量值函數(函式)

--輸入員工的身份證字號查詢薪水
create function fnGetSalary(@id char(10))
	returns money
begin
	declare @salary money
	select @salary=薪水
	from 員工
	where 身份證字號=@id

	if @salary is null
		return 0

	return @salary

end
-----------------------------------------
go

declare @Salary money

set @Salary= dbo.fnGetSalary('A123456789')

if @Salary=0
	print '查無此人薪資'
else
	print '薪資為'+cast(@salary as varchar)



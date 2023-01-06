create proc Sum_for_Products_Salse_Pivot
	@year varchar(4)
as
begin

declare @sql nvarchar(max)
declare @a nvarchar(max)
declare @b nvarchar(max)

select @a=isnull(@a+',isnull(r.['+cast(MONTH(OrderDate)as nvarchar)+'],0) as['+cast(MONTH(OrderDate)as nvarchar)+'月]',',isnull(r.['+cast(MONTH(OrderDate)as nvarchar)+'],0)as['+cast(MONTH(OrderDate)as nvarchar)+'月]')
from Orders
group by MONTH(OrderDate)
order by MONTH(OrderDate)

select @b=isnull(@b+',['+cast(MONTH(OrderDate)as nvarchar)+']','['+cast(MONTH(OrderDate)as nvarchar)+']')
from Orders
group by MONTH(OrderDate)
order by MONTH(OrderDate)

set @sql='select r.產品名稱 '+@a+'
	from
	(select  p.ProductID ,p.ProductName as 產品名稱 ,MONTH(o.OrderDate) as Mon ,ROUND(sum(od.UnitPrice*od.Quantity*(1-od.Discount)),0) as e
	from OrderDetails as od 
	inner join Products as p on od.ProductID=p.ProductID
	inner join Orders as o on od.OrderID=o.OrderID
	where YEAR(o.OrderDate)='+@year+' 
	group by p.ProductID ,p.ProductName ,MONTH(o.OrderDate))as t
	pivot(
		max(t.e)
		for t.Mon in('+@b+')
	)as r
	order by ProductID'
exec(@sql)

end
go
-------------------------------------------------------------------
use Northwind
exec Sum_for_Products_Salse_Pivot @year=1997
go



-------------------------------------------------------------------
use HW3
create table 訂單(
	訂單編號 varchar(12) primary key
)
go
-----------------------------
create function getOrderID()
	returns varchar(12)
begin
	declare @id varchar(12) ,@newId char(12)  ,@tmpId varchar(4) ,@len tinyint
	,@datetime varchar(8)
	select top 1 @id=訂單編號
	from 訂單
	order by 訂單編號 desc

	set @datetime=Convert(varchar(8),Getdate(),112)

	if(@id is null)
	begin
		set @newId=@datetime+'0001'
	end
	else
	begin
		set @len=len(cast(substring(@id,9,4)+1as varchar))

		set @tmpId=
			case
				when @len=1 then '000'
				when @len=2 then '00'
				when @len=3 then '0'
				else ''
			end

		set @newId =@datetime + @tmpId + cast(substring(@id,9,4)+1 as varchar)
	end

	return @newId

end
go
--------------------------------------------------------------------------
insert into 訂單
values(dbo.getOrderID())
go

select * from 訂單

delete 訂單

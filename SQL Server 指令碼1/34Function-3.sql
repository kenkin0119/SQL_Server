create function getStuID()
	returns char(4)
begin

	declare @id char(4),@newId char(4),@tmpId varchar(4),@len tinyint
	select top 1 @id=學號 from 學生
	order by 學號 desc

	set @len= len(cast((substring(@id,2,3)+1) as varchar))

	set @tmpId=
		case
			when @len=2 then 'S0'
			when @len=1 then 'S00'
			else 'S'
		end

	set @newId = @tmpId + cast((substring(@id,2,3)+1) as varchar)
	
	--print @newId


	return @newId

end

-------------------

insert into 學生(學號,生日,電話,姓名,性別)
values(dbo.getStuID(),'1999-9-9','07-7777777','東方不敗','男')

create function getStuID()
	returns char(4)
begin

	declare @id char(4),@newId char(4),@tmpId varchar(4),@len tinyint
	select top 1 @id=�Ǹ� from �ǥ�
	order by �Ǹ� desc

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

insert into �ǥ�(�Ǹ�,�ͤ�,�q��,�m�W,�ʧO)
values(dbo.getStuID(),'1999-9-9','07-7777777','�F�褣��','�k')

--基本呈現
select *
from 
(select s.姓名+'('+c.學號+')' as 學號姓名,c.課程編號,c.教室
from 班級 as c inner join 學生 as s
on c.學號=s.學號
) as t
pivot(
	max(教室)
	for 課程編號 in ([CS101],[CS213],[CS349],[CS121],[CS203],[CS205],[CS222],[CS111])
) as r;


--進化版
select r.學號姓名
,isnull(r.[CS101],'---') as CS101
,isnull(r.[CS213],'---') as CS213
,isnull(r.[CS349],'---') as CS349
,isnull(r.[CS121],'---') as CS121
,isnull(r.[CS203],'---') as CS203
,isnull(r.[CS222],'---') as CS222
,isnull(r.[CS111],'---') as CS111
from 
(select s.姓名+'('+c.學號+')' as 學號姓名,c.課程編號,c.教室
from 班級 as c inner join 學生 as s
on c.學號=s.學號
) as t
pivot(
	max(教室)
	for 課程編號 in ([CS101],[CS213],[CS349],[CS121],[CS203],[CS222],[CS111])
) as r;


--再進化版
declare @select_colums nvarchar(max)
declare @Sql nvarchar(max)

select @select_colums = isnull(@select_colums+',['+課程編號+']','['+課程編號+']')
from 課程
print @select_colums

set @Sql='select r.姓名,'+ @select_colums+
' from 
(select s.姓名,c.課程編號,c.教室
from 班級 as c inner join 學生 as s
on c.學號=s.學號
) as t
pivot(
	max(教室)
	for 課程編號 in ('+@select_colums+')
) as r'


exec(@Sql)



--把程式碼建立成預存程序
create proc getCoursePivot
as
begin
	declare @select_colums nvarchar(max)
	declare @Sql nvarchar(max)
	declare @a nvarchar(max)

	select @a = isnull(@a+',isnull(r.'+課程編號+',''---'') as '+課程編號,',isnull(r.'+課程編號+',''---'') as '+課程編號)
	from 課程
	print @a

	select @select_colums = isnull(@select_colums+',['+課程編號+']','['+課程編號+']')
	from 課程
	print @select_colums

	set @Sql='select r.姓名學號'+ @a+
	' from 
	(select s.姓名+''(''+c.學號+'')'' as 姓名學號 ,c.課程編號,c.教室
	from 班級 as c inner join 學生 as s
	on c.學號=s.學號
	) as t
	pivot(
		max(教室)
		for 課程編號 in ('+@select_colums+')
	) as r'


	exec(@Sql)

end

--------------------------

exec getCoursePivot
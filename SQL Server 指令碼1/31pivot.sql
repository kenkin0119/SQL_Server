--�򥻧e�{
select *
from 
(select s.�m�W+'('+c.�Ǹ�+')' as �Ǹ��m�W,c.�ҵ{�s��,c.�Ы�
from �Z�� as c inner join �ǥ� as s
on c.�Ǹ�=s.�Ǹ�
) as t
pivot(
	max(�Ы�)
	for �ҵ{�s�� in ([CS101],[CS213],[CS349],[CS121],[CS203],[CS205],[CS222],[CS111])
) as r;


--�i�ƪ�
select r.�Ǹ��m�W
,isnull(r.[CS101],'---') as CS101
,isnull(r.[CS213],'---') as CS213
,isnull(r.[CS349],'---') as CS349
,isnull(r.[CS121],'---') as CS121
,isnull(r.[CS203],'---') as CS203
,isnull(r.[CS222],'---') as CS222
,isnull(r.[CS111],'---') as CS111
from 
(select s.�m�W+'('+c.�Ǹ�+')' as �Ǹ��m�W,c.�ҵ{�s��,c.�Ы�
from �Z�� as c inner join �ǥ� as s
on c.�Ǹ�=s.�Ǹ�
) as t
pivot(
	max(�Ы�)
	for �ҵ{�s�� in ([CS101],[CS213],[CS349],[CS121],[CS203],[CS222],[CS111])
) as r;


--�A�i�ƪ�
declare @select_colums nvarchar(max)
declare @Sql nvarchar(max)

select @select_colums = isnull(@select_colums+',['+�ҵ{�s��+']','['+�ҵ{�s��+']')
from �ҵ{
print @select_colums

set @Sql='select r.�m�W,'+ @select_colums+
' from 
(select s.�m�W,c.�ҵ{�s��,c.�Ы�
from �Z�� as c inner join �ǥ� as s
on c.�Ǹ�=s.�Ǹ�
) as t
pivot(
	max(�Ы�)
	for �ҵ{�s�� in ('+@select_colums+')
) as r'


exec(@Sql)



--��{���X�إߦ��w�s�{��
create proc getCoursePivot
as
begin
	declare @select_colums nvarchar(max)
	declare @Sql nvarchar(max)
	declare @a nvarchar(max)

	select @a = isnull(@a+',isnull(r.'+�ҵ{�s��+',''---'') as '+�ҵ{�s��,',isnull(r.'+�ҵ{�s��+',''---'') as '+�ҵ{�s��)
	from �ҵ{
	print @a

	select @select_colums = isnull(@select_colums+',['+�ҵ{�s��+']','['+�ҵ{�s��+']')
	from �ҵ{
	print @select_colums

	set @Sql='select r.�m�W�Ǹ�'+ @a+
	' from 
	(select s.�m�W+''(''+c.�Ǹ�+'')'' as �m�W�Ǹ� ,c.�ҵ{�s��,c.�Ы�
	from �Z�� as c inner join �ǥ� as s
	on c.�Ǹ�=s.�Ǹ�
	) as t
	pivot(
		max(�Ы�)
		for �ҵ{�s�� in ('+@select_colums+')
	) as r'


	exec(@Sql)

end

--------------------------

exec getCoursePivot
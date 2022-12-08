--offset...fetch next
--order by子句
select * from 員工
order by 身份證字號
offset 3 rows --1~3不顯示

select * from 員工
order by 身份證字號
offset 3 rows
fetch next 2 rows only --1~3不顯示 只顯示4~5

--和Top3一樣
select * from 員工
order by 身份證字號
offset 0 rows
fetch next 3 rows only

select Top 3 * from 員工
order by 身份證字號

------------------------------------------------------
--isnull
select 身份證字號,姓名,isnull(電話,'未填寫')as 電話
from 員工
--轉換成字串才能從null改成未填寫
select 學號,姓名,性別,電話,isnull(cast(生日 as nvarchar),'未填寫') 
from 學生
--convert(資料型態,格子,輸出格式)
select 學號,姓名,性別,電話,isnull(convert(nvarchar,生日,120),'未填寫')
from 學生
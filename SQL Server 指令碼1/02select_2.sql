--子句
--distinct(移除重複資料)

select distinct 學分
from 課程

--top
select top 3 *
from 學生

select top 20 percent *
from 學生


--名次
select  *
from 課程
order by 學分 desc

select top 4 with ties *  --避免同值(4~7都是3 選到4就都選)
from 課程
order by 學分 desc        --遞減排序
--集合運算
--聯集
select 姓名 from 員工
union
select 姓名 from 學生

--交集
select 姓名 from 員工
intersect
select 姓名 from 學生

--差集
--員工差集學生 是員工不是學生
select 姓名 from 員工
except
select 姓名 from 學生
--學生差集員工 是學生不是員工
select 姓名 from 學生
except
select 姓名 from 員工
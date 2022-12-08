--聚合函數
select COUNT(*)
from 學生

select COUNT(生日)
from 學生

--------------------------------
select sum(薪水)
from 員工

select avg(薪水)
from 員工

select max(薪水)
from 員工

select min(薪水)
from 員工

select sum(薪水)as 薪水總額,avg(薪水)as 平均薪資
,max(薪水)as 最高薪資,min(薪水)as 最低薪資
,COUNT(*)as 員工人數
from 員工
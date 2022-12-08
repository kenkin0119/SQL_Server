select COUNT(*) as 人數
from 學生

select COUNT(*) as 人數
from 學生
group by 性別
--------------------------
---group by
select 學分
from 課程

select distinct 學分 --移除重複值
from 課程

select 學分          --相同的分一群
from 課程
group by 學分
----------------------
select 性別,COUNT(*) as 人數 --性別資料8筆 人數1筆 所以要加group by
from 學生
group by 性別
-----------------------
select *
from 班級

-----------------------
--統計每位學生各選幾門課
select 學號,count(*)as 選課數量
from 班級
group by 學號

-------------------------
--統計每一門課程有多少學生
select 教授編號,課程編號,count(*) as 選課人數
from 班級
group by 教授編號,課程編號

-------------------------

select 教授編號,課程編號,count(*) as 選課人數
from 班級
group by 教授編號,課程編號
having count(*)<=3
order by 選課人數 desc


-------------------------
--撰寫順序
--select
--from
--where
--group by
--having   功能和where一樣而且能用函數作條件 限制:有group by才能用
--order by

--執行順序
--1.from
--2.where
--3.group by
--4.having
--5.select  別名在select才有 所以不能拿來當篩選條件 但order可以用
--6.order by
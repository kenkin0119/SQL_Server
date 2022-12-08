--update
update 課程
set 名稱='計算機概論'
where 課程編號='CS101'

update 課程
set 名稱='互動式網頁設計',學分='4'
where 課程編號='CS205'
--------------------------------------------------------
--若該課程選課人數>=3,將課程學分數改成30
update 課程
set 學分='30'
where 課程編號 in (select 課程編號
from 班級
group by 課程編號
having count(*)>=3)

update 課程
set 學分='30'
where exists (select 課程編號,count(*) from 班級
where 課程.課程編號=班級.課程編號
group by 課程編號
having count(*)>=3)


--把有被選的課程,學分數改100
update 課程
set 學分=100
from 班級 as c inner join 課程 as co
on c.課程編號=co.課程編號

select * from 課程
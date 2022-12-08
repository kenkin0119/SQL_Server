--合併查詢（資料表.欄位）
select　班級.學號,學生.姓名,班級.課程編號,課程.名稱,課程.學分
,學生.性別,班級.上課時間,班級.教室,班級.教授編號,教授.身份證字號
,教授.科系,教授.職稱,員工.姓名
from 班級 
inner join 學生 on 班級.學號=學生.學號 --on拉關聯
inner join 課程 on 班級.課程編號=課程.課程編號
inner join 教授 on 班級.教授編號=教授.教授編號
inner join 員工 on 教授.身份證字號=員工.身份證字號

--別名
select　c.學號,s.姓名,c.課程編號,co.名稱,co.學分
,s.性別,c.上課時間,c.教室,c.教授編號,p.身份證字號
,p.科系,p.職稱,e.姓名
from 班級 as c
inner join 學生 as s on c.學號=s.學號 --on拉關聯
inner join 課程 as co on c.課程編號=co.課程編號
inner join 教授 as p on c.教授編號=p.教授編號
inner join 員工 as e on p.身份證字號=e.身份證字號

select c.學號,s.姓名,COUNT(*) as 選課數
from 班級 as c
inner join 學生 as s on c.學號=s.學號
group by c.學號,s.姓名

-------------------------------------------------
--inner join第二種寫法

select c.學號,s.姓名,c.課程編號,co.名稱,co.學分
,s.性別,c.上課時間,c.教室,c.教授編號,p.身份證字號
,p.科系,p.職稱,e.姓名
from 員工 as e inner join 
(教授 as p inner join
(課程 as co inner join 
(班級 as c inner join 學生 as s on c.學號=s.學號) 
on co.課程編號=c.課程編號) 
on p.教授編號=c.教授編號) 
on e.身份證字號=p.身份證字號

------------------------------------------------------
--第三種寫法(自然合併法)

select c.學號,s.姓名,c.課程編號,co.名稱,s.性別,c.上課時間,c.教室,
c.教授編號,p.科系, p.職稱,e.姓名,e.薪水
from 班級 as c,學生 as s,課程 as co,教授 as p,員工 as e
where c.學號=s.學號 and c.課程編號=co.課程編號 and c.教授編號=p.教授編號 and e.身份證字號=p.身份證字號


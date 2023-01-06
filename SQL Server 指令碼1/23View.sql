--檢視表(View)
use 教務系統
go
----------------
create view view學生選課明細
as
select 班級.學號,學生.姓名 as 學生姓名,班級.課程編號,課程.名稱,學生.性別,班級.上課時間,班級.教室,
班級.教授編號,教授.科系, 教授.職稱,員工.姓名 as 老師姓名,員工.薪水
from 班級 
inner join 學生 on 班級.學號=學生.學號
inner join 課程 on 班級.課程編號=課程.課程編號
inner join 教授 on 班級.教授編號=教授.教授編號
inner join 員工 on 教授.身份證字號=員工.身份證字號
------------------------------------------------------

select * 
from view學生選課明細
where 性別='男'



SELECT          學生.學號, 員工.姓名, 課程.課程編號, 課程.名稱, 班級.上課時間, 教授.職稱
FROM              員工 INNER JOIN
                            教授 ON 員工.身份證字號 = 教授.身份證字號 INNER JOIN
                            班級 ON 教授.教授編號 = 班級.教授編號 INNER JOIN
                            課程 ON 班級.課程編號 = 課程.課程編號 INNER JOIN
                            學生 ON 班級.學號 = 學生.學號
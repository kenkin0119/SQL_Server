--insert into(按括號內順序給值)

insert into 學生(學號,生日,電話,姓名,性別)
values('S010','1999-9-9','07-8888888','東方不敗','男')

insert into 學生(學號,姓名,性別)
values('S009','林平之','男')

insert into 學生(學號,生日,電話,姓名,性別)
values('S011','','07-99999999','岳不群','男')　--空值和null資料型態不一樣　
                                               --null:沒有填過值or填了null            
insert into 學生(學號,生日,電話,姓名,性別)     --空值:填入空值(原點)ex:時間:1900-01-01 00:00:00.000
values('S012','2002-2-2','','令狐沖','男')

select * from 學生 where 電話=''
select * from 學生 where 電話 is null　--查到結果不同
---------------------------------------------------------------------------------------
--省略欄位(按資料表順序給值)
insert into 學生
values('S013','任我行','男','','2022-2-2')

insert into 學生
values('S014','任我行','男','08-9999999',null)

insert into 學生
values('S801','任我行','男','08-9999999',null),
('S802','任我行','男','08-9999999',null),
('S803','任我行','男','08-9999999',null),
('S804','任我行','男','08-9999999',null),
('S805','任我行','男','08-9999999',null),
('S806','任我行','男','08-9999999',null),
('S807','任我行','男','08-9999999',null)

------------------------------------------------------------------------------
--------insert/select
--select..A..into..B..(選取A新增至B資料表 !!B需為新資料表　資料型態會複製過去但主索引鍵不會)
select *
into 學生2
from 學生


--insert..A..select..B..(選取B存到A !!資料型態.格數必須一致)
insert into 學生2
select * from 學生　--同values功用
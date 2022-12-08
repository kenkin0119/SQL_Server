--merge
--看條件決定要做新增,修改或刪除
--比對客戶資料表與新客戶資料表
--若已存在則修改資料,若是新客戶則新增資料

--用新客戶併到客戶
merge 客戶 as c
using 新客戶 as nc
on c.客戶編號=nc.客戶編號
when matched then　--同where 若主鍵match到 則...
	update set 姓名=nc.姓名,電話=nc.電話
when not matched then
	insert (客戶編號,姓名,電話) values(nc.客戶編號,nc.姓名,nc.電話)--沒有into因為目標資料表有寫了
; --代表merge結束



--若原業績目標>=250,刪除該客戶業績目標
--若原業績目標<250,該客戶業績目標+25
--尚未有業績目標的客戶,該客戶業績目標設為100
merge 客戶業績 as cs
using 客戶 as c
on cs.客戶編號=c.客戶編號
when matched and cs.業績目標>=250 then  --先刪除再修改 避免加完超過250而誤刪
	delete
when matched then
	update set 業績目標=cs.業績目標+25

when not matched then
	insert(客戶編號,業績目標) values(c.客戶編號,100);

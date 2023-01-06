--系統變數

--計算某學生選了幾門課
declare @n int

select @n=count(*)
from 班級
where 學號='S002'

print '您總共選了'+ cast(@n as varchar) +'門課'


select *
from 班級
where 學號='S001'

print '您總共選了'+ cast(@@rowcount as varchar) +'門課'
print @@error
print error_message()
go
-----------------------------------------------------
--例外處理
begin try
	print 100/0
end try
begin catch
	--select @@ERROR as 訊息代碼,ERROR_MESSAGE() as 訊息內容
	print '伺服器忙碌中請稍後再試...'
end catch

--------------------------


begin try
	print 100/0
end try
begin catch

		if @@ERROR=8134
			print '您真愛開玩笑啊'
		else if @@ERROR=807
			print '哩麥亂啊啦!!'
		else
		    print '伺服器忙碌中....'

end catch
----------------

--你寫了一段程式
select * from 學生

--這裡有第二段程式,但是這段程式必須要第一段程式有資料才能再執行
if @@ROWCOUNT>0
begin
	
	select * from 班級
end






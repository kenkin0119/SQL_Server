--�t���ܼ�

--�p��Y�ǥͿ�F�X����
declare @n int

select @n=count(*)
from �Z��
where �Ǹ�='S002'

print '�z�`�@��F'+ cast(@n as varchar) +'����'


select *
from �Z��
where �Ǹ�='S001'

print '�z�`�@��F'+ cast(@@rowcount as varchar) +'����'
print @@error
print error_message()
go
-----------------------------------------------------
--�ҥ~�B�z
begin try
	print 100/0
end try
begin catch
	--select @@ERROR as �T���N�X,ERROR_MESSAGE() as �T�����e
	print '���A�����L���еy��A��...'
end catch

--------------------------


begin try
	print 100/0
end try
begin catch

		if @@ERROR=8134
			print '�z�u�R�}������'
		else if @@ERROR=807
			print '�����ðڰ�!!'
		else
		    print '���A�����L��....'

end catch
----------------

--�A�g�F�@�q�{��
select * from �ǥ�

--�o�̦��ĤG�q�{��,���O�o�q�{�������n�Ĥ@�q�{������Ƥ~��A����
if @@ROWCOUNT>0
begin
	
	select * from �Z��
end






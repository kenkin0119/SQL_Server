--offset...fetch next
--order by�l�y
select * from ���u
order by �����Ҧr��
offset 3 rows --1~3�����

select * from ���u
order by �����Ҧr��
offset 3 rows
fetch next 2 rows only --1~3����� �u���4~5

--�MTop3�@��
select * from ���u
order by �����Ҧr��
offset 0 rows
fetch next 3 rows only

select Top 3 * from ���u
order by �����Ҧr��

------------------------------------------------------
--isnull
select �����Ҧr��,�m�W,isnull(�q��,'����g')as �q��
from ���u
--�ഫ���r��~��qnull�令����g
select �Ǹ�,�m�W,�ʧO,�q��,isnull(cast(�ͤ� as nvarchar),'����g') 
from �ǥ�
--convert(��ƫ��A,��l,��X�榡)
select �Ǹ�,�m�W,�ʧO,�q��,isnull(convert(nvarchar,�ͤ�,120),'����g')
from �ǥ�
--�~���X�֬d��(outer join)
select* from ���u
select* from �б�

select *
from ���u inner join �б�
on ���u.�����Ҧr��=�б�.�����Ҧr��

--�C�X���ǭ��u���O�б�
select�@���u.*
from ���u left outer join �б�  --���䬰�D��ƪ�(�D��ƪ������� �S���k�䪺���N�s��null)
on ���u.�����Ҧr��=�б�.�����Ҧr��
where �б�.�б½s�� is null

select *
from �б� left outer join ���u  --�Minner join�@�� �]�����u�����]�t�б�
on ���u.�����Ҧr��=�б�.�����Ҧr��

--------------------------------------------------------------
----��X�Ҧ��|����Ҫ��ǥ͸��
select* from �ǥ�
select* from �Z�š@order by �Ǹ�

select �ǥ�.*
from �ǥ� left outer join �Z��
on �ǥ�.�Ǹ�=�Z��.�Ǹ�
where �Z��.�ҵ{�s�� is null
--------------------------------------------------
----��X�Ҧ��|���Q�諸�ҵ{���
select* from �ҵ{
select* from �Z�š@order by �ҵ{�s��

select �ҵ{.*
from �ҵ{ left outer join �Z��
on �ҵ{.�ҵ{�s��=�Z��.�ҵ{�s��
where �Z��.�ҵ{�s�� is null

--------------------------------------------------
----��X�Ҧ��|���Q�諸�б¸��
select* from �б¡@
select* from �Z�š@order by �б½s��

select *
from �Z�� right  join �б�
on �Z��.�б½s��=�б�.�б½s��
where �Z��.�б½s�� is null

---------------------------------------------------
--full join
select *
from �Z�� full join �ǥ� --�ⰼ���C�X��
on �Z��.�Ǹ�=�ǥ�.�Ǹ�

--cross join
select *
from �Z�� cross join �ǥ� --�ⰼ��ƼƬۭ�
--on �Z��.�Ǹ�=�ǥ�.�Ǹ� 

--------------------------------------------------
--isnull():�B�znull�Ȫ����
select * from ���u


select �����Ҧr��,�m�W,����,��D,isnull(�q��,'�|����g') as �q��,�~��,�O�I,���| 
from ���u
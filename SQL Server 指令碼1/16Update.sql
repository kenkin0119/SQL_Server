--update
update �ҵ{
set �W��='�p�������'
where �ҵ{�s��='CS101'

update �ҵ{
set �W��='���ʦ������]�p',�Ǥ�='4'
where �ҵ{�s��='CS205'
--------------------------------------------------------
--�Y�ӽҵ{��ҤH��>=3,�N�ҵ{�Ǥ��Ƨ令30
update �ҵ{
set �Ǥ�='30'
where �ҵ{�s�� in (select �ҵ{�s��
from �Z��
group by �ҵ{�s��
having count(*)>=3)

update �ҵ{
set �Ǥ�='30'
where exists (select �ҵ{�s��,count(*) from �Z��
where �ҵ{.�ҵ{�s��=�Z��.�ҵ{�s��
group by �ҵ{�s��
having count(*)>=3)


--�⦳�Q�諸�ҵ{,�Ǥ��Ƨ�100
update �ҵ{
set �Ǥ�=100
from �Z�� as c inner join �ҵ{ as co
on c.�ҵ{�s��=co.�ҵ{�s��

select * from �ҵ{
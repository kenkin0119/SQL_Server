--�˵���(View)
use �аȨt��
go
----------------
create view view�ǥͿ�ҩ���
as
select �Z��.�Ǹ�,�ǥ�.�m�W as �ǥͩm�W,�Z��.�ҵ{�s��,�ҵ{.�W��,�ǥ�.�ʧO,�Z��.�W�Үɶ�,�Z��.�Ы�,
�Z��.�б½s��,�б�.��t, �б�.¾��,���u.�m�W as �Ѯv�m�W,���u.�~��
from �Z�� 
inner join �ǥ� on �Z��.�Ǹ�=�ǥ�.�Ǹ�
inner join �ҵ{ on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
inner join �б� on �Z��.�б½s��=�б�.�б½s��
inner join ���u on �б�.�����Ҧr��=���u.�����Ҧr��
------------------------------------------------------

select * 
from view�ǥͿ�ҩ���
where �ʧO='�k'



SELECT          �ǥ�.�Ǹ�, ���u.�m�W, �ҵ{.�ҵ{�s��, �ҵ{.�W��, �Z��.�W�Үɶ�, �б�.¾��
FROM              ���u INNER JOIN
                            �б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
                            �Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
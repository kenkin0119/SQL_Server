--�X�֬d�ߡ]��ƪ�.���^
select�@�Z��.�Ǹ�,�ǥ�.�m�W,�Z��.�ҵ{�s��,�ҵ{.�W��,�ҵ{.�Ǥ�
,�ǥ�.�ʧO,�Z��.�W�Үɶ�,�Z��.�Ы�,�Z��.�б½s��,�б�.�����Ҧr��
,�б�.��t,�б�.¾��,���u.�m�W
from �Z�� 
inner join �ǥ� on �Z��.�Ǹ�=�ǥ�.�Ǹ� --on�����p
inner join �ҵ{ on �Z��.�ҵ{�s��=�ҵ{.�ҵ{�s��
inner join �б� on �Z��.�б½s��=�б�.�б½s��
inner join ���u on �б�.�����Ҧr��=���u.�����Ҧr��

--�O�W
select�@c.�Ǹ�,s.�m�W,c.�ҵ{�s��,co.�W��,co.�Ǥ�
,s.�ʧO,c.�W�Үɶ�,c.�Ы�,c.�б½s��,p.�����Ҧr��
,p.��t,p.¾��,e.�m�W
from �Z�� as c
inner join �ǥ� as s on c.�Ǹ�=s.�Ǹ� --on�����p
inner join �ҵ{ as co on c.�ҵ{�s��=co.�ҵ{�s��
inner join �б� as p on c.�б½s��=p.�б½s��
inner join ���u as e on p.�����Ҧr��=e.�����Ҧr��

select c.�Ǹ�,s.�m�W,COUNT(*) as ��Ҽ�
from �Z�� as c
inner join �ǥ� as s on c.�Ǹ�=s.�Ǹ�
group by c.�Ǹ�,s.�m�W

-------------------------------------------------
--inner join�ĤG�ؼg�k

select c.�Ǹ�,s.�m�W,c.�ҵ{�s��,co.�W��,co.�Ǥ�
,s.�ʧO,c.�W�Үɶ�,c.�Ы�,c.�б½s��,p.�����Ҧr��
,p.��t,p.¾��,e.�m�W
from ���u as e inner join 
(�б� as p inner join
(�ҵ{ as co inner join 
(�Z�� as c inner join �ǥ� as s on c.�Ǹ�=s.�Ǹ�) 
on co.�ҵ{�s��=c.�ҵ{�s��) 
on p.�б½s��=c.�б½s��) 
on e.�����Ҧr��=p.�����Ҧr��

------------------------------------------------------
--�ĤT�ؼg�k(�۵M�X�֪k)

select c.�Ǹ�,s.�m�W,c.�ҵ{�s��,co.�W��,s.�ʧO,c.�W�Үɶ�,c.�Ы�,
c.�б½s��,p.��t, p.¾��,e.�m�W,e.�~��
from �Z�� as c,�ǥ� as s,�ҵ{ as co,�б� as p,���u as e
where c.�Ǹ�=s.�Ǹ� and c.�ҵ{�s��=co.�ҵ{�s�� and c.�б½s��=p.�б½s�� and e.�����Ҧr��=p.�����Ҧr��


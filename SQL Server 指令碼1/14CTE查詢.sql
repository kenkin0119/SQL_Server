--CTE(common table expression)

with test
as(
	select p.*,e.�m�W,e.�~��
	from ���u as e inner join �б� as p
	on e.�����Ҧr��=p.�����Ҧr��
)

select * from test

----------------------------------------------------------
--Recursive(���j)
with �D�޶��h
as(
	select ���u�r��,�m�W,1 as ���h from �D�� where �D�ަr�� is null
	union all --�W�U�X��
	select �D��.���u�r��,�D��.�m�W,���h+1 as ���h
	from �D�� inner join �D�޶��h on �D��.�D�ަr��=�D�޶��h.���u�r��
)

select * from �D�޶��h
---�֪��D�ަr��='A123456789',�L�̴N�O��2��
---���'A222222222','E444006666'

--�֪��D�ަr��='A222222222'��'E444006666',�L�̴N�O�ĤT��
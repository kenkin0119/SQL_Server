--�w�s�{��Stored Procedure
--�N�q:�w���g�n���@�q�{��,���ݭn�ɦA�I�s�ϥ�,�D�`�������
create  Proc StudentCourseOrders
as
begin
	SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.�W��, �ҵ{.�Ǥ�, �Z��.�W�Үɶ�, �Z��.�Ы�, ���u.�m�W AS �Ѯv
	FROM              ���u INNER JOIN
								�б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
								�Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
								�ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
								�ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
end

--------------------------------------------

exec StudentCourseOrders

--------------------------------------------

create  Proc StudentCourse
as
begin

	SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W,count(*) as ��Ҽ�,sum(�ҵ{.�Ǥ�) as �`�Ǥ���
	FROM              ���u INNER JOIN
								�б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
								�Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
								�ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
								�ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
							group by �ǥ�.�Ǹ�, �ǥ�.�m�W
end

-----------------------------------
exec StudentCourse

----------------------------------
--���Ѽƪ��w�s�{��
create  Proc queryStudentCourse
	@name varchar(12)

as
begin

	SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W,count(*) as ��Ҽ�,sum(�ҵ{.�Ǥ�) as �`�Ǥ���
	FROM              ���u INNER JOIN
								�б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
								�Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
								�ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
								�ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
							where �ǥ�.�m�W=@name
							group by �ǥ�.�Ǹ�, �ǥ�.�m�W
end
------------------------
exec queryStudentCourse '�O���R'





--��ƪ�Ȩ��--
create function fnGetStudentCourse()
	returns table

return(

SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.�W��, �ҵ{.�Ǥ�, �Z��.�б½s��, ���u.�m�W AS Expr1
FROM              ���u INNER JOIN
                            �б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
                            �Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
		)
-----------------------------
--������
select *
from dbo.fnGetStudentCourse()

--------------------------------
--��J�Ǹ��i�d�߬Y��ǥͪ���ҵ��G
create function fnGetStudentCourseResult(@id char(4))
	returns table

return(

SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.�W��, �ҵ{.�Ǥ�, �Z��.�б½s��, ���u.�m�W AS Expr1
FROM              ���u INNER JOIN
                            �б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
                            �Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
					where �ǥ�.�Ǹ�=@id
		)
-----------------------------
--������
select *
from dbo.fnGetStudentCourseResult('S002')


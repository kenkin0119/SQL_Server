select*
from OrderDetails

--�C�ذӫ~�Q�R�L�X��
select ProductID,COUNT(*)
from OrderDetails
group by ProductID

select*,UnitPrice*Quantity*(1-Discount)�@as �p�p
from OrderDetails

select OrderID,COUNT(*) as �ӫ~�ؼ�
from OrderDetails
group by OrderID

select*
from Orders

select *
from Products
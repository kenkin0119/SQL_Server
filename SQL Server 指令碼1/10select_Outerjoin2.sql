--�ЧQ��Northwind��Ʈw�i��d��
--1.�C�X�q���U�L�q�檺�Ȥ���
select * from Customers
select * from Orders

select Customers.*
from Customers left join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.OrderID is null

--2.�C�X�q���B�z�L�q�檺���u���
select * from Employees
select * from Orders�@order by EmployeeID

select *
from Employees left join Orders
on Employees.EmployeeID=Orders.EmployeeID
where Orders.EmployeeID is null


--3.�C�X�q���Q�ʶR���ӫ~���
select * from OrderDetails�@order by ProductID
select * from Products�@

select *
from Products left join OrderDetails
on Products.ProductID=OrderDetails.ProductID
where OrderDetails.ProductID is null

--��null�Ȫ��B�z�覡
--�έp�C��Region���X�ӫȤ�
select * from Customers�@order by Region

select isnull(Region,'empty') as Region�@,count(*) as CustomerNumber
from Customers
group by Region

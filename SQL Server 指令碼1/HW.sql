--1.	�b�i���u�j��ƪ���X�Ҧ��Ӧۭ۴������u��ơC
select *
from Employees
where�@City='London'
--2.	�b�i���u�j��ƪ���X�Ҧ��b1993�~(�t)�H���¾����ơC
select *
from Employees
where�@HireDate>='1993-01-01'
--3.	�b�i�q��j��ƪ��X�e�f��������Reims�PLander��Madrid����ơC
select *
from Orders
where ShipCity in('Reims','Lander','Madrid')
--4.	�b�i���~�j��ƪ���X�w�s�q�̦h���e6�W��ưO���C
select top 6 with ties *
from Products
order by UnitsInStock desc
--5.	��X�q�渹�X10847�@�q�ʭ��ǲ��~�]�C�X���~ID�Y�i�^�C
select ProductID
from OrderDetails
where OrderID='10847'
--6.	�b�i�q��j��ƪ���X�|�����e�f������O����ơC
select *
from Orders
where ShippedDate�@is null
--7.	�b�i�Ȥ�j��ƪ���X�~�������uMontreal�v�B�uLisboa�v�B�uLyon�v�B�uStavern�v�B�uGeneve�v�B�uBruxelles�v�B�uMadrid�v���Ȥ��ưO���C
select *
from Customers
where City in ('Montreal','Lisboa','Lyon','Stavern','Geneve','Bruxelles','Madrid')
--8.	��X�q�ʲ��~�ƶq����20~40�󪺸�ưO���C
select *
from OrderDetails
where Quantity between 20 and 40
order by Quantity  desc
--------------------------------------------------------------------------------------
--1.	�p��i���~�j��ƪ����O����2�����~��ƥ�������C
select CategoryID,avg(UnitPrice) as ���~��ƥ������
from Products
where CategoryID='2'
group by CategoryID
--2.	�b�i���~�j��ƪ���X�w�s�q�p��w���s�q�A�B�|���i����ʪ����~��ưO���C
select *
from Products
where ReorderLevel>UnitsInStock and UnitsOnOrder='0'
--3.	�b�i�q����ӡj��ƪ��X�q�椤�]�t�W�L5�ز��~����ưO���C
select OrderID,count(*) as �q�ʲ��~�ؼ�
from OrderDetails
group by OrderID
having count(*)>=5
order by count(*) desc
--4.	�b�i�q����ӡj��ƪ���ܥX�q�渹�X10263�Ҧ����~������p�p�C
select ProductID,UnitPrice*Quantity*(1-Discount)�@as �p�p
from OrderDetails 
where OrderID='10263'
--5.	�Q�Ρi���~�j��ƪ��ơA�έp�X�C�@�Ө����ӦU���ѤF�X�˲��~�C
select s.CompanyName as Supplier,count(*) as ���Ѳ��~�ƶq
from Products as p,Suppliers as s
where p.SupplierID=s.SupplierID
group by p.SupplierID,s.CompanyName
--6.	�Q�Ρi�q��j��ƪ��ơA�έp�X�C�@��Ȥ�Q�C�@����u�ҪA�Ȧ��ơC
select EmployeeID,CustomerID,count(*) as ����
from Orders
group by EmployeeID,CustomerID
--7.	�Q�Ρi�q����ӡj��ƪ��ơA�έp�X�U���ӫ~����������P�����P��ƶq�A�æC�X�����P��ƶq�j��10����ơA�B�N��ƨ̲��~�s���Ѥp��j�ƧǡC
select ProductID,avg(UnitPrice) as �������,avg(Quantity) as �����P��ƶq
from OrderDetails
group by ProductID
having avg(Quantity)>10
order by ProductID
----------------------------------------------------------------------------------
select o.OrderID as �q�渹�X,ca.CategoryName as ���~���O�W��,p.ProductName as ���~�W��
,od.UnitPrice as ���~�q�ʳ��,od.Quantity as ���~�q�ʼƶq
,Round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as ���~�����p�p
,c.CustomerID as �Ȥ�s��,c.ContactName as �Ȥ�W��,o.ShipName as ���f�H�W�r
,o.OrderDate as �q�ʤ��,o.EmployeeID as �B�z�q����u���m�W,sh.CompanyName as �f�B���q
,s.CompanyName as �����ӦW��
from OrderDetails as od,Orders as o,Categories as ca,Products as p,Customers as c
,Shippers as sh,Suppliers as s
where od.OrderID=o.OrderID and od.ProductID=p.ProductID and p.CategoryID=ca.CategoryID 
and o.CustomerID=c.CustomerID and o.ShipVia=sh.ShipperID and p.SupplierID=s.SupplierID
and o.OrderDate between '1996-07-01'and'1996-07-31'
and sh.CompanyName='United Package'
-----------------------------------------------------------------------------------
select c.CustomerID,c.ContactName,p.ProductName,sum(od.Quantity) as Quantity
from OrderDetails as od,Orders as o,Customers as c,Products as p
where od.OrderID=o.OrderID and o.CustomerID=c.CustomerID and od.ProductID=p.ProductID
and c.CustomerID='ANTON'
group by c.CustomerID,c.ContactName,p.ProductName
-----------------------------------------------------------------------------------
select * from Customers
where not exists (select CustomerID from Orders
where Customers.CustomerID=Orders.CustomerID)
-----------------------------------------------------------------------------------
select e.EmployeeID as ���u�s��,e.LastName+','+e.FirstName as �m�W,e.Title as ¾��
,e.Extension as �����������X,e.Notes as �Ƶ� from Employees as e
where EmployeeID in(select EmployeeID from Orders)
-----------------------------------------------------------------------------------
select od.ProductID,p.ProductName,s.CompanyName as Supplier,ca.CategoryName,p.QuantityPerUnit
,p.UnitPrice,p.UnitsInStock,p.ReorderLevel,p.Discontinued
from OrderDetails as od,Orders as o,Products as p,Categories as ca,Suppliers as s
where od.OrderID=o.OrderID and od.ProductID=p.ProductID and p.CategoryID=ca.CategoryID
and p.SupplierID=s.SupplierID and o.OrderDate='1998'
order by od.ProductID
---------------------------------------------------------------
select * from Products as p
where exists (select ProductID from OrderDetails as od
where exists (select OrderID from Orders as o
where o.OrderDate='1998' and p.ProductID=od.ProductID and od.OrderID=o.OrderID ))
order by p.ProductID
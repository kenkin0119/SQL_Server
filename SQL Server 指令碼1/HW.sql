--1.	在【員工】資料表中找出所有來自倫敦的員工資料。
select *
from Employees
where　City='London'
--2.	在【員工】資料表中找出所有在1993年(含)以後到職的資料。
select *
from Employees
where　HireDate>='1993-01-01'
--3.	在【訂單】資料表找出送貨的城市為Reims與Lander及Madrid的資料。
select *
from Orders
where ShipCity in('Reims','Lander','Madrid')
--4.	在【產品】資料表中找出庫存量最多的前6名資料記錄。
select top 6 with ties *
from Products
order by UnitsInStock desc
--5.	找出訂單號碼10847共訂購哪些產品（列出產品ID即可）。
select ProductID
from OrderDetails
where OrderID='10847'
--6.	在【訂單】資料表中找出尚未有送貨日期的記錄資料。
select *
from Orders
where ShippedDate　is null
--7.	在【客戶】資料表中找出居住城市為「Montreal」、「Lisboa」、「Lyon」、「Stavern」、「Geneve」、「Bruxelles」、「Madrid」的客戶資料記錄。
select *
from Customers
where City in ('Montreal','Lisboa','Lyon','Stavern','Geneve','Bruxelles','Madrid')
--8.	找出訂購產品數量介於20~40件的資料記錄。
select *
from OrderDetails
where Quantity between 20 and 40
order by Quantity  desc
--------------------------------------------------------------------------------------
--1.	計算【產品】資料表中類別號為2的產品資料平均單價。
select CategoryID,avg(UnitPrice) as 產品資料平均單價
from Products
where CategoryID='2'
group by CategoryID
--2.	在【產品】資料表中找出庫存量小於安全存量，且尚未進行採購的產品資料記錄。
select *
from Products
where ReorderLevel>UnitsInStock and UnitsOnOrder='0'
--3.	在【訂單明細】資料表找出訂單中包含超過5種產品的資料記錄。
select OrderID,count(*) as 訂購產品種數
from OrderDetails
group by OrderID
having count(*)>=5
order by count(*) desc
--4.	在【訂單明細】資料表中顯示出訂單號碼10263所有產品的價格小計。
select ProductID,UnitPrice*Quantity*(1-Discount)　as 小計
from OrderDetails 
where OrderID='10263'
--5.	利用【產品】資料表資料，統計出每一個供應商各提供了幾樣產品。
select s.CompanyName as Supplier,count(*) as 提供產品數量
from Products as p,Suppliers as s
where p.SupplierID=s.SupplierID
group by p.SupplierID,s.CompanyName
--6.	利用【訂單】資料表資料，統計出每一位客戶被每一位員工所服務次數。
select EmployeeID,CustomerID,count(*) as 次數
from Orders
group by EmployeeID,CustomerID
--7.	利用【訂單明細】資料表資料，統計出各項商品的平均單價與平均銷售數量，並列出平均銷售數量大於10的資料，且將資料依產品編號由小到大排序。
select ProductID,avg(UnitPrice) as 平均單價,avg(Quantity) as 平均銷售數量
from OrderDetails
group by ProductID
having avg(Quantity)>10
order by ProductID
----------------------------------------------------------------------------------
select o.OrderID as 訂單號碼,ca.CategoryName as 產品類別名稱,p.ProductName as 產品名稱
,od.UnitPrice as 產品訂購單價,od.Quantity as 產品訂購數量
,Round(od.UnitPrice*od.Quantity*(1-od.Discount),0) as 產品價錢小計
,c.CustomerID as 客戶編號,c.ContactName as 客戶名稱,o.ShipName as 收貨人名字
,o.OrderDate as 訂購日期,o.EmployeeID as 處理訂單員工的姓名,sh.CompanyName as 貨運公司
,s.CompanyName as 供應商名稱
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
select e.EmployeeID as 員工編號,e.LastName+','+e.FirstName as 姓名,e.Title as 職稱
,e.Extension as 內部分機號碼,e.Notes as 備註 from Employees as e
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
--請利用Northwind資料庫進行查詢
--1.列出從未下過訂單的客戶資料
select * from Customers
select * from Orders

select Customers.*
from Customers left join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.OrderID is null

--2.列出從未處理過訂單的員工資料
select * from Employees
select * from Orders　order by EmployeeID

select *
from Employees left join Orders
on Employees.EmployeeID=Orders.EmployeeID
where Orders.EmployeeID is null


--3.列出從未被購買的商品資料
select * from OrderDetails　order by ProductID
select * from Products　

select *
from Products left join OrderDetails
on Products.ProductID=OrderDetails.ProductID
where OrderDetails.ProductID is null

--對null值的處理方式
--統計每個Region有幾個客戶
select * from Customers　order by Region

select isnull(Region,'empty') as Region　,count(*) as CustomerNumber
from Customers
group by Region

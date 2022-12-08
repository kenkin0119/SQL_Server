select*
from OrderDetails

--每種商品被買過幾次
select ProductID,COUNT(*)
from OrderDetails
group by ProductID

select*,UnitPrice*Quantity*(1-Discount)　as 小計
from OrderDetails

select OrderID,COUNT(*) as 商品種數
from OrderDetails
group by OrderID

select*
from Orders

select *
from Products
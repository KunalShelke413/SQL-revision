use kunal;
show tables;

# Inner join 2 tables

select p.ProductID, p.ProductName, c.CategoryName from products p
inner join categories c
on c.CategoryID = p.CategoryID;

#Inner join 3 tables

select p.ProductName, c.CategoryName, s.City
from ((products p
inner join suppliers s on p.productID=s.SupplierID)
inner join categories c on p.CategoryID=c.CategoryID);

# Left join 

select distinct cu.City, c.CategoryName
from ((((customers cu
left join orders o on cu.CustomerID=o.CustomerID)
left join order_details od on o.OrderID=od.OrderID)
left join products p on p.ProductID=od.Product)
left join categories c on p.CategoryID=c.CategoryID);

# full outer join not work in my sql

select c.CustomerName, o.OrderID
from customers c
full outer join orders o
on o.CustomerID=c.CustomerID
order by c.CustomerName;

# instead of do this

select c.CustomerName, o.OrderID
from customers c
left join orders o
on o.CustomerID=c.CustomerID

union

select distinct c.CustomerName, o.OrderID
from customers c
right join orders o
on o.CustomerID=c.CustomerID

# cross join


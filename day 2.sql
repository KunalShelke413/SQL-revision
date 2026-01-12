use kunal;

#Q1
SELECT distinct CustomerName, City, Country FROM customers
WHERE Country="Germany";

#Q2
SELECT c.CustomerID, c.CustomerName, count(o.OrderID) as total_orders from orders o
left join customers c on o.CustomerID=c.CustomerID
group by c.CustomerName,c.CustomerID;

#Q3
select od.Product, p.ProductName, sum(od.Quantity) from order_details od
right join products p on od.Product=p.ProductID
group by od.Product,p.ProductName;

#Q4
select c.CustomerID, c.CustomerName, count(o.OrderID) as order_count from orders o
left join customers c on o.CustomerID=c.CustomerID
group by c.CustomerID, c.CustomerName
having order_count>5;

#Q5
select p.ProductID, p.ProductName, sum(od.Quantity) as total_quantity from products p
right join order_details od on od.Product=p.ProductID
group by p.ProductID, p.ProductName
having total_quantity>100
order by p.ProductID;

#Q6
select c.Country, sum(od.Quantity) as total_quantity from ((customers c
join orders o on o.CustomerID=c.CustomerID)
join order_details od on o.OrderID=od.OrderID)
group by c.Country
having total_quantity>200
order by total_quantity;


#Q7
select p.ProductName, sum(od.Quantity*p.price) as total_sales from products p
join order_details od on od.Product=p.ProductID
group by p.ProductName;

#Q8
select c.CustomerName, sum(od.Quantity) as total_quantity from Customers c
join orders o on o.CustomerID=c.CustomerID
join order_details od on od.OrderID=o.OrderID
group by c.CustomerName
order by total_quantity
limit 5;

#Q9
select e.EmployeeID, e.FirstName, e.LastName, count(o.OrderID) from employees e
join orders o on o.EmployeeID=e.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName;

#Q10
select ca.CategoryName, sum(od.Quantity) as total_quantity from categories ca
join products p on p.CategoryID=ca.CategoryID
join order_details od on od.Product=p.ProductID
group by ca.CategoryName;

#Q11
select s.SupplierID,s.SupplierName from ((suppliers s
left join products p on p.SupplierID=s.SupplierID)
left join order_details od on od.Product=p.ProductID)
group by s.SupplierID,s.SupplierName
having sum(od.Quantity) is null;

#Q12
select c.CustomerID,c.CustomerName from customers c
left join orders o on o.CustomerID=c.CustomerID
group by c.CustomerID,c.CustomerName
having count(o.OrderID) =0;
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
use kunal;

#windows function

#Q1
select c.CustomerID , o.OrderID, o.OrderDate,( rank() over ( partition by c.CustomerID order by o.OrderDate desc)) as rn from customers c
join orders o on o.CustomerID = c.CustomerID;

#Q2
select CustomerID,CustomerName from (select c.CustomerID,c.CustomerName,
	row_number() over (
	partition by c.CustomerID 
	order by o.OrderDate desc)as lo 
    from customers c
	join orders o on o.CustomerID = c.CustomerID) t
where lo = 1;

#Q3
select ProductID,SupplierID,price, rank() over (partition by ProductID order by price desc) as rn  from products;

#Q4
SELECT
    CategoryID,
    ProductID,
    ProductName,
    total_qty
FROM (
    SELECT
        p.CategoryID,
        p.ProductID,
        p.ProductName,
        SUM(od.Quantity) AS total_qty,
        ROW_NUMBER() OVER (
            PARTITION BY p.CategoryID
            ORDER BY SUM(od.Quantity) DESC
        ) AS rn
    FROM products p
    JOIN order_details od
        ON p.ProductID = od.Product
    GROUP BY
        p.CategoryID,
        p.ProductID,
        p.ProductName
) t
WHERE rn <= 2;


#Q5
WITH order_stats AS (
    SELECT
        o.CustomerID,
        od.Quantity,
        o.OrderDate,
        AVG(od.Quantity) OVER (
            PARTITION BY o.CustomerID
        ) AS avg_qty,
        ROW_NUMBER() OVER (
            PARTITION BY o.CustomerID
            ORDER BY o.OrderDate DESC
        ) AS rn
    FROM orders o
    JOIN order_details od
        ON o.OrderID = od.OrderID
)
SELECT
    CustomerID,
    Quantity AS latest_qty,
    avg_qty
FROM order_stats
WHERE rn = 1
  AND Quantity > avg_qty
order by latest_qty;

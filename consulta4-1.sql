use adw;
SELECT 
    c.CustomerID,
    SUM(sod.LineTotal) AS ValorTotal
FROM 
    Sales_SalesOrderHeader soh
JOIN 
    Sales_SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Sales_Customer c ON soh.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID
ORDER BY 
    ValorTotal DESC
LIMIT 5;

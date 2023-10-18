use adw;
SELECT 
    s.Name AS StoreName,  -- Asumiendo que hay un campo llamado "Name" en la tabla Store.
    SUM(sod.OrderQty) AS CantidadVendida,
    SUM(sod.LineTotal) AS IngresosTotales
FROM 
    Sales_SalesOrderHeader soh
JOIN 
    Sales_SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN
    Sales_Store s ON c.StoreID = s.BusinessEntityID  -- Asumiendo que BusinessEntityID es el identificador único para la tienda.
GROUP BY 
    s.Name
ORDER BY 
    IngresosTotales DESC
LIMIT 5;

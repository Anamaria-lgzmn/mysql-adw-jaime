use adw;
SELECT 
    a.City,
    sp.Name AS StateProvince,  -- Usamos el alias sp para la tabla StateProvince
    COUNT(DISTINCT soh.SalesOrderID) AS NumeroDeOrdenes,
    SUM(sod.OrderQty) AS CantidadTotalDeProductos,
    SUM(sod.LineTotal) AS ValorTotal
FROM 
    Sales_SalesOrderHeader soh
JOIN 
    Sales_SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Sales_Customer c ON soh.CustomerID = c.CustomerID
JOIN 
    Person_BusinessEntityAddress ca ON c.CustomerID = ca.BusinessEntityID
JOIN 
    Person_Address a ON ca.AddressID = a.AddressID
JOIN 
    Person_StateProvince sp ON a.StateProvinceID = sp.StateProvinceID  -- Hacemos el JOIN con la tabla StateProvince
GROUP BY 
    a.City, sp.Name
ORDER BY 
    ValorTotal DESC;

use adw;
SELECT 
    sm.Name AS MetodoDeEnvio,
    COUNT(DISTINCT soh.SalesOrderID) AS NumeroDeOrdenes,
    SUM(sod.OrderQty) AS CantidadTotalDeProductos,
    SUM(sod.LineTotal) AS ValorTotal
FROM 
    Sales_SalesOrderHeader soh
JOIN 
    Sales_SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Purchasing_ShipMethod sm ON soh.ShipMethodID = sm.ShipMethodID
GROUP BY 
    sm.Name
ORDER BY 
    ValorTotal DESC;


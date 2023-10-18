use adw;
SELECT 
    p.ProductID,
    p.Name AS NombreProducto,
    SUM(sod.OrderQty) AS CantidadVendida,
    SUM(sod.LineTotal) AS IngresosTotales
FROM 
    Sales_SalesOrderDetail sod
JOIN 
    Production_Product p ON sod.ProductID = p.ProductID
GROUP BY 
    p.ProductID, p.Name
ORDER BY 
    CantidadVendida DESC
LIMIT 5;

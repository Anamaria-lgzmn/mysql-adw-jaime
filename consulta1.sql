use adw;
SELECT 
    pc.Name AS Categoria,
    COUNT(DISTINCT soh.SalesOrderID) AS NumeroDeOrdenes,
    COUNT(sod.SalesOrderDetailID) AS NumeroDeLineasDeOrdenes,
    SUM(sod.OrderQty) AS CantidadTotalDeProductos,
    SUM(sod.LineTotal) AS ValorTotal
FROM 
    Sales_SalesOrderHeader soh
JOIN 
    Sales_SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production_Product p ON sod.ProductID = p.ProductID
JOIN 
    Production_ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN 
    Production_ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY 
    pc.Name
ORDER BY 
    ValorTotal DESC;

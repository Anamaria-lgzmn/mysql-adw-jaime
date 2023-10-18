use adw;
SELECT 
    sp.Name AS StateProvince,
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
    Person_StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
GROUP BY 
    sp.Name
ORDER BY 
    ValorTotal DESC
LIMIT 5;

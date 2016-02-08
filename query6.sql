SELECT 
    ProductName, UnitPrice
FROM
    Products
WHERE
    (SELECT 
            AVG(UnitPrice)
        FROM
            Products) < UnitPrice
ORDER BY UnitPrice;
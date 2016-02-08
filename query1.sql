SELECT 
    o.OrderID,
    p.ProductID,
    p.ProductName,
    od.UnitPrice,
    od.Quantity,
    od.Discount,
    (od.UnitPrice * od.Quantity * (1 - (od.Discount / 100))) AS Total
FROM
    Orders AS o
        INNER JOIN
    OrderDetails AS od ON o.OrderID = od.OrderID
        INNER JOIN
    Products AS p ON od.ProductID = p.ProductID
ORDER BY OrderID, ProductID;
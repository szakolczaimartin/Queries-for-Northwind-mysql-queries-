SELECT 
    o.ShipName,
    o.ShipAddress,
    o.ShipCity,
    o.ShipRegion,
    o.ShipPostalCode,
    o.ShipCountry,
    o.CustomerID,
    c.CompanyName as CustomerName,
    c.Address,
    c.City,
    c.Region,
    c.PostalCode,
    c.Country,
    (CONCAT(e.FirstName, ' ', e.LastName)) AS Salesperson,
    o.OrderID,
    o.OrderDate,
    o.RequiredDate,
    o.ShippedDate,
    s.CompanyName as ShipperName,
    od.ProductID,
    p.ProductName,
    od.UnitPrice,
    od.Quantity,
    od.Discount,
    ((od.UnitPrice * od.Quantity) * (1 - od.Discount)) AS Total,
    o.Freight
FROM
    Orders AS o
        INNER JOIN
    Customers AS c ON o.CustomerID = c.CustomerID
        INNER JOIN
    Employees AS e ON o.employeeID = e.employeeID
        INNER JOIN
    Shippers AS s ON o.ShipVia = s.ShipperID
        INNER JOIN
    OrderDetails AS od ON o.OrderID = od.OrderID
        INNER JOIN
    Products AS p ON od.ProductID = p.ProductID
ORDER BY CustomerID, OrderDate, ProductID;
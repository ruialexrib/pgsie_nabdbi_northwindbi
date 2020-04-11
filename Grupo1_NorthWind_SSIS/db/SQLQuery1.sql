SELECT [Products].ProductID, 
       [Categories].CategoryID, 
       [Customers].CustomerID, 
       [Suppliers].SupplierID, 
       [Orders].OrderDate, 
	   [Orders].OrderID,
       [Order Details].Quantity, 
       [Order Details].UnitPrice, 
       [Order Details].Discount, 
       [Order Details].Quantity * [Order Details].UnitPrice - [Order Details].Discount AS Total
FROM [Order Details]
     INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
     INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
     INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
     INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
     INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE [Orders].OrderDate > '01-01-1996';
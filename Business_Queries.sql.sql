CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);    
INSERT INTO Customers VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Amit', 'Mumbai'),
(3, 'Priya', 'Lucknow'),
(4, 'Neha', 'Pune'),
(5, 'Abhishek', 'Gorakhpur');
SELECT * FROM Customers;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mobile', 'Electronics', 20000),
(103, 'Shoes', 'Fashion', 3000),
(104, 'Watch', 'Fashion', 5000),
(105, 'HeadPhones', 'Electronics', 2000);
SELECT * FROM Products;   

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE 
);
INSERT INTO Orders VALUES
(1001, 1, '2025-01-10'),
(1002, 2, '2025-01-15'),
(1003, 3, '2025-02-01'),
(1004, 1, '2025-02-10'),
(1005, 4, '2025-03-05');
SELECT * FROM Orders;    

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);
INSERT INTO OrderDetails VALUES
(1, 1001,101,1),
(2, 1002,105,2),
(3, 1003,102,1),
(4, 1003,103,2),
(5, 1004,104,1),
(6, 1005,101,1);
SELECT * FROM OrderDetails;

SELECT SUM(p.Price * od.Quantity) AS TotalRevenue
FROM Products p JOIN OrderDetails od
ON p.ProductID = od.ProductID;

SELECT p.ProductName,SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

SELECT p.Category,SUM(p.Price * od.Quantity) AS Revenue
FROM Products p 
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.Category;

SELECT c.CustomerName,SUM(p.Price * od.Quantity) AS TotalSpent
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p 
ON od.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC;

SELECT MONTH(o.OrderDate) AS Month,
SUM(p.Price * od.Quantity) AS Revenue FROM Orders o 
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p 
ON od.ProductID = p.ProductID
GROUP BY MONTH(o.OrderDate);

















































































 



















































































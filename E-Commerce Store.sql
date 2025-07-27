-- Create a table named Orders listing all information for each purchase
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID VARCHAR(6) NOT NULL,
    Order_Date DATE NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10, 2)
);

-- Insert the data for the first 10 purchases
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Product, Quantity, Unit_Price) VALUES
(1, '102921', '2025-07-01', 'Wireless Mouse', 2, 15.00),
(2, '112005', '2025-07-01', 'USB-C Charger', 1, 25.00),
(3, '194389', '2025-07-02', 'Bluetooth Keyboard', 1, 35.00),
(4, '130388', '2025-07-03', 'Laptop Stand', 1, 45.00),
(5, '143981', '2025-07-03', 'Wireless Mouse', 1, 15.00),
(6, '194389', '2025-07-04', 'Gaming Mouse Pad', 1, 20.00),
(7, '138901', '2025-07-04', 'Wireless Earbuds', 1, 60.00),
(8, '144629', '2025-07-05', 'Mechanical Keyboard', 2, 40.00),
(9, '144629', '2025-07-05', 'Wireless Mouse', 1, 15.00),
(10, '100107', '2025-07-06', 'Laptop Stand', 1, 45.00);

-- Create a table named Orders listing all information for each purchase
CREATE TABLE Revenue (
    Order_ID INT PRIMARY KEY,
    Total_Amount DECIMAL(10, 2)
);

-- Insert the data for the first 10 purchases
INSERT INTO Revenue (Order_ID, Total_Amount) VALUES
(1, 30.00),
(2, 25.00),
(3, 35.00),
(4, 45.00),
(5, 15.00),
(6, 20.00),
(7, 60.00),
(8, 80.00),
(9, 15.00),
(10, 45.00);

-- Select everything from the Orders table
SELECT * 
FROM Orders;

-- Arrange all purchases by Customer ID number
SELECT *
FROM Orders
ORDER BY ID ASC;

-- Select everything from the Revenue table
SELECT * 
FROM Revenue;

-- List all orders and the revenue gained together
SELECT 
    o.Order_ID, 
    o.Customer_ID, 
    o.Order_Date, 
    o.Product, 
    o.Quantity, 
    o.Unit_Price, 
    r.Total_Amount
FROM Orders o
JOIN Revenue r
    ON o.Order_ID = r.Order_ID

-- Update the tables to add a new customer purchase
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Product, Quantity, Unit_Price) VALUES 
(11, 144629, '2025-07-07', 'Bluetooth Keyboard', 1, 35.00);

INSERT INTO Revenue (Order_ID, Total_Amount) VALUES 
(11, 35.00);

-- List down the total revenue per customer
SELECT 
    o.Customer_ID, 
    SUM(r.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Revenue r ON o.Order_ID = r.Order_ID
GROUP BY o.Customer_ID;

-- Find the 2 most frequent customers in Orders
SELECT TOP 2 
    Customer_ID, 
    COUNT(*) AS Order_Count
FROM Orders
GROUP BY Customer_ID
ORDER BY Order_Count DESC

-- Show all purchases made by Customer ID 144629
SELECT *
FROM Orders
WHERE Customer_ID = 144629;

-- List down the total revenue by day
SELECT 
    o.Order_Date,
    SUM(r.Total_Amount) AS Daily_Revenue
FROM Orders o
JOIN Revenue r ON o.Order_ID = r.Order_ID
GROUP BY o.Order_Date
ORDER BY o.Order_Date;

-- Show all customers who purchased a wireless mouse
SELECT *
FROM Orders
WHERE Product = 'Wireless Mouse';

-- Find the total revenue per product
SELECT 
    o.Product, 
    SUM(r.Total_Amount) AS Total_Revenue
FROM Orders o
JOIN Revenue r ON o.Order_ID = r.Order_ID
GROUP BY o.Product
ORDER BY Total_Revenue DESC;

-- Find most ordered items in Orders
SELECT 
    Product, 
    SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Product
ORDER BY Total_Quantity DESC;

-- Create view of all purchases in descending order of revenue
CREATE VIEW Purchases_By_Revenue AS
SELECT 
    o.Order_ID,
    o.Customer_ID,
    o.Order_Date,
    o.Product,
    o.Quantity,
    o.Unit_Price,
    r.Total_Amount
FROM Orders o
JOIN Revenue r ON o.Order_ID = r.Order_ID
ORDER BY r.Total_Amount DESC;
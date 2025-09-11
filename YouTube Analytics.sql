-- Create a table named Analytics listing ageneral information for videos under a channel
CREATE TABLE Analytics (
    Video_ID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Upload_Date DATE NOT NULL,
    Duration_Seconds INT
);

-- Rename table Analytics to Video_Info
EXEC sp_rename 'Analytics', 'Video_Info';

-- Create another table named Performance_Metrics
CREATE TABLE Performance_Metrics (
    Video_ID INT PRIMARY KEY,
    Views INT NOT NULL,
    Watch_Time_Minutes FLOAT NOT NULL,
    Avg_View_Duration_Seconds FLOAT,
    Likes INT NOT NULL,
    Dislikes INT NOT NULL
);

-- Add 2 columns to the Performance_Metrics Table
ALTER TABLE Performance_Metrics
ADD Comments_Count INT,
ADD Shares INT;

-- Remove column from Analytics table
ALTER TABLE Video_Info
DROP COLUMN Channel_ID;

-- Add 1 column to the Performance_Metrics Table
ALTER TABLE Video_Info
ADD Category VARCHAR[50];

-- Insert values into Video_Info table 
INSERT INTO Video_Info (Video_ID, Title, Upload_Date, Duration_Seconds, Category) VALUES 
('1','10 Minute Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('2','Top 10 Coding Tips','2025-09-11','720','Education'),
('3','Travel Vlog in Shibuya, Japan','2025-09-14','900','Travel'),
('4','Minimalistic DIY Room Decor','2025-09-14','480','Lifestyle'),
('5','Valorant Gaming Montage','2025-09-15','1080','Gaming'),
('6','History of Rome Explained','2025-09-17','1200','Education'),
('7','Street Food in Manila','2025-09-19','540','Food'),
('8','Music Cover of Hello by Adele','2025-09-23','210','Music'),
('9','25 Productivity Hacks for 2025','2025-09-26','660','Lifestyle'),
('10','Movie Review: Dune 2','2025-09-27','780','Entertainment');

-- Insert values into Performance_Metrics table 
INSERT INTO Performance_Metrics (Video_ID, Views, Watch_Time_Minutes, Avg_View_Duration_Seconds, Likes, Dislikes) VALUES 
('1','50000','8200','590','3500','120'),
('2','72000','11400','570','4200','180'),
('3','95000','15700','595','6800','210'),
('4','30000','4800','580','2100','60'),
('5','150000','28000','660','12000','500'),
('6','40000','6300','550','3300','100'),
('7','80000','13400','600','5600','160'),
('8','20000','2500','450','1800','50'),
('9','55000','9000','500','4100','90'),
('10','68000','12100','640','5500','230');

-- Calculate the like-dislike ratio per video and show it

-- Add another table named Audience
CREATE TABLE Audience (
    Video_ID INT PRIMARY KEY,
    Subscribers_Gained INT,
    Subscribers_Lost INT,
    Audience_Retention_Rate INT,
    Click_Through_Rate INT
);

-- Select everything from the Video_Info table
SELECT * 
FROM Video_Info;

-- Arrange all videos in Video_Info by alphabetical order
SELECT *
FROM Orders
ORDER BY Title ASC;

-- Select everything from the Performance_Metrics table
SELECT * 
FROM Performance_Metrics;

-- List all details in the Video_Info table combined with the views, likes and dislikes from Performance_Metrics
SELECT 
    v.Video_ID,
    v.Title,
    v.Upload_Date,
    v.Duration_Seconds,
    p.Views,
    p.Likes,
    p.Dislikes
FROM Video_Info v
JOIN Performance_Metrics p
    ON v.Video_ID = p.Video_ID

-- Update the Video_Info table to add a new video
INSERT INTO Video_Info (Video_ID, Title, Upload_Date, Duration_Seconds, Category) VALUES 
('1','10 Minute Morning Yoga Routine','2025-09-09','600','Health & Fitness');

-- Update the Performance_Metrics table to add a new value
INSERT INTO Performance_Metrics (Video_ID, Views, Watch_Time_Minutes, Avg_View_Duration_Seconds, Likes, Dislikes) VALUES 
('1','50000','8200','590','3500','120');

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

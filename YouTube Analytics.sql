-- Create a table named Analytics listing ageneral information for videos under a channel
CREATE TABLE Analytics (
    Video_ID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Channel_ID INT NOT NULL,
    Upload_Date DATE NOT NULL,
    Duration_Seconds INT
);

-- Rename table Analytics to Video_Info
EXEC sp_rename 'Analytics', 'Video_Info';

-- Create another table named Performance_Metrics
CREATE TABLE Performance_Metrics (
    Views INT PRIMARY KEY,
    Watch_Time_Minutes FLOAT NOT NULL,
    avg_view_duration_seconds FLOAT,
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

-- Calculate the like-dislike ratio per video and show it

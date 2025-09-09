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

-- Insert values into Analytics table 
INSERT INTO Video_Info (Video_ID, Title, Upload_Date, Duration_Seconds, Category) VALUES 
('1','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('2','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('3','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('4','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('5','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('6','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('7','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('8','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('9','Morning Yoga Routine','2025-09-09','600','Health & Fitness'),
('10','Morning Yoga Routine','2025-09-09','600','Health & Fitness');

-- Calculate the like-dislike ratio per video and show it

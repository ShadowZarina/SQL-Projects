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
-- Check table above if correct

-- Calculate the like-dislike ratio per video and show it

-- Create a table named Orders listing all information for each purchase
CREATE TABLE Analytics (
    Video_ID INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Channel_ID INT NOT NULL,
    Upload_Date DATE NOT NULL,
    Duration_Seconds INT
);

-- 0. Create a database 
CREATE DATABASE ccdb;

-- Connect to the database
\c ccdb;

-- 1. Create cc_detail table
CREATE TABLE cc_detail (
    Client_Num INT PRIMARY KEY,
    Card_Category VARCHAR(20),
    Annual_Fees DECIMAL(10,2),
    Activation_30_Days INT,
    Customer_Acq_Cost DECIMAL(10,2),
    Week_Start_Date DATE,
    Week_Num VARCHAR(5),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip BOOLEAN,
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc BOOLEAN
);

-- 2. Create cust_detail table
CREATE TABLE cust_detail (
    Client_Num INT PRIMARY KEY,
    Customer_Age INT CHECK (Customer_Age >= 18),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Dependent_Count INT CHECK (Dependent_Count >= 0),
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(10),
    Car_Owner BOOLEAN,
    House_Owner BOOLEAN,
    Personal_Loan BOOLEAN,
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income DECIMAL(10,2),
    Cust_Satisfaction_Score INT CHECK (Cust_Satisfaction_Score BETWEEN 1 AND 10)
);

-- 3. Copy CSV data into tables
COPY cc_detail
FROM 'D:\\credit_card.csv' 
DELIMITER ',' 
CSV HEADER;

COPY cust_detail
FROM 'D:\\customer.csv' 
DELIMITER ',' 
CSV HEADER;

-- 4. Insert additional data (week-53)
COPY cc_detail
FROM 'D:\\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;

COPY cust_detail
FROM 'D:\\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;

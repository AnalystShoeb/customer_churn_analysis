/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
	This script creates tables in the 'silver' shcema, dropping existing tables
	if they already exists.
	Run this script to re-define the DDL structure of 'silver' Tables
*/


IF OBJECT_ID('silver.customer_data', 'U') IS NOT NULL
	DROP TABLE silver.customer_data;
GO

CREATE TABLE silver.customer_data (
	Customer_ID nvarchar(50),
	Gender nvarchar(50),
	Age tinyint,
	Married varchar(50),
	State nvarchar(50),
	Number_of_Referrals tinyint,
	Tenure_in_Months tinyint,
	Value_Deal nvarchar(50),
	Phone_Service nvarchar(50),
	Multiple_Lines nvarchar(50),
	Internet_Service nvarchar(50),
	Internet_Type nvarchar(50),
	Online_Security nvarchar(50),
	Online_Backup nvarchar(50),
	Device_Protection_Plan nvarchar(50),
	Premium_Support nvarchar(50),
	Streaming_TV nvarchar(50),
	Streaming_Movies nvarchar(50),
	Streaming_Music nvarchar(50),
	Unlimited_Data nvarchar(50),
	Contract nvarchar(50),
	Paperless_Billing nvarchar(50),
	Payment_Method nvarchar(50),
	Monthly_Charge float,
	Total_Charges float,
	Total_Refunds float,
	Total_Extra_Data_Charges tinyint,
	Total_Long_Distance_Charges float,
	Total_Revenue float,
	Customer_Status nvarchar(50),
	Churn_Category nvarchar(50),
	Churn_Reason nvarchar(50)
);
GO

/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	BEGIN TRY
		TRUNCATE TABLE silver.customer_data;
		INSERT INTO silver.customer_data (
			Customer_ID,
			Gender,
			Age,
			Married,
			State,
			Number_of_Referrals,
			Tenure_in_Months,
			Value_Deal,
			Phone_Service,
			Multiple_Lines,
			Internet_Service,
			Internet_Type,
			Online_Security,
			Online_Backup,
			Device_Protection_Plan,
			Premium_Support,
			Streaming_TV,
			Streaming_Movies,
			Streaming_Music,
			Unlimited_Data,
			Contract,
			Paperless_Billing,
			Payment_Method,
			Monthly_Charge,
			Total_Charges,
			Total_Refunds,
			Total_Extra_Data_Charges,
			Total_Long_Distance_Charges,
			Total_Revenue,
			Customer_Status,
			Churn_Category,
			Churn_Reason
		)

		SELECT
			Customer_ID,
			Gender,
			Age,
			Married,
			State,
			Number_of_Referrals,
			Tenure_in_Months,
			ISNULL(Value_Deal, 'No Deal') AS Value_Deal,
			Phone_Service,
			ISNULL(Multiple_Lines, 'No') AS Multiple_Lines,
			Internet_Service,
			ISNULL(Internet_Type, 'Offline Customers') AS Internet_Type,
			ISNULL(Online_Security, 'Not Applicable') AS Online_Security,
			ISNULL(Online_Backup, 'Not Applicable') AS Online_Backup,
			ISNULL(Device_Protection_Plan, 'Not Applicable') AS Device_Protection_Plan,
			ISNULL(Premium_Support, 'Not Applicable') AS Premium_Support,
			ISNULL(Streaming_TV, 'Not Applicable') AS Streaming_TV,
			ISNULL(Streaming_Movies, 'Not Applicable') AS Streaming_Movies,
			ISNULL(Streaming_Music, 'Not Applicable') AS Streaming_Music,
			ISNULL(Unlimited_Data, 'Not Applicable') AS Unlimited_Data,
			Contract,
			Paperless_Billing,
			Payment_Method,
			Monthly_Charge,
			Total_Charges,
			Total_Refunds,
			Total_Extra_Data_Charges,
			Total_Long_Distance_Charges,
			Total_Revenue,
			Customer_Status,
			ISNULL(Churn_Category, 'Not Churned') AS Churn_Category,
			CASE
				WHEN Customer_Status = 'Joined' THEN 'New Joiner'
				WHEN Customer_Status = 'Stayed' THEN 'Happy Customer'
				ELSE ISNULL(Churn_Reason, 'Unknown')
			END AS Churn_Reason
		FROM bronze.customer_data;
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END

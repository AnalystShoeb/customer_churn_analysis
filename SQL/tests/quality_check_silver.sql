/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'silver.customer_data'
-- ====================================================================


-- Check the missing values form the 'Value_deal' Column
-- Expectation: No Results
SELECT value_deal, 
	   COUNT(value_deal) AS TotalCount
FROM silver.customer_data
GROUP BY value_deal;

-- Check the missing values form the 'Multiple_Lines' Column
-- Expectation: No Results
SELECT Multiple_Lines, 
	   COUNT(Multiple_Lines) AS TotalCount
FROM silver.customer_data
GROUP BY Multiple_Lines;

-- Check the missing values form the 'Internet_Type' Column
-- Expectation: No Results
SELECT DISTINCT Internet_Type
FROM silver.customer_data

-- Check the missing values form the 'Internet_Type' Column
-- Expectation: No Results
SELECT DISTINCT Internet_Type
FROM silver.customer_data

-- Check the missing values form the 'Streaming_Movies' Column
-- Expectation: No Results
SELECT DISTINCT Streaming_Movies
FROM silver.customer_data

-- Check the missing values form the 'Churn_Category' Column
-- Expectation: No Results
SELECT DISTINCT Churn_Category
FROM silver.customer_data

-- Check the missing values form the 'Churn_Reason' Column
-- Expectation: No Results
SELECT DISTINCT Churn_Reason
FROM silver.customer_data

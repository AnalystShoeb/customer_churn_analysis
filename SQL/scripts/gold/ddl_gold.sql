/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the customer database. 
    The Gold layer represents the final fact and dimension tables

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.view_churned_data
-- =============================================================================

IF OBJECT_ID('gold.view_churned_data', 'V') IS NOT NULL
    DROP VIEW gold.view_churned_data;
GO

CREATE VIEW gold.view_churned_data AS
SELECT * FROM silver.customer_data WHERE Customer_Status IN ('Churned','Stayed')
GO

-- =============================================================================
-- Create Dimension: gold.view_join_data
-- =============================================================================

IF OBJECT_ID('gold.view_join_data', 'V') IS NOT NULL
    DROP VIEW gold.view_join_data;
GO

CREATE VIEW gold.view_join_data AS
SELECT * FROM silver.customer_data WHERE Customer_Status = 'Joined'
GO

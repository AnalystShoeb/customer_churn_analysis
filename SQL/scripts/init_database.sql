/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
	The purpose of this script is to create 'Customer' database after checking if it already exists.
	If the database exists. it is dropped and recreated. Additionally, the the script set up three schemas
	within the database: 'bronze', 'silver', and 'gold'

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/



USE master;
GO;

-- Drop and Recreate the "Customer" Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Customer')
BEGIN
	ALTER DATABASE Customer SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Customer;
END;
GO

-- Create the 'Customer' database
CREATE DATABASE Customer;
GO

USE Customer;
GO;

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

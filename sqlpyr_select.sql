-- SELECTING COLUMNS IN SQL --

-- Select all columns

SELECT *
FROM MyProducts

-- Select a single column
SELECT ProductID
FROM MyProducts

-- Select Multiple Columns

SELECT
	ProductID
	,ProductName
FROM MyProducts

-- order does not matter - rearrange

SELECT
	ProductName
	,ProductID
FROM MyProducts

-- Select with Alias - rename while selecting

SELECT 
	ProductPrice AS Price
FROM MyProducts

--2 other select variants

SELECT TOP(2) *
FROM MyProducts   --No Order

-- Show SELECT TOP 1000 in OBJ Explorer

SELECT DISTINCT
	ProductID
FROM MyOrders

-- cons:  no exclude only include, no helper functions 



--you are tasked to find the order total for each order but price and
--quantity are on different tables

SELECT *
FROM dbo.MyOrders

SELECT* FROM dbo.MyProducts

--INNER JOIN: 
--see all entries from left that have corresponding entries in the right

SELECT	mp.ProductID
		,mp.ProductName
		,mp.ProductPrice
		,mo.OrderID
		,mo.Quantity
		,mp.ProductPrice * mo.Quantity AS OrderTotal
FROM MyProducts mp
INNER JOIN MyOrders mo  --or just JOIN
ON mp.ProductID = mo.ProductID

-- now we can add a conditional column to get order total
-- ,mp.ProductPrice * mo.Quantity AS OrderTotal

--Left Join
--You are asked to find all orders, balloon types and prices 
--even if the type of balloon has never been ordered. i.e. show the black ballon also

--Use a left join to see all entries from the left table
--(my_products) eveen if they have no corresponding entries in the right table (my_orders).

SELECT	mp.ProductID
		,mp.ProductName
		,mp.ProductPrice
		,mo.OrderID
		,mo.Quantity		
FROM MyProducts mp
LEFT JOIN MyOrders mo  
ON mp.ProductID = mo.ProductID

--Right Join
--Right join is the opposite of left. 
--I don't generally use it. I normally switch the order of the tables in my function to avoid confusion .

--Here it is for demonstration purposes. 
--In this case it is the equivalent of an inner join.
SELECT	mp.ProductID
		,mp.ProductName
		,mp.ProductPrice
		,mo.OrderID
		,mo.Quantity		
FROM MyProducts mp
RIGHT JOIN MyOrders mo  
ON mp.ProductID = mo.ProductID

--Outer Join
--You are asked to make a table with all the information from both tables.

--Use an outer join for this.

SELECT	*
FROM MyProducts mp
FULL JOIN MyOrders mo  
ON mp.ProductID = mo.ProductID

--Cross Join

--Cross join gives you the Cartesion product between 2 dataframes. 
--A combination of every row from one table with every row from the other table.

--We can use a simplified datframe to better illustrate this.


DROP TABLE IF EXISTS Sizes
DROP TABLE IF EXISTS Balloons

-- Creating the table for balloon colors
CREATE TABLE Balloons (
    color NVARCHAR(50)
);

INSERT INTO Balloons (color)
VALUES ('red'), ('blue'), ('green');



-- Creating the table for sizes
CREATE TABLE Sizes (
    size NVARCHAR(50)
);

INSERT INTO Sizes (size)
VALUES ('small'), ('medium'), ('large');

SELECT *
FROM Balloons

SELECT * 
FROM Sizes

-- Cross Join Query
SELECT 
    b.color, 
    s.size
FROM Balloons b
CROSS JOIN Sizes s




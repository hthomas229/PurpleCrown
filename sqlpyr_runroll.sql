SELECT *
FROM kobe

-- window syntax
-- ALWAYS IN THIS ORDER 
-- ROWS OR RANGE BETWEEN  -- ROWS row by row RANGE will gopup by date or numerical value
-- UNBOUNDED PRECEDING, (n)PRECEDING, CURRENT, (n)FOLLOWING, UNBOUNDED FOLLOWING

-- SO  a regular windows agregate sum function is sum is actually saying
SELECT	date
		,total_points
		,SUM(total_points) OVER( 
		ORDER BY date 
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		) AS RunningTotalPts
FROM KOBE

--But as you saw from our last lesson you don't need to include all of this
-- when you want a simple aggregate
SELECT	date
		,total_points
		,SUM(total_points) OVER(ORDER BY date) AS TotalPts
FROM KOBE

--but if you want to do any running or rolling windows you do

--We can use variations of ROWS and RANGE to accomplish this

SELECT	date
		,total_points
		,SUM(total_points) OVER( 
		ORDER BY date 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		) AS RunningTotalPts
FROM KOBE




--AVG, MAX, MIN

SELECT	date
,total_points
		,MIN(total_points) OVER( 
		ORDER BY date 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		) AS MinTotalPts
FROM KOBE

-- Running Totals - Moving Average

SELECT	date
		,total_points
		,SUM(total_points) OVER( 
		ORDER BY date 
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
		) AS ThreeDayRollingPts
FROM KOBE

--or  Using Following

SELECT	date
		,total_points
		,AVG(total_points) OVER( 
		ORDER BY date 
		ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
		) AS MovingAvgThreeDayPts
FROM KOBE

-- or RANGE -- group by date
--for this we will insert an extra row for a 2nd game on 10/28

INSERT INTO KOBE (date, total_points)
VALUES ('2008-10-28', 21)

SELECT *
FROM kobe

SELECT	date
		,total_points
		,SUM(total_points) OVER( 
		ORDER BY date 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		) AS RunningTotalPtsRows
		,SUM(total_points) OVER( 
		ORDER BY date 
		RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		) AS RunningTotalPtsRange
FROM KOBE
 
-- this one is only useful with RANGE -- get just the points from 
-- the 2 games kobe played on October 28th
SELECT	date
		,total_points
		,SUM(total_points) OVER( 
		ORDER BY date 
		RANGE BETWEEN CURRENT ROW AND CURRENT ROW
		) AS OneDayRange
FROM KOBE

DELETE FROM KOBE
WHERE date = '2008-10-28' AND total_points = 21




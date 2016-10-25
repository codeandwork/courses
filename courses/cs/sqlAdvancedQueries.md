## SQL HAVING clause
A HAVING clause specifies that an SQL SELECT statement should only return rows where aggregate values meet the specified conditions.
It was added to the SQL language because the WHERE keyword could not be used with aggregate functions
Remember, WHERE for conditions before grouping, HAVING for conditions after grouping.

Syntax:
```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value;
```


## SQL HAVING clause example
```sql
-- Which customers have never made an order;
SELECT  C.CustomerID,
		C.CompanyName,
		COUNT(O.OrderID) [Total Count of Orders]
FROM Customers C
	LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CompanyName
HAVING COUNT(O.OrderID) = 0;
```


## SQL LIKE Operator & Wildcards
The LIKE operator is used to search for a specified pattern in a column.
Wildcard characters are used with the SQL LIKE operator.
We will need the following:
1. %  A substitute for zero or more characters
2. _  A substitute for a single character


## Examples
```sql
-- Returns Customers from Bern, Berlin and Bergamo
SELECT * FROM Customers
WHERE City LIKE 'ber%';
-- Returns Customers from Bruxelles, Resende, Buenos Aires etc.
SELECT * FROM Customers
WHERE City LIKE '%es%';  
-- Returns Customers with regions CA and WA
select *
from Customers
where Region like '_A'
```


## SQL ROUND function
The ROUND() function is used to round a numeric field to the number of decimals specified.

Syntax
```sql
SELECT ROUND(column_name,decimals) FROM table_name;
```

Example
```sql
-- Find the total price for order with orderid = 10266 and productID = 12
SELECT ROUND((UnitPrice * Quantity * (1 - Discount)), 2), *
FROM [Order Details]
WHERE OrderID = 10266;
```


## SQL SELECT TOP Clause
The SELECT TOP clause is used to specify the number of records to return.

Syntax
```sql
SELECT TOP number|percent column_name(s)
FROM table_name;
```
### SQL SELECT TOP Equivalent in MySQL
MySQL Syntax

```MySQL
SELECT column_name(s)
FROM table_name
LIMIT number;
```


## SQL ISNULL Function
Replaces NULL with the specified replacement value.

Syntax
```sql
ISNULL ( check_expression , replacement_value )  
```


## SQL ISNULL Examples
```sql
SELECT ISNULL(NULL, 'TechOnTheNet.com');
--Result: 'TechOnTheNet.com'
SELECT ISNULL('CheckYourMath.com', 'TechOnTheNet.com');
--Result: 'CheckYourMath.com'

SELECT ISNULL(NULL, 45);
--Result: 45
SELECT ISNULL(12, 45);
--Result: 12

SELECT ISNULL(NULL, '2014-05-01');
--Result: '2014-05-01'
SELECT ISNULL('2014-04-30', '2014-05-01');
--Result: '2014-04-30'
```


## SQL Variables
Object that holds a single data value of a specified type

Uses:
* Holds data for later use
* Counters
* As inputs or outputs to stored procedures, functions

Syntax:
```sql
DECLARE <@var_nam> <data_type>
```


## SQL Variables examples
```sql
DECLARE @i int;
DECLARE @stringVar VARCHAR(200);
DECLARE @myDate DATETIME;
```


## SQL Variables Assigning Values
### SET
Used to set a value to a scalar (not table) variable.
Syntax:
```sql
DECLARE <@var_nam> <data_type>;
SET <@var_nam> = value;
```

Example:
```sql
DECLARE @i INT;
SET @i = 10;
SET @stringVar = 'Coding Bootcamp';
```


## SQL Variables Assigning Values
### SELECT
* Used to set a value to a scalar variable
* Can be also used for setting values to multiple variables at once

Syntax:
```sql
SELECT @i = 1,
       @stringVar = 'Coding Bootcamp';
       @myDate = '2016-10-24'
```


## SET vs SELECT for setting values to variables
* SET is the ANSI standard for variable assignment, SELECT is not
* SET can only assign one variable at a time, SELECT can make multiple assignments at once
* If assigning from a query, SET can only assign a scalar value. If the query returns multiple values/rows then SET will raise an error. SELECT will assign one of the values to the variable and hide the fact that multiple values were returned
* When assigning from a query if there is no value returned then SET will assign NULL, where SELECT will not make the assignment at all (so the variable will not be changed from its previous value)
* As far as speed differences - there are no direct differences between SET and SELECT. However SELECT's ability to make multiple assignments in one shot does give it a slight speed advantage over SET.


## Temporary tables
Can be used as a workspace for intermediate results.

They can be
* Local temporary tables (starting with #)
* Global temporary tables (starting with ##)
* Table variables (starting with @)
* Other (not in our lesson's scope)


## TABLE Variables
* Used in the scope of the routine or batch within they are defined
* Cause less recompiles
* Not affected by rollbacks

Syntax example:
```sql
DECLARE @myStudents TABLE
		(ID int,
		LastName VARCHAR(50),
		FirstName VARCHAR(50)
		);
```


## Temporary tables
* Support every single feature a database table can feature
* Can be altered after creation
* Can have multiple indexes
* Can be used with Dynamic SQL
* Can be local (#) or global (##)

Syntax example:
```sql
CREATE TABLE #myStudents
		(ID int,
		LastName VARCHAR(50),
		FirstName VARCHAR(50)
		);
```
Remember, we may have to drop it manually!


### SELECT INTO
We can take the results of a query and insert them into a NEW temporary table.
The result set must have uniquely named columns that will be the new temporary table's columns.

Syntax:
```sql
-- Create a temporary table that contains the id of each order and the total revenues of that order
SELECT O.OrderID, SUM(ROUND((UnitPrice * Quantity * (1 - Discount)), 2)) [Final Price]
INTO #tempFinalPrices
FROM Orders O
	INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID;

SELECT * FROM #tempFinalPrices;

DROP TABLE #tempFinalPrices;
```


## SQL IN Operator
The IN operator allows you to specify multiple values in a WHERE clause.

Syntax:
```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1,value2,...);
```


## SQL IN Operator example
```sql
-- How many objects has each customer from Canada, UK and USA ordered each year?
SELECT C.CompanyName, C.Country, YEAR(O.OrderDate) AS [Year], SUM( OD.Quantity ) [Total Quantity]
FROM Customers C
	INNER JOIN Orders O ON C.CustomerID = O.CustomerID
	INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE C.Country IN ('UK', 'USA', 'Canada')
GROUP BY C.CompanyName, YEAR(O.OrderDate), C.Country
ORDER BY C.CompanyName, YEAR(O.OrderDate);
```


## Subqueries
Queries embedded in queries.

Example:
```sql
-- Find the name of the company that placed order 10290.
SELECT CompanyName
FROM Customers
WHERE CustomerID = (SELECT CustomerID
			FROM Orders
			WHERE OrderID = 10290);
```
Better example why to use a subquery:

Example:
```sql
-- Find the Companies that placed orders in 1997
SELECT CompanyName
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
			FROM Orders
			WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31');
```


## VIEWS
A view is a virtual table. A view is nothing more than a SQL statement that is stored in the database
with an associated name. A view is actually a composition of a table in the form of a predefined SQL query.

Syntax
```sql
CREATE VIEW view_name AS
SELECT column1, column2.....
FROM table_name
WHERE [condition];
```


## VIEWS Example
```sql
CREATE VIEW [Current Product List] AS
SELECT ProductID,ProductName
FROM Products
WHERE Discontinued=0;

SELECT * FROM [Current Product List];
```


## Tips and Tricks for the excersises
* Use aliases for table names (e.g. SELECT C.CompanyName FROM Customers AS C)
* Use DISTINCT for distinct results (for checking purposes)
* BEGIN TRANSACTION ... ROLLBACK from INSERT, UPDATE, DELETE commands
* Use @@ROWCOUNT to check number of affected rows
* Always use WHERE clause for DELETE and UPDATE commands
* Try to never use CURSORS and WHILE loops
* Prefer table variables to temporary tables

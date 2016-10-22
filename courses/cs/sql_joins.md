## SQL Joins
SQL Join is used to combine rows from two or more tables.
Join is based on a common field between the tables.


###Example
Northwind Database has table Orders and table Customers. 
Orders table can be joined to the Customers table with column CustomerID (Foreign key).
So, if we would like to know the name of the company behind each order we could write:

```sql
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Customers
	INNER JOIN Orders ON Customers.CustomerID = Orders.OrderID
ORDER BY Customers.CompanyName; 
``` 


## INNER JOIN
* Most common join
* Selects ALL rows from BOTH tables WHERE a match between the columns in BOTH tables exists.
Syntax:

```sql
SELECT column_name(s)
FROM table1
    INNER JOIN table2 ON table1.column_name=table2.column_name;
``` 
or:

```sql
SELECT column_name(s)
FROM table1
    JOIN table2 ON table1.column_name=table2.column_name;
``` 
PS! INNER JOIN is the same as JOIN.


## INNER JOIN Venn Diagram
![](media/sql_innerjoin.gif)


## LEFT JOIN 
Returns ALL rows from left table with MATCHING rows in right table.
Returns NULL for the right side when there is no match.
Syntax:

```sql
SELECT column_name(s)
FROM table1
    LEFT JOIN table2 ON table1.column_name=table2.column_name;
``` 
or:

```sql
SELECT column_name(s)
FROM table1
    LEFT OUTER JOIN table2 ON table1.column_name=table2.column_name;
``` 
PS! In some databases LEFT JOIN is called LEFT OUTER JOIN.


## LEFT JOIN Example
```sql
-- Get all customers and their orders.
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Customers
	LEFT OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CompanyName;
```


## LEFT JOIN Venn Diagram
![](media/sql_leftjoin.gif)


## RIGHT JOIN 
Returns ALL rows from right table with MATCHING rows in left table.
Returns NULL for the left side when there is no match.
Syntax:
```sql
SELECT column_name(s)
FROM table1
    RIGHT JOIN table2 ON table1.column_name=table2.column_name;
``` 
or:
```sql
SELECT column_name(s)
FROM table1 
    RIGHT OUTER JOIN table2 ON table1.column_name=table2.column_name;
``` 
PS! In some databases RIGHT JOIN is called RIGHT OUTER JOIN.


## RIGHT JOIN Example
```sql
-- Get all orders and the relevant customers.
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Orders
	RIGHT OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CompanyName;
```


## RIGHT JOIN Venn Diagram
![](media/sql_rightjoin.gif)



## FULL OUTER JOIN 
Returns ALL rows from left side and ALL from right side.
Combines the results of both LEFT and RIGHT joins.
Syntax:

```sql
SELECT column_name(s)
FROM table1
    FULL OUTER JOIN table2 ON table1.column_name=table2.column_name;
``` 


## FULL JOIN Examples
```sql
-- Get all orders and all customers, combined.
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Orders
	FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.OrderID
ORDER BY Customers.CompanyName;
```


## FULL JOIN Venn Diagram
![](media/sql_fulljoin.gif)


## GROUP BY Statement
Used in conjuction with aggregate functions to group the result set by one or more columns
Syntax:
One grouped column
```sql
SELECT column_name, aggregate_function(column_name2)
FROM table_name
WHERE column_name operator value
GROUP BY column_name;
```
More than one grouped columns
```sql
SELECT column_name1, column_name2, aggregate_function(column_name3)
FROM table_name
WHERE condition
GROUP BY column_name1, column_name2;
```


##GROUP BY Example
```sql
-- How many orders has each customer from UK placed?
SELECT Customers.CompanyName, COUNT(Orders.OrderID)
FROM Customers	
	LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.Country = 'UK'
GROUP BY Customers.CompanyName;
```


## GROUP BY Example with more columns
```sql
-- How many objects has each customer from UK ordered each year?
SELECT Customers.CompanyName, YEAR(Orders.OrderDate), SUM( [Order Details].Quantity )
FROM Customers	
	INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Customers.Country = 'UK'
GROUP BY Customers.CompanyName, YEAR(Orders.OrderDate)
ORDER BY Customers.CompanyName, YEAR(Orders.OrderDate);
```


## SQL Aliases
Used to temporarily rename a table or column heading
### SQL Alias Syntax for Columns
```sql
SELECT column_name AS alias_name
FROM table_name;
```
### SQL Alias Syntax for Tables
```sql
SELECT column_name(s)
FROM table_name AS alias_name;
```


## SQL Aliases example
```sql
-- How many objects has each customer from UK ordered each year and how much did the pay?
SELECT C.CompanyName AS [Company Name], 
		YEAR(O.OrderDate) AS [Year of Order], 
		SUM( OD.Quantity ) AS [Total Quantity], 
		SUM( OD.Quantity * OD.UnitPrice ) AS [Total Revenues]
FROM Customers AS C
	INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
	INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
WHERE C.Country = 'UK'
GROUP BY C.CompanyName, YEAR(O.OrderDate)
ORDER BY C.CompanyName, YEAR(O.OrderDate);
```





## INSERT INTO Statement
Used to insert new records in a table
Syntax:
Insert with values for ALL columns 
```sql
INSERT INTO table_name
VALUES (value1,value2,value3,...);
```
or
Insert with values only for specified columns
```sql
INSERT INTO table_name (column1,column2,column3,...)
VALUES (value1,value2,value3,...);
```


## INSERT INTO Statement example
```sql
INSERT INTO  Suppliers(CompanyName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway'); 
```


## DELETE Statement
Deletes one or more rows from a table
Syntax:
```sql
DELETE FROM table_name
WHERE some_column=some_value; 
```

Attention: If no WHERE clause is specified, ALL records will be deleted!


## DELETE Statement example
```sql
-- Deletes from table Suppliers all records with CompanyName = 'Cardinal'

DELETE FROM Suppliers
WHERE CompanyName = 'Cardinal'; 
```


## UPDATE Statement
Updates existing records
Syntax:
```sql
UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;
```

Attention: If no WHERE clause is specified, ALL records will be updated!


## UPDATE Statement example
```sql
-- Updates the phone with new value for all companies named 'Cardinal'
UPDATE Suppliers
SET Phone = '(0)2-953010'
WHERE CompanyName = 'Cardinal'
```

## NULL values
* NULL values represent missing unknown data
* By default a column can hold NULL values
* NULL is different from zero
* To check for NULL we use IS or IS NOT NULL instead of = or <>.
Syntax example:

```sql
-- Get all customers for whom we have fax numbers.
SELECT * 
FROM Customers 
WHERE Fax IS NOT NULL;

-- Get all customers for whom we do not have fax numbers.
SELECT * 
FROM Customers 
WHERE Fax IS NULL;
```






## Tips and Tricks for the excersises
* Use aliases for table names (e.g. SELECT C.CompanyName FROM Customers AS C)
* Use DISTINCT for distinct results (for checking purposes)
* BEGIN TRANSACTION ... ROLLBACK from INSERT, UPDATE, DELETE commands
* Use @@ROWCOUNT to check number of affected rows 
* Always use WHERE clause for DELETE and UPDATE commands
* Try to never use CURSORS and WHILE loops 
* Prefer table variables to temporary tables 
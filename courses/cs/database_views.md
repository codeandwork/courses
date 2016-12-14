## Database Views


## Database View
* Is a virtual table or logical table which is defined as a SQL SELECT query with joins. 
* A database view is similar to a database table, which consists of rows and columns
  * Ability to query data against it
* A database view is dynamic because it is not related to the physical schema
* The database system stores database views as a SQL SELECT statement with joins
  * When the data of the tables changes, the view reflects that changes as well


## Advantages of a database View
* Views can represent a subset of the data contained in a table and limit data access to specific users
  * A view can limit the degree of exposure of the underlying tables to others
  * A given user may have permission to query the view, while denied access to the rest of the base table
* A database view allows you to simplify complex queries
* Views can join and simplify multiple tables into a single virtual table


## Advantages of a database View
* Views can hide the complexity of data
* Views can act as aggregated tables, where the database engine aggregates data (sum, average, etc.) and presents the calculated results as part of the data
* Views take very little space to store
  * The database contains only the definition of a view, not a copy of all the data that it presents


## Disadvantages of a database View
* Performance 
  * Querying data from a database view can be slow especially if the view is created based on other view
* Tables dependency
  * You create a view based on underlying tables of the a database. Whenever you change the structure of those tables that view associated with, you have to change the view as well


## SQL CREATE VIEW Statement
* A view is a virtual table based on the result-set of an SQL statement
* You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if the data were coming from one single table

Syntax
```
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition
```


## SQL CREATE VIEW Examples 1/6
* The view "Current Product List" lists all active products (products that are not discontinued) from the "Products" table. 
* The view is created with the following SQL
```
CREATE VIEW [Current Product List] AS
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued=No
```
* We can query the view above as follow
SELECT * FROM [Current Product List]


## SQL CREATE VIEW Examples 2/6
* The following view calculates the total sale for each category in 1997. 
* The view is created with the following SQL
```
CREATE VIEW [Category Sales For 1997] AS
SELECT DISTINCT CategoryName, Sum(ProductSales) AS CategorySales
FROM [Product Sales for 1997]
GROUP BY CategoryName
```
* We can query the view above as follow
SELECT * FROM [Category Sales For 1997]


## SQL CREATE VIEW Examples 3/6
* Customer (cust, name, address)
* Product (prod, name, price)
* Sales(cust, prod, day, month, year, state, amount)
Per each product and for the sales during 2016, display the total product sales per month as percentage of product’s yearly sales


## SQL CREATE VIEW Examples 4/6
```
create view V1 (prod, month, sum_amount) as                                    
select prod, month, sum(amount)
from sales
where year=2016
group by prod, month

create view V2(prod, sum_amount) as                            
select prod, sum(amount)
from sales
where year=2016
group by prod

select V1.prod, V1.month, V1.sum_amount/V2.sum_amount
from V1, V2
where V1.prod=V2.prod
```


## SQL CREATE VIEW Examples 5/6
* Customer (cust, name, address)
* Product (prod, name, price)
* Sales(cust, prod, day, month, year, state, amount) 
Display for each customer the total sales in «ΝΥ», «CA», and «NJ»


## SQL CREATE VIEW Examples 6/6
```
CREATE VIEW V1 (cust, NYamount) AS
SELECT cust, sum(amount) 
FROM Sales
WHERE state=‘NY’ 
GROUP BY cust
```
```
CREATE VIEW V2 (cust, CAamount) AS
SELECT cust, sum(amount) 
FROM Sales
WHERE state=‘CA’ 
GROUP BY cust
```
```
CREATE VIEW V3 (cust, NJamount) AS
SELECT cust, sum(amount) 
FROM Sales
WHERE state=‘NJ’ 
GROUP BY cust
```
```
SELECT V1.cust, NYamount, 
	   CAamount, NJamount 
FROM V1, V2, V3
WHERE V1.cust=V2.cust AND V2.cust=V3.cust
```


## SQL Updating a View 1/2 
To update a view, we use the following syntax:
```
CREATE OR REPLACE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition
```


## SQL Updating a View 2/2 
* To add the “Category” column to the “Current Product List” view, we add the following SQL:
```
CREATE OR REPLACE VIEW [Current Product List] AS
SELECT ProductID, ProductName,Category
FROM Products
WHERE Discontinued=No
```


## SQL Dropping a View
* To delete a view, we use the following command:
```
DROP VIEW view_name
```
* Example: To drop view ‘Current Product List’ we use the following command:
```
DROP VIEW [Current Product List]
```


## Exercises


## Exercise 1
* Create a view in sakilaDB (i.e. actor_sample) that contains the values from columns ‘actor_id’, ‘first_name’, ‘last_name’ from table ‘actor’
* Display view’s content


## Exercise 2
Remove the “last_name” column from the “actor_sample” view


## Exercise 3
* Per each customer (id) and for its rentals, display the total customer’s rentals per month as percentage of customer’s yearly rentals


## Exercise 4
* Per each customer (display only the id) and for its payments, display the total customer’s payments per month as percentage of customer’s yearly payments


## Exercise 5
* Per each customer (first name & last name) and for its payments, display the total customer’s payments per month as percentage of customer’s yearly payments
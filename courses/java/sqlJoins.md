## SQL Joins


## SELEECT Statement
* A business needs to organize its information
* Database solution
![](media/statement.png)


## WHERE Clause
* The WHERE clause is used to filter records

SQL WHERE Syntax
```
SELECT column_name,column_name
FROM table_name
WHERE column_name operator value;
```


## WHERE Clause
Example
```
SELECT *
FROM Customers
WHERE Country='Mexico';
```


## GROUP BY Statement
* Is used in conjunction with the aggregate functions (SUM, COUNT, etc.) to group the result-set by one or more columns

SQL GROUP BY Syntax
```
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name;
```


## GROUP BY Statement
Example
```
SELECT customer_id, count(*) 
FROM Customers 
GROUP BY customer_id;
```


## SQL Join
* Joining data together is one of the most significant strengths of a relational database
* An SQL join is a Structured Query Language (SQL) instruction to combine data from two sets of data (e.g. two tables) as long as they are relations
* Tables are “joined” two at a time making a new relation (a table generated on the fly) containing all possible combinations of rows from the original two tables 


## Example 1
![](media/example1.1.png)


## Example 1
![](media/example1.2.png)


## Example 1 - Query 1
![](media/example1.3.png)


## Example 1 - Query 2
![](media/example1.4.png)


## Inner Joining 3 tables
```
SELECT *
FROM Student
INNER JOIN Grade
	ON Student.ID = Grade.ID
INNER JOIN Course
	ON Grade.Code = Course.Code;
```


## Inner Joining 3 tables
![](media/example1.5.png)


## Example 1 - Query 2
![](media/example1.6.png)


## Example 2
![](media/example2.1.png)


## Example 2 - Query 1
![](media/example2.2.png)


## Example 2 - Query 2
![](media/example2.3.png)


## Example 2 - Query 3
![](media/example2.4.png)


## Example 2 - Query 4
![](media/example2.5.png)


## Sakila Sample Database
* The Sakila sample database is intended to provide a standard schema that can be used for examples in books, tutorials, articles, samples, and so forth
* Available online: http://dev.mysql.com/doc/sakila/en/
* Download: http://dev.mysql.com/doc/index-other.html 
* Direct link: http://downloads.mysql.com/docs/sakila-db.zip 


## Sakila Sample Database
![](media/sakila1.png)


## Sakila Sample Database
![](media/sakila2.png)


## Sakila Sample Database
![](media/sakila3.png)


## Sakila Sample Database
![](media/sakila4.png)


## Sakila Sample Database
![](media/sakila5.png)


## Sakila Sample Database
![](media/sakila6.png)


## Sakila Sample Database
![](media/sakila7.png)


## Sakila Sample Database
![](media/sakila8.png)


## How to see the database schema


## Data Base Schema – Reverse Engineering
![](media/dbschema1.png)


## Data Base Schema – Reverse Engineering
![](media/dbschema2.png)


## Data Base Schema – Reverse Engineering
![](media/dbschema3.png)


## Sakila – DB Schema
![](media/dbschema4.png)


## Sakila – DB Schema
![](media/dbschema5.png)


## Exercise 1
* What are the names of all the languages in the database (sorted alphabetically)? 
```
SELECT language.name
FROM sakila.language
ORDER BY language.name
```


## Exercise 2
* Return the full names (first and last) of actors with “SON” in their last name, ordered by their first name. 
```
select first_name, last_name
from sakila.actor
where  last_name LIKE '%son%‘
order by first_name
```


## Exercise 3
* Find all the addresses where the district is empty, and return these addresses sorted by city_id in ascending order
```
select address
from sakila.address
where district='' order by city_id asc;
```


## Exercise 4 (1/2)
* Display the film title and the film category it belongs to. Return the names of these categories and the name of the film, sorted by the name of the film alphabetically
![](media/dbschema1a.png)


## Exercise 4 (2/2)
* Display the film title and the film category it belongs to. Return the names of these categories and the name of the film, sorted by the name of the film alphabetically
```
select film_category.category_id, film.title from film_category
inner join 	film 
on film_category.film_id=film.film_id
order by film.title
```


## Exercise 5 (1/2)
* Display the film category id and the number of films that belong to each category. Then return the results, sorted by the number of the films that belong to each category
![](media/dbschema1b.png)


## Exercise 5 (2/2)
* Display the film category id and the number of films that belong to each category. Then return the results, sorted by the number of the films that belong to each category
```
Select a.category_id, count(a.film_id) as NumberOfFilms
from film_category a
group by a.category_id
order by NumberOfFilms
```


## Exercise 6 (1/2)
* Display the film category id that contain more than 50 films. Then return the results, sorted by the number of the films that belong to each category
![](media/dbschema1c.png)


## Exercise 6 (2/2)
* Display the film category id that contain more than 50 films. Then return the results, sorted by the number of the films that belong to each category
```
select b.name, count(a.film_id) as NumberOfFilms
from film_category a
inner join category b
on a.category_id=b.category_id
group by a.category_id
having NumberOfFilms>49
order by NumberOfFilms
```


## Exercise 7 (1/2)
* Display the film categories (film_category_id) where the average difference between the film replacement cost and the rental rate larger than 17? 
![](media/dbschema1d.png)


## Exercise 7 (2/2)
* Display the film categories (film_category_id) where the average difference between the film replacement cost and the rental rate larger than 17? 
```
select a.category_id, avg(b.replacement_cost - b.rental_rate) dif
from sakila.film_category a
inner join sakila.film b
on a.film_id=b.film_id
group by a.category_id 
having dif> 17
```


## Exercise 8 (1/2)
* Create a list of films and their corresponding category names 
![](media/dbschema1e.png)


## Exercise 8 (2/2)
* Create a list of films and their corresponding category names 
```
select 	c.`name`, a.title
from 	sakila.film a
inner join sakila.film_category b 
on a.film_id=b.film_id
inner join sakila.category c 
on c.category_id=b.category_id
```


## Exercise 9 (1/2)
* Display the film categories (names) where the average difference between the film replacement cost and the rental rate larger than 17? 
![](media/dbschema1f.png)


## Exercise 9 (2/2)
* Display the film categories (names) where the average difference between the film replacement cost and the rental rate larger than 17? 
```
select c.name, avg(b.replacement_cost) cost, avg(b.rental_rate) rate
from sakila.film_category a
inner join sakila.film b 
on a.film_id=b.film_id
inner join sakila.category c 
on c.category_id=a.category_id
group by a.category_id 
having cost-rate> 17
```


## Exercise 10 (1/2)
* Create a list of actors (id, first, last name) and the number of films by each actor, that have played. Display the results sorted by the number of films each actor has participated in.
![](media/dbschema1g.png)


## Exercise 10 (2/2)
* Create a list of actors (id, first, last name) and the number of films by each actor, that have played. Display the results sorted by the number of films each actor has participated in.
```
select a.actor_id, a.first_name, a.last_name, count(b.film_id) as NumberOfFilms
from sakila.actor a
inner join sakila.film_actor b 
on a.actor_id=b.actor_id
group by a.actor_id, a.first_name, a.last_name
order by NumberOfFilms 
```


## Exercise 11 (1/2)
* Create a list of actors (id, first, last name) and the number of movies by each actor, that have played in movies that had a duration more than 183 minutes. Display the results sorted by the number of films each actor have participated.
![](media/dbschema1h.png)


## Exercise 11 (2/2)
* Create a list of actors (id, first, last name) and the number of movies by each actor, that have played in movies that had a duration more than 183 minutes. Display the results sorted by the number of films each actor have participated.
```
select  a.actor_id, a.first_name, a.last_name, count(b.film_id) NumberOfFilms, c.length
from sakila.actor a
inner join sakila.film_actor b 
on a.actor_id=b.actor_id
inner join sakila.film c 
on 	c.film_id=b.film_id
where c.length>183
group by a.actor_id, a.first_name, a.last_name
order by NumberOfFilms 
```


## Exercise 12 (1/2)
* Find the title of English films having category of ‘Documentary’.
![](media/dbschema1i.png)


## Exercise 12 (2/2)
* Find the title of English films having category of ‘Documentary’.
```
select c.title
from sakila.category a
inner join sakila.film_category b 
on a.category_id=b.category_id
inner join sakila.film c 
on b.film_id=c.film_id
inner join sakila.language d 
on c.language_id=d.language_id
where a.name='Documentary' and d.name='English'
```


## Exercise 13
* List the film id and titles of those films that are not in inventory. 
```
select a.film_id, a.title
from sakila.film a
where a.film_id not in (
select b.film_id from sakila.inventory b);
```


## Exercise 14
* Give an interesting query of your own that is not already in the assignment. The query should involve an aggregation operation, and a nested SELECT. 


## From Class Diagram to ER
* Construct a Class Diagram
  * The University of Toronto has several departments. Each department has professors. Professors must be assigned to one, but possibly more departments. At least one professor teaches each course, but a professor may be on sabbatical and not teach any course. Each course may be taught by one professor. We know of the department name, the professor name, the professor id, the course names, the course schedule, the term/year that the course is taught, the departments the professor is assigned to, the department that offers the course. 


## From Class Diagram to ER
Identify Classes & Associations
These are the abstract or physical “things” in our system which we wish to describe. Find all the nouns and noun phrases in the domain descriptions you have obtained through your analysis. Consider these class candidates. The class candidates are departments, professor, course, and course section. 
![](media/cder1.png)


## From Class Diagram to ER
![](media/cder3.png)


## From Class Diagram to ER
![](media/cder4.png)


## From ER to DB Schema
![](media/cder5.png)


## From ER to DB Schema
![](media/cder6.png)
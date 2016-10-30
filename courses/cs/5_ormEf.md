## ORM

Object-relational mapping is a programming technique for converting data between incompatible type systems in object-oriented programming languages. 


## ORM in simple words

It's good for abstracting the datastore 

(SQL / XML / Json / flat file / whatever) 

out in order to provide an interface that can be used in your code.

It tries to abstract the database access, so if you change from **mssql** to **mysql** you don't have to write your code again (*rudely speaking*).


## ORMs pros

* Huge reduction in code. 
* ORM usually helps you create a developer friendly work flow
* ORM helps you focus on object oriented world and then takes you towards relational world.
* ORM works well when you have simple CRUD cases.
* Facilitates implementing the Domain Model pattern


## ORMs cons

* Slow: if you compare the performance between writing raw SQL & ORM, raw is much faster as there is no translation layer. (can be beaten)
* Complex Queries: when executing **real complex queries** you will find yourself writing raw SQL.
* Tuning: When you know SQL language and your default DBMS well, then you can make queries faster but this is not the same when using ORM.


* Slow: if you compare the performance between writing raw SQL & ORM, raw is much faster as there is no translation layer. (can be beaten)
* Complex Queries: when executing **real complex queries** you will find yourself writing raw SQL.
* Tuning: When you know SQL language and your default DBMS well, then you can make queries faster but this is not the same when using ORM.

### In general
ORM are not so well in addressing relational database specific features.


## The ORM Myth

> “With ORM, the database becomes an implementation detail, and can be ignored”  

-Idiots Ever...


## The ORM Myth 2

> “The database is a bucket”
                
-Me being totally wrong...


## .net orms
Performance of SELECT mapping over 500 iterations - POCO serialization (by StackExchange team)

| Method                            | Duration |
| --------------------------------- |:--------:|
| Hand coded (using a SqlDataReader)|   47ms   |
| Dapper ExecuteMapperQuery<Post>   |   49ms   |
| ServiceStack.OrmLite              |   50ms   |
| NHibernate SQL                    |   104ms  |
| Linq 2 SQL                        |   181ms  |
| Entity framework 6                |   631ms  |
| Entity framework Core 1           |    ? ms  |


## 2 famous orms

NHibernate    
*   Based on Hibernate - Java Project    
*   LGPL Open Source    
*   Been around since 2007 (Hibernate since 2001)
*   Large community

Dapper
*   stack overflow's orm
*   High Performance (close to SqlDataReader)
*   low features


## Entity Framework from asp.net team

Entity Framework is an open source orm framework from asp.net team.
There are 2 versions of it
* Entity Framework 6 (.net framework - Old - matured)
* Entity Framework Core 1 (all .net ecosystem - new - missing features)


## Pros of Entity Framework

* Highly featured (not Entity Framework Core 1)
* Allow complex sql queries with Linq (not very complex sql queries)
* Open source
* Works well with microsoft technologies (e.g. asp.net mvc, asp.net identity)

###Cons of Entity Framework 6
* Speed issues (solved in Entity Framework Core 1)

###Cons of Entity Framework Core 1
* Not yet Highly featured as Entity Framework 6 (we expect to be solved soon)


## InheritanceMapping Strategies

InheritanceMapping Strategies    
●   Table Per Type    
●   Table Per Hierarchy    
●   Table Per Concrete Type 

● Table Per Type
    ● One table for each type, including abstract base types.
    ● Most normalized
    ● Least performant (generally)
    
●   Table Per Hierarchy  
    ● All types crammed into 1 table
    ● Least normalized, cannot enforce NOT NULL at the DB level
    ● NHibernate will let you set NOT NULL, and will try to enforce it, causing issues.
  
●   Table Per Concrete Type 
    ● A table per instantiatable class (base class properties folded into each class)
    ● Balance of the former two options
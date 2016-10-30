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


## Entity Framework

Entity Framework is an open source orm framework from asp.net team. There are 2 versions actively developing

* Entity Framework 6.x (since 2008)

EF 6 is a tried and tested data access technology with many years of features and stabilization
* Entity Framework Core 1.x (since June 2016)

EF Core is a lightweight, extensible, and cross-platform version of Entity Framework. 
EF Core introduces many improvements and new features when compared with EF6.x but some features from EF6 are not yet implemented.


## Pros of Entity Framework

* Highly featured (not EF Core 1)
* Open source
* Allow complex sql queries with Linq (not very complex sql queries)
* Works well with microsoft technologies (e.g. asp.net mvc, asp.net identity)


## Cons of Entity Framework

###Cons of EF 6

* Speed issues (solved in EF Core 1)
* Hard to read generated sql queries

###Cons of EF Core 1

* Not yet Highly featured as EF 6 (we expect to be solved in the next year)


## Domain modeling approaches

* Code First
* Model First
* Database First


## Database First

It enables you to create model from an existing database (like SQL Server, Oracle, DB2 etc.). 

This approach reduces the amount of code that we need to write since it automatically generates code. But it also limits us to work with the structure of the generated code.

Very popular if you have Database designed by DBAs, developed separately or if you have existing Database.


## Model First

It enables you to create model’s Entities, relationships, and inheritance hierarchies on the design surface of empty model (.edmx file) by using entity designer and then create database from it.

It is good if you like to visualize the structure of the data in the application or you don't like writing code or SQL since it will generate for you.

In this approach you have no much control over your entities (auto generated code which is hard to modify) and database. In this way it is rarely used but for small easy projects this approach will be very productive.


## Code First

It enables you to describe a model by using C# classes and then create database from these classes. These classes are called POCO classes.

It provides full control over the code since there is no auto generated code which is hard to modify.

In this approach, your code defines only the database mappings and EF will handle creation of database with its relations.


## Code First Approach step by step

1. Design our Domain Model
2. Create our DbContext
3. Configure the Connection String
4. Do the Migrations
5. Have Fun


## 1. Design our Domain Model 1/2
```csharp
public class Blog
{
    //Primary Key
    public int Id { get; set; }
    public string Title { get; set; }

    //Navigation Property
    public virtual ICollection<Post> Posts { get; set; }
}

public class Post
{
    //Primary Key
    public int Id { get; set; }
    public string Title { get; set; }

    //Foreing Key
    public int BlogId { get; set; }
    //Navigation Property
    [ForeignKey("BlogId")]
    public virtual Blog Blog { get; set; }
}
```

## 1. Design our Domain Model 2/2

When we are designing our model we have in mind some conventions.
Conventions are sets of rules that are used to automatically configure a conceptual model based on class definitions when working with Code First.

```csharp
public class Blog
{
    //Primary Key
    public int Id { get; set; }
    //....
}
```
```csharp
    //Foreing Key
    public int BlogId { get; set; }
    //Navigation Property
    public virtual Blog Blog { get; set; }
```


## 2. Create our DbContext 1/3

DbContext is an important part of Entity Framework. It is a bridge between your domain or entity classes and the database. DbContext is responsible for the following activities:

* **EntitySet**: DbContext contains entity set (DbSet<TEntity>) for all the entities which is mapped to DB tables.
* **Querying**: DbContext converts LINQ-to-Entities queries to SQL query and send it to the database.
* **Change Tracking**: It keeps track of changes that occurred in the entities after it has been querying from the database.


## 2. Create our DbContext 2/3

* **Persisting Data**: It also performs the Insert, Update and Delete operations to the database, based on what the entity states.
* **Caching**: DbContext does first level caching by default. It stores the entities which have been retrieved during the life time of a context class.
* **Manage Relationship**: DbContext also manages relationship using CSDL, MSL and SSDL in DB-First or Model-First approach or using fluent API in Code-First approach.
* **Object Materialization**: DbContext converts raw table data into entity objects.


## 2. Create our DbContext 3/3

```csharp
public class BlogContext : DbContext
{
	public BlogContext() : base ("BlogContextConStringName")
	{
	}

	public DbSet<Blog> Blogs { get; set; }
	public DbSet<Post> Posts { get; set; }
	
	//To access the fluent API you override the OnModelCreating method in DbContext
	protected override void OnModelCreating(DbModelBuilder dbModelBuilder)
	{

	}
}
```


## 3. Configure the Connection String 
Depending on your configuration file 

(app.config || web.config || appsettings.json)

```XML
  <connectionStrings>
    <add name="BlogContextConStringName" connectionString="Server=.;Database=DemoEf6;User Id=sa;password=1234;MultipleActiveResultSets=true"/>
  </connectionStrings>
```
```Json
  { 
      "ConnectionStrings": {
        "BlogContextConStringName": "Server=.;Database=DemoEf6;User Id=sa;password=1234;MultipleActiveResultSets=true"
      }
  }
```


## 4. Do the Migrations 1/2

To begin with Migrations:

1. Enable Migrations
2. Create initial migration and auto-generate database.
3. Update your database for your new migration

To make changes in your model: 

1. Make model changes in your code
2. Add a new migration for model changes
3. Update your database for your new migration


## 4. Do the Migrations 2/2

In the package manager console run the following command.

```cmd
> Enable-Migrations
```
```cmd
> Add-Migration "MyInitialCreate"
```
```cmd
> Update-Database
```

To make changes
```cmd
> Add-Migration "ThisIsNewChange"
```
```cmd
> Update-Database
```


## 5. Have Fun 1/6

Pull data from the Database

```csharp
public static void PullDataFromTheDatabase()
{
    var lstPosts = new List<Post>();
    using (var db = new BlogContext()) {
        lstPosts = db.Posts.ToList();
    }

    foreach (var p in lstPosts) {
        Console.WriteLine($"Post with id {p.Id} has the title {p.Title}.");
    }
}
```


## 5. Have Fun 2/6

Insert in the database a new object

```csharp
public static void InsertDataToTheDatabase()
{
    var blog = new Blog()
    {
        Title = "My Ef Blog",
        Posts = new List<Post>()
        {
            new Post() { Title = "Post One" },
            new Post() { Title = "Post Two" },
        }
    };
    using (var db = new BlogContext())
    {
        db.Blogs.Add(blog);
        db.SaveChanges();
    }
}
```


## 5. Have Fun 3/6

Find Data And Update

```csharp
public static void FindDataAndUpdate()
{
    using (var db = new BlogContext())
    {
        var blog = db.Blogs.Where(b => b.Title == "Post Two").FirstOrDefault();
        blog.Title = "My Awesome Ef Blog";
        db.SaveChanges();
    }
}
```


## 5. Have Fun 4/6

Find Data And Delete it

```csharp
public static void FindDataAndDelete()
{
    using (var db = new BlogContext()) {
        var post = db.Posts.FirstOrDefault(p => p.Title == "Post Two");
        db.Posts.Remove(post);
        db.SaveChanges();
    }
}
```


## 5. Have Fun 5/6

Join 

```csharp
public static void ASimpleJoin()
{
	//don't forget using System.Data.Entity;
	var lstBlogs = new List<Blog>();
	using (var db = new BlogContext()) {
		lstBlogs = db.Blogs.Include(b => b.Posts).ToList();
	}

	foreach (var b in lstBlogs) {
		Console.WriteLine($"This blog {b.Title} has this posts : ");
		foreach (var p in b.Posts) {
			Console.WriteLine($"This is a post title : {p.Title}");
		}
	}
}
```


## 5. Have Fun 6/6

Other stuff Linq can perform

```csharp
public static void CounAllPosts()
{
	using (var db = new BlogContext()) {
		var totalPost = db.Posts.Count();
		Console.WriteLine($"Total posts {totalPost}");
	}
}
```


## Training

* Pluralsight 
* Microsoft Virtual Academy (MVA)
* asp.net website


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
### ORM

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
*   Full featured

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
```cs
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

```cs
public class Blog
{
    //Primary Key
    public int Id { get; set; }
    //....
}
```
```cs
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

```cs
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
    <add name="BlogContextConStringName" connectionString="Server=.;Database=DemoEf6;User Id=sa;password=1234;MultipleActiveResultSets=true"  providerName="System.Data.SqlClient"/>
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

```cs
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

```cs
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

```cs
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

```cs
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

```cs
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

```cs
public static void CounAllPosts()
{
    using (var db = new BlogContext()) {
        var totalPost = db.Posts.Count();
        Console.WriteLine($"Total posts {totalPost}");

        var sumTotalLikesInPosts = db.Posts.Sum(x=>x.Likes);
        Console.WriteLine($"Total posts likes {sumTotalLikesInPosts}");

    	//...
    }
}
```


##Data Annotation -- Fluent API 1/4

* Code First allows you to use your own domain classes to represent the model but it **is not enough to use conventions**.
* We need configurations to tell EF how to map the object model to the database model.
* Code first gives you two ways to add these configurations to your classes. One is using simple attributes called DataAnnotations and the other is using code first’s Fluent API


##Data Annotation -- Fluent API 2/4

Note! DataAnnotations only give you subset of configuration options. Fluent API provides full set of configuration options available in Code First. 

```cs
[Table("Product_Order")]
public class Order
{
    [Key]
    [Column("Order_ID")]
    public int Id { get; set; }
    public DateTime? Date { get; set; }
    public OrderState State { get; set; }
    public string Item { get; set; }
    [Range(1,25)]
    public int Quantity { get; set; }
    [MinLength(3, ErrorMessage="What are you thinking??")]
    [MaxLength(50, ErrorMessage="ERROR!! FAILZ!!!")]
    public string Name { get; set; }
    [NotMapped]
    public string Note { get; set; }

    [InverseProperty("Order")]
    public virtual ICollection<Product> Products { get; set; }
}
```


##Data Annotation -- Fluent API 3/4

The code first fluent API is most commonly accessed by overriding the OnModelCreating method on your derived DbContext. 

```cs
public class BlogContext : DbContext
{
	public BlogContext() : base ("BlogContextConStringName")
	{
	}
	
	//To access the fluent API you override the OnModelCreating method in DbContext
	protected override void OnModelCreating(DbModelBuilder modelBuilder)
	{
        modelBuilder.Entity<User>()
            .Property(u => u.DisplayName)
            .HasColumnName("display_name");
        
        //Configuring a Primary Key
        modelBuilder.Entity<OfficeAssignment>()
            .HasKey(t => t.InstructorID);
        //Configuring the Property to be Required
        modelBuilder.Entity<Department>()
            .Property(d => d.Name).IsRequired();
        //Specifying the Maximum Length on a Property
        modelBuilder.Entity<Department>()
            .Property(d => d.Name).HasMaxLength(50);
	}
}
```


##Data Annotation -- Fluent API 4/4
###A Comparison

```cs

//Data Annotation
[Column("Order_ID")]
public int Id { get; set; }

//Fluent API
modelBuilder.Entity<Order>()
            .Property(d => d.Id).HasColumnName("Order_ID");

```

> yeah, Attributes are very cool...


##Data Annotation Attributes 1/4

| Attribute         | Desription                                                    |
| ----------------- |:-------------------------------------------------------------:|
| Required 			| The Required annotation will force EF (and MVC) to ensure that property has data in it. |
| MinLength 		| MinLength annotation validates property whether it has minimum length of string.|
| MaxLength 		| MaxLength annotation maximum length of property which in turn sets the maximum length of column in the database |
| StringLength 		| Specifies the minimum and maximum length of characters that are allowed in a data field. |


##Data Annotation Attributes 2/4

| Attribute         | Desription                                                    |
| ----------------- |:-------------------------------------------------------------:|
| Table 		    | Specify name of the DB table which will be mapped with the class |
| Column 		    | Specify column name and datatype which will be mapped with the property |
| Index 		    | Create an Index for specified column. (EF 6.1 onwards only) |
| ForeignKey 		| Specify Foreign key property for Navigation property |
| NotMapped 		| Create an Index for specified column. (EF 6.1 onwards only) |


##Data Annotation Attributes 3/4

| Attribute         | Desription                                                    |
| ----------------- |:-------------------------------------------------------------:|
| DatabaseGenerated	| DatabaseGenerated attribute specifies that property will be mapped to Computed column of the database table. So the property will be read-only property. It can also be used to map the property to identity column |
| InverseProperty	| InverseProperty is useful when you have multiple relationships between two classes. |


##Data Annotation Attributes 4/4

| Attribute         | Desription                                                    |
| ----------------- |:-------------------------------------------------------------:|
| Key 				| Mark property as EntityKey which will be mapped to PK of related table. |
| Timestamp 		| Mark the property as a non-nullable timestamp column in the database.|
| Concurrency Check 	| ConcurrencyCheck annotation allows you to flag one or more properties to be used for concurrency checking in the database when a user edits or deletes an entity. |


##Seeding 1/3

* The Entity Framework can automatically create (or drop and re-create) a database for you when the application runs. 
* You can specify that this should be done every time your application runs or only when the model is out of sync with the existing database. 
* You can also write a Seed method that the Entity Framework automatically calls after creating the database in order to populate it with test data. 


##Seeding 2/3

* In the Migrations Folder you will find a Configuration.cs with a Seed Method
* This method will be called after migrating to the latest version. (after calling >Update-Database)
* You can use the DbSet<T>.AddOrUpdate() helper extension method to avoid creating duplicate seed data


##Seeding 3/3

```cs

protected override void Seed(BlogContext context)
{
    context.Blogs.AddOrUpdate(
        b => b.Title,
        new Blog() { Title = "My Ef Blog" },
        new Blog() { Title = "My .Net Blog" }
    );
    
    context.SaveChanges();
}

```


##Sql Server Profiler
Microsoft SQL Server Profiler is a graphical user interface to SQL Trace for monitoring an instance of the Database Engine or Analysis Services. You can capture and save data about each event to a file or table to analyze later.

###Dont forget

>Inspecting your Entity Framework SQL


## Training

* Pluralsight 
    best course -> [entity framework enterprise](https://www.pluralsight.com/courses/entity-framework-enterprise-update)
* Microsoft Virtual Academy (MVA)
* asp.net website

## Defining the term *class*
* Is a blueprint/recipe that creates objects of specific types
* Encapsulates data (fields) and behaviour (methods) in a single unit


## Class representation
<img src=media/sample_class.png width=650 height=400 /></br>
<!-- * //TODO image from c++ book pg.241 -->


## Porting a 'logical' entity into a class
<!-- ![](media/circle.png =400x400) -->
<img src=media/circle.png width=300 height=300 /></br>
* Circle's attributes:
  * x coordinate
  * y coordinate
  * radius


## Class name
```java
public class Circle {
	/* class body */
}
```
* *Public* means that your class will be visible to classes from other packages
* Important: Filenames should have the same name with the class
* Good practice: Class names should begin with a capital letter
<!-- //TODO say about the brackets (everything should be contained there) -->


## Class fields
```java
class Circle {
	/* Fields are defined here*/
	
	/* Point x coordinate */ 
	private int x;
	/* Point y coordinate */
	private int y;
	/* Circle's radius */
	private int radius;
}
```
* Fields have a type, a name and (optionally) an access modifier
* Good practice: 
 * Field names should begin with a lower-case letter  


## Class methods
```java
class Circle {

	/* Point x coordinate */ 
	private int x;
	/* Point y coordinate */
	private int y;
	/* Circle's radius */
	private int radius;

	/* Methods are defined here */

	/* Returns the x coordinate */
	public int getX() { return x; }
	/* Returns the y coordinate */
	public int getY() { return y; }
	/* Returns the radius */
	public int getRadius() { return radius; }
}
```
* Methods, like fields, have a type, a name and (optionally) an access modifier 


## Packages
<!-- ![](media/packages.png) -->
<img src=media/packages.png width=500 height=500 /></br>


## Access modifiers
* *Public* - visible to all classes
* *Private* - visible only inside the current class
* *Protected* - Visible only to subclasses of the current class
<br><br>
* Good practices:
 * All fields should be *private*
 * Methods that are not design to interact with other classes should also be *private*


## Getters and setters methods
* Fields should be accessed and modified only through dedicated methods
```java
class Circle {

	/* x and y coordinates */
	private int x;
	private int y; 

	/* getters and setters methods */
	public void setX(int x) { this.x = x; }
	public int getX() { return this.x; }
	public void setY(int y) { this.y = y; }
	public int getY() { return this.y; }
}
```


## Getters and setters methods
* Recommended way to access or modify fields
```java
Circle c = new Circle();
c.setX(5);
c.setY(3);
System.out.println("Hello, I'm circle (" + p.getX() + "," + p.getY() + ")");
```
```java
I'm circle (5,3)
```
* And never directly
```java
Circle c = new Circle();
c.x = 5;
c.y = 3;
System.out.println("Hello, I'm circle (" + p.x + "," + p.y + ")");
``` 


## Anatomy of a method
```java
public double getPerimeter(double pi) {
	double perimeter = 2*pi*this.radius;
	return perimeter; 
}
```
* *public* : access modifier
* *double* : type
* *getPerimeter* : name
* *pi* : parameter of type double
<br><br>
* The following line is the method's **signature**
```java
public double getPerimeter(double pi)
```


## Non-returning methods
*Void* methods perform an operation without returning a value
```java
public void calculatePerimeter(double pi) {
	double perimeter = 2*pi*this.radius;
	System.out.println("Perimeter is " + perimeter); 
}
```


## Constructor - a special method!
```java
/* default constructor */
Circle() {
	this.x = this.y = 0;
	this.radius = 3;
}
```
* Creating an object of type Circle:
```java
	Circle c = new Circle();
```
* Constructors inherit the class's access modifier
* Constructors should have the same name with the *class*


## Overloaded constructor
```java
/* Overloaded constructor */
Circle(int x, int y) {
	this.x = x;
	this.y = y;
	this.radius = 3;
}
```
* Creating an object of type Circle:
```java
	Circle c = new Circle(4,4);
```
* Similarly, the above constructor with the *super* call!
```java
/* Overloaded constructor calling the default 
   constructor with the use of super */
Circle(int x, int y) {
	super();
	this.x = x;
	this.y = y;
}
```


## Destructor method
```java
/** Circle destructor */
public void finalize() {
    System.out.println("Circle (" + 
    	this.x +"," + this.y + "," + this.radius + ") deleted");
}
```
* Release the memory and run the *garbage collector*
```java
c = null;
System.gc();
```
* Results to
```java
Circle (5,5,10) deleted
```
* The garbage collection is a process that identifies for unused object, or no longer referenced by any part of your program and reclaims the allocated memory


## Copying objects
```java
Circle c1 = new Circle(5,2);
Circle c2 = c1;
```
* What are the perimeters of **c1** and **c2**?


## Memory allocation
<img src=media/memory.svg width=700 height=450 /></br>
```java
Circle c1 = new Circle();
Circle c2 = new Circle();
c2 = c1;
```


## Copying objects
```java
c1.calculatePerimeter(3.14);
c2.calculatePerimeter(3.14);
```
* Results to:
```java
Perimeter is 18.84
Perimeter is 18.84
```


## Copying objects
```java
Circle c1 = new Circle(5,5);
Circle c2 = c1;
c2.setRadius(10);
c1.calculatePerimeter(3.14);
c2.calculatePerimeter(3.14);
```
* Are the perimeters equal or not?


## Copying objects
```java
Circle c1 = new Circle(5,5);
Circle c2 = c1;
c2.setRadius(10);
c1.calculatePerimeter(3.14);
c2.calculatePerimeter(3.14);
```
* Results to:
```java
Perimeter is 18.84
Perimeter is 18.84
```


## Copy constructor
```java
public Circle copy() {
	Circle new_circle = new Circle();
	new_circle.x = this.x;
	new_circle.y = this.y;
	new_circle.radius = this.radius;
	return new_circle;
}
```
* Copying/cloning an object process:
 * Create a new object of type circle
 * Assign the values of the old object to the new
 * Return the new object
```java
Circle c = new Circle(5,2);
Circle c2 = c.copy();
```


## Static fields and methods
```java
class Circle {
	/* counts the number of the created circles */
	private static int count;

	/* Constructor */
	Circle() {
		count += 1; // increase count by one after creating a new circle 
	}
}
```
* *Static* fields are common for all instances of the class
```java
Circle c1 = new Circle();
Circle c2 = new Circle();
Circle c3 = new Circle();
System.out.println("c1 count is " + c1.count); //c1.count gives a warning. Why?
System.out.println("c2 count is " + count);
System.out.println("c3 count is " + count);
```


## Static fields and methods (continued)
```java
c1 count is 3
c2 count is 3
c3 count is 3
```
```java
public static int getCount() { return count; }
```
* *Static* methods can access only static fields
* *Static* methods can be called by other classes only by the name of the class
```java
System.out.println("Number of existing circles : " 
								+ Circle.getCount());
```
```java
Number of existing circles : 3
```


## Memory allocation of static fields
<img src=media/memory_static.svg width=350 height=550 /></br>



## The *final* modifier
* In our previous Circle class example we add the following field
```java
/* The unique id of a circle */
private final int id;
```
* We are obliged to initialize the field *id*
```java
/* Modified constructor */
Circle() {
	this.x = 0;
	this.y = 0;
	this.radius = 3;
	count += 1;
	/* we assign the current count as the circle's id */
	id = count; 
}
```


## The *final* modifier (continued)
* As in the *static* example, we execute the following commands 

```java
Circle c1 = new Circle();
Circle c2 = new Circle();
Circle c3 = new Circle();

System.out.println("c1 count is " + c1.getCount() +  ", id is " + c1.getId());
System.out.println("c2 count is " + c2.getCount() +  ", id is " + c2.getId());
System.out.println("c3 count is " + c3.getCount() +  ", id is " + c3.getId());
```
* Which result the following output
```java
c1 count is 3, id is 1
c2 count is 3, id is 2
c3 count is 3, id is 3
```


## The *Utility* class
```java
public final class MyUtilities {
	/* Reads the content of a txt file and store in a list which returns*/
	public static List<String> readFile (String filepath) {
		/* ...read file... */
		return list;
	}

	/* Stores the content of a list in a txt file */ 
	public static void writeFile (List<String> list, String filepath) {
		/* ...store content to file... */
	}
}
```
* **Utility classes should be used with care**
 * Include only general functionalities that are common to many other classes 


## Singleton
```java
class DBConnector
{
	/* unique instance of the class */
	private static DBConnector instance;

	/* Private constructor of the class */
	private DBConnector()
	{
		... 
	}

	/* method that creates (if not initialized)
	and returns the unique instance of the class */
	public static  DBConnector getInstance()
	{
		if (instance == null)
			instance = new DBConnector();

		return instance;
	}

	/* sample method */
	public void connect()
	{
		...	
	}
}
```


## Classes as custom types
```java
class Laptop {
	/* The serial number of the product */
	private String serial_number;
	/* Custom class representing the central processor unit */
	private Cpu cpu;
	/* Custom class representing the random access memory */ 
	private Memory memory;
	/* Custom class representing the Operating system license
	   The license is bound to this Laptop object */
	private OSLicense os_license;
}
```


## Classes as custom types (continued)
```java
class Laptop {
	/* Constructor */
	Laptop () {
		this.serial_number = "XXXX-XXXX-XXXX-XXXX";
		this.cpu = new Cpu();
		this.memory = new Memory();
		this.os_licence = new OSLicence(); 
	}
}
```
* Not initialized objects have the *null* value


## *Deep* vs *shallow* copies
* Complete (*deep*) copy:
<br>
When copying objects (with the copy constructors) ensure that the custom type field are also copied with their appropriate copy constructor.
* Otherwise you create a copy only of the top level object and its custom type fields are reused (like in slide 17 "Memory allocation") 


## Relationship among classes
<img src=media/laptop_cd.png width=660 height=510 /></br>


## Simple dependency
<img src=media/dependency.png width=700 height=300 /></br>


## Association
<img src=media/association.png width=700 height=300 /></br>
* ClassA holds an instance of ClassB
* This instance will be destroyed upon ClassA's instance destruction


## Aggregation
<img src=media/aggregation.png width=700 height=300 /></br>
* ClassA, like in *Association* holds an instance of ClassB
* The aggregated object *b* can live even after the destruction of the ClassA's instance 


## Composition
<img src=media/multiplicity.png width=700 height=300 /></br>
* Any object *a* holds multiple objects of type *ClassB*


## References
* Thinking in Java (4th Edition) - Bruce Eckel
* Oracle Certified Professional Java SE 8 Programmer Exam 1Z0-809, A Comprehensive OCPJP 8 Certification Guide - S. G. Ganesh, Hari Kiran, Tushar Sharma
* Java Programming - wikibooks ([link](https://en.wikibooks.org/wiki/Java_Programming))
* Java™ Platform, Standard Edition 8 API Specification ([link](https://docs.oracle.com/javase/8/docs/api/))


## Exercise 1
* **Step 1**: Create a class that represents a circle shape. The class should be named as *Circle* and include the following three integer fields:
 * *x* : the x coordinate
 * *y* : the y coordinate
 * *r* : the radius
<br>
Choose appropriate access modifiers for the fields so that they cannot be accessed by other classes. 


## Exercise 1 (continued)
* **Step 2**: Create methods that provide access and modification (getters and setters) to the *x*, *y* and *r* fields. 
 * Choose appropriate names that briefly describe the functionality of each method
 * Choose appropriately the return type and access modifiers of your methods


## Exercise 1 (continued)
* **Step 3**: Create a *constructor* method that initializes the values of your objects. (you can choose values of your preference). 
* **Step 4**: Create a method *print* that prints the details of your circle in the following message
		* I'm a circle at point (x,y) with radius r
Where *x*,*y* and *r* are the values of the current circle


## Exercise 1 (continued)
* **Step 5**: Create a new class named *TestCircles* in the same package (directory) as your *Circle* class.
* Create a *main* method in your *TestCircles* class. In the *main* method:
 * create a circle object,
 * assigns values (of your preference) to the object using the setter methods from *Step 2* and
 * print the details of your circle using the *print* method from *Step 3*
<br><br>
* **Compile and test your program!**


## Exercise 1 (continued)
* **Step 6**: Create two overloaded constructors where
 * the first will take two arguments that initialize the fields *x* and *y* and 
 * the second will take arguments that initialize all three *x*, *y* and *r* fields
In the second overloaded constructor try to make use of the *super* keyword!
* In your *main* method, create objects using each one of the three constructors and print (using the *print* method) your objects


## Exercise 1 (continued)
* **Step 7**: Extend the functionality of your class by adding the following two methods:
 * the *calculateArea* which will calculates and returns the area (π\*radius\*radius, π=3.14) and
 * the *calculatePerimeter* which will calculates and returns the perimeter (2\*π\*radius, π=3.14)
Choose an appropriate type for your method!


## Exercise 1 (continued)
* **Step 8**: Add to your class a *static* and *final* field name *pi* (for π). Initialize its value upon declaring the field. Then, modify your *calculateArea* and *calculatePerimeter* methods of *Step 7* so that they make use of the new *pi* field.


## Exercise 1 (continued)
* **Step 9**: Create a *copy constructor* for your *Circle* class. 
 * Create two circles where the second one will be a copy of the first one
 * Print their details
 * Change the values of the first circle and print again their details
 * What do you observe? Explain your findings according to the *memory allocation* in slide \#17


## Exercise 1 (continued)
* **Step 10**: Create a method name *cocentric* that checks if two circles share the same *centre* (co-centric circles). The method should return *true* if circles are co-centric, or *false* if circles have different centres.
* What is the return type of the method?
* What type of argument should your method have?


## Exercise 1 (continued)
* **Step 11**: Declare a field named *number_of_circles* that is common to all instances of class Circle and counts the number of the created circles. Think carefully of:
 * the type of your *number_of_circles* field,
 * any special modifiers that might need and,
 * the place/places that the value of the field should be incremented  


## Exercise 2
* Create a *class diagram* (on paper or any other tool) for the relation among the following entities:
 * There is a *Car* that has a *CarLicense*. The *CarLicense* cannot exist without a *Car*.
 * There is a *Driver* that owns a *DriversLicense*. The *DriversLicense* cannot exist without a *Driver*.
 * The *Driver* owns a *Car*. The *Car* exists even without a *Driver*.


 ## Exercise 2 (continued)
* Use the correct *UML connectors* for the above relations among the entities
* Create the source code for the above classes and compile it
* All classes should have at least 
	* have at least one constructor, 
	* have at least one *String* field of your preference (like driver's name) and 
	* implement the toString() method that will return the field of each class

 <!-- TODO LIST
Add references
Add Exercise 2
Send Exercise solutions to Stef and Trifonas
  -->
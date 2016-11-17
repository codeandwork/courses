##Who Am I?
![](media/Tushar_slide.png)


##Quick Recap - Principles of Object-orientation
* Abstraction
* Encapsulation
* Modularization
* Hierarchy


##Design Patterns - A Motivating Example
<ul class="fragment">
<li>Bootcamp course and a few stakeholders (Students and Instructors)</li>
<li>Any change in the course must be notified to all the stakeholders</li>
<li class="fragment">Now, think about its implementation
</li></ul>



##Design Patterns - A Motivating Example
![](media/observerMotivation.png)


##Implementation
```java
public class Course {
private Student student;
private Instructor instructor;
	public Course() {
		student = new Student();
		instructor = new Instructor();
	}
	private void updateAll() {
		student.update();
		instructor.update();	
	}
	public void changeTime() {
		//change time
		updateAll();
	}
}
```
```java
public class Program {

	public static void main(String[] args) {
		Course course = new Course();
		course.changeTime();
	}
}
```


##Implementation - Cont.
<ul>
<li>Is it easy to add a new observer (a new Student or a new Instructor)?
<ul><li>You need to make multiple changes</li>
<li class="fragment">What about adding a new category of observers; for example "Organizers"!</li>
</ul></ul>


##Implementation - Take 2
```java
public class Program {

	public static void main(String[] args) {
		Student student = new Student();
		Instructor instructor = new Instructor();
		Organizer organizer = new Organizer();
		
		Course course = new Course();
		course.addObserver(student);
		course.addObserver(organizer);
		course.addObserver(instructor);
		
		course.changeTime();
	}
}
```


##Implementation - Take 2
```java
public class Course extends Observable{

	public void changeTime() {
		//change time
		setChanged();
		notifyObservers();
	}
}
```
```java
public class Student implements Observer{

	@Override
	public void update(Observable o, Object arg) {
	
	}
}
```


##A Motivating Example
* Now, think again about adding new observers.
* Is it easier?


##A Motivating Example
<ul>
<li>Yes? WHY?</li>
<li class="fragment">In the first implementation, Course class is "tightly-coupled" to Student and Instructor classes. While in the second case, Course class is "loosely-coupled" to it's observers.</li>
<br>
<li class="fragment">Congratulations!! You have just learned the first design pattern :)</li>
</ul>


##The Implemented Solution
![](media/observerExample.png)



##Observer Design Pattern
![](media/observer.png)


##Observable and Observer
![](media/ObservableAndObserver.png)


##What About .NET
* IObservable interface
* IObserver interface


##Let Us Define Design Patterns
* <i>Design patterns are descriptions of communicating objects and classes that are customized to solve a general design problem in a particular context. (By Gang of Four)</i>
<br>
<br>
* <i>Design patterns are solutions to commonly occurring design problems.</i>


##Essential Elements of Patterns
<ul>
<li>Name</li>
<br>
<li class="fragment">
Problem
</li>
<ul class="fragment">
<li>
Problem and context</li></ul>
<br>
<li class="fragment">
Solution</li>
<ul  class="fragment">
<li>
Relationships, roles, and responsibilities</li></ul>
<br>
<li class="fragment">
Consequences</li>
<ul class="fragment">
<li>Benefits and liabilities</li>
<li>Tradeoffs</li>
</ul>
</ul>


##Why to Use Patterns
<ul>
<li class="fragment">
Higher design quality </li>
<ul class="fragment">
<li>Flexibility</li>
<li>Changeability</li>
<li>Testability</li>
<li>...</li>
</ul>
<br>
<li class="fragment">Common vocabulary</li>
</ul>


##Categories of Patterns
<ul>
<li><b>Creational</b> - patterns answer how to create and when to create</li>
<ul>
<li>Examples: Factory, Abstract Factory, Builder</li></ul>
<br>

<li class="fragment"><b>Structural</b> - patterns answer how to comppose/structure</li>
<ul>
<li class="fragment">Examples: Adapter, Composite, Decorator</li></ul>
<br>
<li class="fragment"><b>Behavioral</b> - patterns describe how a group of objects cooperate to carry out a task</li>
<ul>
<li class="fragment">Examples: Observer, Strategy, Visitor</li></ul>
</ul>


##Factory Pattern
* <b>Motivation</b>
  * Creating objects without exposing the instantiation logic to the clients
  * Proving a common interface to refer all objects (of a kind)
  


##Factory Pattern
![](media/Factory.png)


##Factory Pattern Example
![](media/FactoryExample.png)


##Factory Pattern
<ul>
<li><b>Benefits</b></li>
<ul>
<li>Separation of concerns - the logic to instantiate is separated</li>
<li>Flexibility - to extend Product hierarchy without affecting clients</li>
</ul>
  
<br>

<li class="fragment"><b>Liabilities</b></li>
<ul>
<li class="fragment">Don't bypass</li></ul></ul>


##Let us extend the Factory Pattern
* <b>Motivation</b>
  * Let us assume you have <u><i>families of objects</i></u> to instantiate
  
  <br>
  * Widget library providing UI elements such as Button and TextBox
  * The library instantiate UI elements based on the platform such as Windows and Linux



##Abstract Factory Pattern
![](media/AbstractFactory.png)


##Abstract Factory Pattern
<ul>
<li><b>Benefits</b></li>
<ul>
<li>Flexibility (Entire product families can be easily exchanged)
</li>
<li>Separation of concerns (Object lifetime management is separated from object use)</li></ul>

<br>
<li class="fragment"><b>Liabilities</b></li>
<ul>
<li class="fragment">GoF Abstract Factory only covers object creation, not object disposal</li>
</ul>
</ul>


##Strategy Pattern
* <b>Motivation</b>
  * Support to more than one algorithm required in many situations:
    * Clients do not want to be dependent on a supplied default algorithm
    * Suitability of an algorithm may change based on the context (input, platform, ...)
    * Integrating new algorithms should be easy (without modifying existing code, if possible)

<br>

* Examples - compression algorithm, sort algorithm


##Strategy Pattern
![](media/Strategy.png)



##Strategy Pattern
<ul>
<li><b>Benefits</b></li>
<ul>
<li>Freedom to chose algorithms
</li>
<li>Easier entensibility</li></ul>

</ul>

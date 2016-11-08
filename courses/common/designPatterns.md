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
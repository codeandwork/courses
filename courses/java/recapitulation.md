## Recapitulation of main points

```java
	public class BootCamp {

		private int variableX;	
		
		BootCamp() {
		}
	
		BootCamp(int variableX) {
			this.variableX = variableX;	
		}	
	}
```

```java
	public static void main(String[] args) {
		BootCamp aRandomVariable = new BootCamp();
		BootCamp aSecondRandomVariable = new BootCamp(2016);
		BootCamp[] anArrayOfBootCamps = new BootCamp[10];
	}
```


## Anatomy of Object creations (1)
```java
	BootCamp myFirstVariable = new BootCamp();
```
* BootCamp = Type of the Object and also the class name
* myFirstVariable = is the name of the reference to an object, through reference we can call methods or variables of a Class
* new BootCamp() = calls the specific constructor "Bootcamp()" that creates an instance of the Class BootCamp


## Anatomy of Object creations (2)
```java
	BootCamp[] anArrayOfBootCamps = new BootCamp[10];
```
* [] = mean it's an array
* BootCamp[] = a declaration for an array of BootCamp objects
* anArrayOfBootCamps = is the name of the reference to an array with objects of Class BootCamp
* new Bootcamp[10] = allocate space in memory for 10 objects type BootCamp


## Constructors (1)
* In one class you can have one to many constructors but with different number of arguments
* If a class does not have any constructor implemented then the default is called 
* If you have at least one constructor you cannot call the default


## Constructors (2)
```java
	public class BootCamp {
		private String name;
		private int year;
		private final int candidates;

		public String getName() { return this.name; }
		public void setName(String name) { this.name = name; }
	
		public int getYear() { return this.year; }	
		public void setYear(int year) { this.year = year; }	
	
		public int getCandidates() { return this.candidates; }	
		public void setCandidates(int candidates) { this.candidates = candidates; }	
}
```


## Constructors (3)
```java
public class BootCamp {
	private String name;
	private int year;
	private final int candidates;

	BootCamp() {
		this.name = "BootCamp";
		this.year = 2016;
		this.candidates = 28;
	}
	
	BootCamp(String name, int year, int candidates) {
		this.name = name;
		this.year = year;
		this.candidates = candidates;
	}
	
	public String getName() { return this.name; }
	public void setName(String name) { this.name = name; }
	
	public int getYear() { return this.year; }	
	public void setYear(int year) { this.year = year; }	
	
	public int getCandidates() { return this.candidates; }	
}
```


## ArrayLists usage
```java
	public class BootCamp {

	private ArrayList<BootCamp> anArrayListOfBootCamps;
	
	BootCamp() {}
	BootCamp(BootCamp[] anArrayListOfBootCamps) {
		anArrayListOfBootCamps = new ArralList<>();
		for (int i=0; i<anArrayListOfBootCamps.length; ++i)
			this.anArrayListOfBootCamps.add(anArrayListOfBootCamps[i]);
	}
	
	public void addBootCamp(BootCamp B) {
			this.anArrayListOfBootCamps.add(B);	
	}

	
	public void removeBootCamp(String name) {
		for (int i=0; i<anArrayListOfBootCamps.size(); ++i) {
			if (this.anArrayListOfBootCamps.get(i).getName().equals(name)) {
				this.anArrayListOfBootCamps.remove(i);
				return;
			}
		}			
	}
	
	public ArrayList<BootCamp> getAnArrayListOfBootCamps() {
		return this.anArrayListOfBootCamps;
	}

	public void setAnArrayListOfBootCamps(ArrayList<BootCamp> newArrayListBootCamp) {
		this.anArrayListOfBootCamps = newArrayListBootCamp;
	}
}
```


## Exercise 
 Link with exercise skeletons: https://drive.google.com/open?id=0B4OihM0nDwEJOHRobVRXdHk4LWs






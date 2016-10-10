## Levels of reuse
* Copy-paste (bad)
* Elements you write
* Adapted elements (polymorphism)
* Third party-elements


## The problem with copy-paste
* Code bloat
* Bug clones
* Increased maintenance cost


## Elements you can write or reuse
* Function, procedure
* Method
* Class
* Package
* Component
* Service
* Process
* System


## The role of a class
* Unit of encapsulation
* Bring together code and data
* Allow multiple instances
* Base for specialization


## Class example
```python
class Counter(object):
    """Return ascending integers
    """
    def count(self):
        """Return next integer
        """
        self.counter = self.counter + 1
        return self.counter
    def __init__(self):
        self.counter = -1
```


## Class test
```python
class CounterTestCase(TestCase):
    def test_starts_from_zero(self):
        c = Counter()
        self.assertEqual(c.count(), 0)
    def test_increments(self):
        c = Counter()
        c.count()
        self.assertEqual(c.count(), 1)
    def test_separate_instances(self):
        a = Counter()
        b = Counter()
        a.count()
        self.assertEqual(a.count(), 1)
        self.assertEqual(b.count(), 0)
```


## Types of polymorphism
* Subtyping polymorphism
  * Implementation inheritance
  * Interface implementation
* Parametric polymorphism
  * Generic classes
* Ad-hoc polymorphism
  * Overloaded methods


## Interface implementation
Subtyping polymorphism
```java
static void printSeries(Iterable<BigInteger> series) {
    for (BigInteger i : series)
        System.out.println(i);
}

class  FibonacciIterator implements Iterator<BigInteger> {
    public boolean hasNext() { return true; }

    public BigInteger next() { /* ... */ }

}
```


## Implementation inheritance
Subtyping polymorphism
```java
abstract class Shape {
    public abstract double area();
    @Override public String toString() {
        return "Shape area=" + area();
    }
}
class Circle extends Shape {
    private double radius;
    @Override public double area() {
        return 2 * Math.PI * radius * radius;
    }
}
class Rectangle extends Shape {
    private double height, width;
    @Override public double area() {
        return height * width;
    }
```


## Generic classes
Parametric polymorphism
```java
class IterableDisplayer<T> {
    Iterable<T> series;

    IterableDisplayer(Iterable<T> s) { series = s; }

    void printSeries() {
        for (T i : series)
            System.out.println(i);
    }
}
```


## Overloaded methods
Ad hoc polymorphism
```java
public class SimpleMath {
    static double atan(double y, double x) {
        return Math.atan2(y, x);
    }
    static double atan(double v) {
        return Math.atan(v);
    }
}
```


## The role of package managers
* Installation
* Dependencies
* Updates
* Repository interface
* Inventory management
* Configuration management


## Package manager examples
* Linux: dpkg/APT RPM/yum
* Windows: Windows Store, NuGet, Cygwin
* OS X: App store, Homebrew, fink
* Python: pip, Anaconda, EasyInstall
* Java: Maven
* .NET: NuGet
* Node.js: npm

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
```py
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
```py
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

## The role of package managers
* Installation
* Dependencies
* Updates
* Inventory management
* Configuration management

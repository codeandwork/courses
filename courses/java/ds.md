## Data Structures
* A particular way of organizing data in a computer so that it can be used efficiently.


## Categories
* Linear data structures
* Trees
* Hashes
* Graphs


## Data Structures in Java
* The core collection interfaces encapsulate different types of collections.
* These interfaces allow collections to be manipulated independently
of the details of their representation.
* Core collection interfaces are the foundation of the Java Collections Framework (JCF).


## The core collection interfaces
<img src=media/coreInterfaces.jpg width=900 height=400 /></br>


## Iterators
* To iterate over a collection
* [Methods and Descriptions](https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html)


## Sets
* [Methods and Descriptions](https://docs.oracle.com/javase/8/docs/api/java/util/Set.html)
* Implemented by:
 * *HashSet*: No guarantees concerning the order of iteration
 * *TreeSet*: Orders its elements based on their values
 * +More


## HashSet VS TreeSet
* *HashSet* offers constant time performance for the basic operations
(add, remove, contains and size).
It does not guarantee that the order of
elements will remain constant over time.
* *TreeSet* guarantees log(n) time cost for the basic operations
(add, remove and contains).
It also guarantees that elements of set will be sorted.
Finally, it offers a few handy methods to deal with
the ordered set like first(), last().


## Lists
* [Methods and Descriptions](https://docs.oracle.com/javase/8/docs/api/java/util/List.html)
* Implemented by:
 * *ArrayList*
 * *LinkedList*
 * *Vector*
 * *Stack*
 * +More


## ArrayList VS LinkedList
* *LinkedList<E>* allows for constant-time insertions or removals,
but only sequential access of elements.
You can walk the list forwards or backwards,
but finding a position in the list takes time proportional to the size of the list.
* *ArrayList<E>* allows fast random read access,
so you can retrieve any element in constant time.
But adding or removing from anywhere but the end requires
shifting all the latter elements over, either to make an opening or fill the gap.


## Queues
* [Methods and Descriptions](https://docs.oracle.com/javase/8/docs/api/java/util/Queue.html)
* Implemented by:
 * *PriorityQueue*
 * and... *LinkedList*
 * +More


## Maps
* [Methods and Descriptions](https://docs.oracle.com/javase/8/docs/api/java/util/Map.html)
* This concept maps keys to values
* Implemented by:
 * *HashMap*
 * *LinkedHashMap*
 * *HashTable*
 * +More


## HashMap VS HashTable
* *Hashtable* is synchronized, whereas HashMap is not.
* Hashtable does not allow null keys or values.
*HashMap* allows one null key and any number of null values.
* One of HashMap's subclasses is *LinkedHashMap*,
so in the event that you'd want predictable iteration order
(which is insertion order by default),
you could easily swap out the HashMap for a LinkedHashMap.


## Exercise 1
* Create *intersection* and *union* for Lists.
* The methods should support ArrayLists, LinkedLists etc.
(Generics are coming).


## Exercise 2
* Create a PriorityQueue that can handle
integers in an ascending order.
The maximum capacity of the queue should be 50.


## Exercise 3
* Find the *intersection* of two given HashMaps that
share the same keys and return it in a new Hashmap.
The values should be the ones coming from the
secnod HashMaps.


## Exercise 4
* Create a method that accepts Java source code as input
and creates a "bracket" fingerprint. A bracket fingerprint
includes all brackets in their order of appearance.
* For instance, consider the following snippet:
```java
for (T t : list1) {
	if(list2.contains(t)) {
		list.add(t);
	}
}
```
* The fingerprint is the following: {{}}.
* Be careful, you should use the most appropriate
data structure.
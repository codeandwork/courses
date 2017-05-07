## Learning objectives
* Define the linear data structure
* Learn the characteristics of the linear data structures
* Learn when and how to use them, according to your needs


## Linear data structures
* Data structure whose element(objects) are sequential and ordered in a way so that:
 * there is only one *first element* and has only one *next element*,
 * there is only one *last element* and has only one *previous element*, while
 * all other elements have a *next* and a *previous* element


## Linear data structures (examples)
* Arrays
* Strings 
* Stack
* Queue
* Lists


## Arrays
* A sequential group of objects of the same type
* Predefined (static) size
* Can access/modify any element of the array 
* Array examples: <br>
```java
	double[] array = new double[10];
	char[] word = {'h', 'e', 'l', 'l', 'o'};
	int[][] 2darray = new int[3][3];
```


## Introduction to the *String* class
* A sequence/group of alphanumeric characters 
* The Java platform provides the **String** class [link to API](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html) to create and manipulate strings
* *String* objects are **immutable** - they cannot change their state after construction


## Concatenating *Strings*
* You can concatenate strings by using the **+** operator
```java
String word = "Hello bootcamp!";
word = word + " Winter is coming...";
System.out.println(word);
```
Results to:
```java
Hello bootcamp! Winter is coming...
```


## StringBuffer
* *Mutable* - can be modified after creation 
* *Synchronized* - multiple threads can access it and modify it without any *side effects* 
* Relatively slow process. Many *locking* and *unlocking* actions will take place
* Code example:
```java
	StringBuffer sb = new StringBuffer();
	sb.append("Hello").append(" StringBuffer!");
	System.out.println(sb.toString());
```


## StringBuilder
* *Mutable* - can be modified after creation
* *Not synchronized* - accessing it and modifying it by more than one threads can produce unexpected results! 
* Much faster than the *StringBuffer* class
* Code example:
```java
	StringBuilder sb = new StringBuilder();
	sb.append("Hello").append(" StringBuilder!");
	System.out.println(sb.toString());
```


## Immutable vs mutable operations
* In the following example we create a sequence of numbers for ```1``` to ```N``` with the three different ways presented in the previous slides

```java
/* Simple String example */
String s = "";
int N = 100000;
for(int i=0; i<N; i++) {
    s += String.valueOf(i);
}

/* StringBuilder example */
StringBuilder builder = new StringBuilder();
for(int i=0; i<N; i++) {
    builder.append(i);
}
s = builder.toString();

/* StringBuffer example */
StringBuffer buff = new StringBuffer();
for(int i=0; i<N; i++) {
    buff.append(i);
}
s = buff.toString();
```


## Immutable vs Mutable operations (2)
* Measuring the separate execution of each solution above resulted to:
```
 	* 78.5 millisecond using the += operand
 	*  3.7 millisecond using StringBuffer
 	*  1.4 millisecond using StringBuilder
```


## Available *String* Constructors 
* Java offers, among others, the following *constructors*
 * *String()*
 * *String(char[] value)*
 * *String(char[] value, int offset, int count)*
 * *String(String original)*
 * *String(StringBuilder builder)*


## Strings as arrays
* Class *String* offers, among others, the following methods (only signature's are presented) for acquiring one or more elements from an object using its *index*<br>
 * *String substring(int beginIndex)*
 * *String substring(int beginIndex, int endIndex)*
 * *char charAt(int index)*
 * *String concat(String string2)*


## *Strings* as arrays (2)
```java
// our test String phrase
String message = "Winter is coming...";

// transform a String to a char[] and print it
char[] charArray = message.toCharArray();
for(int i=0; i<charArray.length; i++)
    System.out.print(charArray[i] + ", ");

// getting the first word of the phrase
String firstWord = message.substring(0, message.indexOf(' '));
System.out.println("First word: " + firstWord);

// checking if our phrase contains the String "sun"
boolean match = message.contains("sun");
System.out.println("Contains 'sun': " + match);

// getting the last word of the phrase
String lastWord = message.substring(message.lastIndexOf(' ') + 1, message.length());
System.out.println("Last word: " + lastWord);
```
The output of the aforementioned 4 prints is the following:
```java
[W, i, n, t, e, r,  , i, s,  , c, o, m, i, n, g, ., ., .]
First word: Winter
Contains 'sun': false
Last word: coming...
```


## *Java Collections Framework*
* The Java collections framework ([JCF](http://docs.oracle.com/javase/8/docs/technotes/guides/collections/overview.html)) is a set of classes and interfaces that implement commonly reusable collection data structures.
* A collection framework supports the consistent and coherent representation and handling of *Collections* regardless of their implementation
* It's a set of *interfaces* that depicts the basic functionalities that any *Collection* should offer


## *Java Collections Framework*
* Reduces the development time and cost
* Switch between implementations
* Easier to use (common for all implementations)
* Easier to develop libraries
* Promotes code *re-usability*


## *Java Collections Framework*
<img src=media/javaCollectionFramework.svg width=800 height=500 /></br>


## The *List* data structure
* Is an ordered collection (sequence) of objects
* It can dynamically modify its size
* User have complete control of the insertion and removal of an element in the list
* The most common implementation of the List model are the *LinkedList* ([link](https://docs.oracle.com/javase/8/docs/api/java/util/LinkedList.html)) the and *ArrayList* ([link](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)). 


## The ArrayList
* *Arraylist* is a class which implements the *List* interface
* *ArrayList* can dynamically grow and shrink according to the needs
* Not synchronised!
* Use *ensureCapacity(int minCapacity)* in case of initially adding many elements and you want to avoid the incremental size increase
```java
// class declaration according to Oracle
public class ArrayList<E> extends AbstractList<E> implements List<E>, .... {
    // ...
}
```


## The ArrayList (Code example)
```java
import java.util.ArrayList;

public class ArrayListDemo {

    public static void main(String[] args) {
        // ArrayList declaration and initialization
        ArrayList<Integer> myList = new ArrayList<>();
        
        // add elements at the end of the list
        myList.add(1);
        myList.add(2);
        myList.add(4);
        System.out.println(myList);
        
        // add an element in a specific position
        myList.add(2, 3);
        System.out.println(myList);
        
        // check if the list contains a number
        System.out.println("List contains 2? " + myList.contains(2) + "\n"
                            + "List contains 0? " + myList.contains(0));
        
        // ensures that the internal array will have 1000 elements capacity
        myList.ensureCapacity(1000);
        
        // remove all elements from the list
        myList.clear();
        System.out.println(myList);
    }

}
```
with output
```
    [1, 2, 4]
    [1, 2, 3, 4]
    List contains 2? true
    List contains 0? false
    []
```


## *Vector* vs *ArrayList*
* Almost equivalent data structures
 * *Vector* ([link](https://docs.oracle.com/javase/8/docs/api/java/util/Vector.html)) is synchronized when
 * *ArrayList* is not synchronized
* If run out of space:
 * *Vector* doubles its size, when
 * *ArrayList* increases its size by 50%


## The *LinkedList* Java class
* Each element (**node**) of a list is comprising of two items
 * the data and 
 * a reference to the next node 
* The last node has a reference to null
* The entry point into a linked list is called the head of the list
```java
// class declaration according to Oracle
public class LinkedList<E> extends AbstractSequentialList<E> implements List<E>, Queue<E>, .... {
    // ...
}
```


## The *Linked-list* data structure
<img src=media/Lists.svg width=800 height=500 /></br>


## The *Linked-list* data structure
<img src=media/Lists2.svg width=800 height=500 /></br>


## The *Linked-list* data structure
<img src=media/Lists3.svg width=800 height=500 /></br>


## CircleList, a linked list example
```java
class Circle {
    /* Linked-list nodes should have a reference of their own
    type showing the next element in the list */
    private Circle next;

    Circle(){ this.next = null; }
    public void setNext (Circle c) { this.next = c; }
    public Circle getNext () { return this.next; }

    /*
    * Here follows the code of the original Circle class 
    * as presented in the Creating Classes session
    */
}

public class CircleList {
    private Circle first_element;
    
    CircleList() { this.first_element = null; }
    
    public void addElement(Circle c) {
        if(this.first_element == null) {
            this.first_element = c; 
        } else {
            Circle current_circle = this.first_element;
            while (current_circle.getNext() != null) {
                current_circle = current_circle.getNext();
            }
            current_circle.setNext(c);
        }
    }

}
```


## The *Stack* data structure
* *Stack* (or *Push-down stack*), in one of the most important *abstract data types* that 
* Offers two functionalities: 
 * *push* (add) and
 * *pop* (remove)  
* Represents a last-in-first-out (lifo) model
* Newer additions have priority in being served!
* Only the last entered element can be extracted
* [*Deque*](https://docs.oracle.com/javase/8/docs/api/java/util/Deque.html) provides similar but enriched functionality
```java
// The Stack class, as defined by Oracle
public class Stack<E> extends Vector<E> implements List<E>, ... { 
    // ... 
}
```


## *Stack* visualisation
<img src=media/Stack.svg width=800 height=500 /></br>


## *Stack* (Code example)
```java
import java.util.Stack;

public class StackDemo {

    public static void main(String[] args) {
        // Stack declarations and initialization
        Stack<Integer> stack = new Stack<>();
        
        // add elements at the top of the stack
        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.push(4);
        System.out.println(stack);
        
        // check the first element
        int top = stack.peek();
        System.out.println("top element: " + top);
        
        // remove and hold the first element
        int first = stack.pop();
        System.out.println("popped element: " + first + "\n" + stack);
        
        // check the first element
        top = stack.peek();
        System.out.println("top element: " + top);
    }

}
```


## The *Queue* data structure
* The *Queue* interface defines a linear collection that supports element insertion and removal at both ends 
* Represents a first-in-first-out (fifo) model
* Older additions will be served first 
```java
public interface Queue<E> extends Collection<E> { ... }
```


## The *Queue* data structure
<img src=media/Queue.svg width=800 height=500 /></br>


## The *Queue* interface (continued)
* It uses two methods for each one of the three aforementioned operations 
 * (insertion) add(e) or offer(e)
 * (extraction) remove() or poll()
 * (inspection) element() or peek()
* The first method of each operation throws an exception upon failure and the second returns a special value


## Adding *Synchronization* feature
* Collections that are not synchronised can be now wrapped in another synchronised object or by applying the following:
```java
List list = Collections.synchronizedList(new LinkedList(...));
```


## References
* Algorithms in Java, Part 1-4 (3rd Edition), R. Sedgewick, Princeton University
* Thinking in Java (4th Edition) - Bruce Eckel
* Oracle Certified Professional Java SE 8 Programmer Exam 1Z0-809, A Comprehensive OCPJP 8 Certification Guide - S. G. Ganesh, Hari Kiran, Tushar Sharma
* Programming II, Notes and Exercises, D. Spinellis, Athens University of Economics and Business, course website ([link](http://www.dmst.aueb.gr/dds/isdi/ds/index.htm)) 
* Java Programming - wikibooks ([link](https://en.wikibooks.org/wiki/Java_Programming))
* Java™ Platform, Standard Edition 8 API Specification ([link](https://docs.oracle.com/javase/8/docs/api/))


## Exercise 1 (Strings and Arrays)
*CaesarsCipher* is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet [link](https://en.wikipedia.org/wiki/Caesar_cipher).
<img src=media/caecars_cipher.png width=600 height=250 /></br>


## Exercise 1 (continued)
* Create a class *CaesarsCipher* that performs the ciphering/deciphering on plain text as described by the Ceacar's cipher. This class should have the following two methods:
 * **String cipher(String message, int numOfShifts)** - ciphers and returns the given message (with the given numOfShifts) 
 * **String decipher(String cipherText, int numOfShifts)** - deciphers and returns the given message (with the given numOfShifts) 
* Create a *TestCaesar* class and test the functionality of your *CaesarsCipher* class


## Exercise 2 - Collections
* Write a method the takes a Stack of Integers and returns a reversed Stack
* Given the following method:

```java
public class ReverseStack {

    public static Stack<Integer> reverse(Stack<Integer> initial) {
        // fill-in your code here
    }
    
    public static void main(String[] args) {
        Stack<Integer> myStack = new Stack<>();
        myStack.addAll(Arrays.asList(new Integer[]{0,1,2,3,4,5,6,7,8,9,10}));
        System.out.println("initial stack: " + myStack);
        System.out.println("reversed stack: " + reverse(myStack));
    }
}
```
The output is 
```
    initial stack: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    reversed stack: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```


## Exercise 3 - Collections
* The goal of this Exercise is to modify the code of our *Library* project, so that more Authors and Books can be added dynamically during runtime! Also, to provide additional functionality (like add/remove books, store transactions, etc)
* The following [code](https://drive.google.com/open?id=0B9pJuOee0VNcT0R3bTBDZkZzbVk) is the code base of Exercise 3 from the **Creating classes** session. You can work on your own code if you prefer. 
* **Important** Work on a copy of your *Library* project,  do not **modify** the original project. 


## Exercise 3 (continued)
* Create a class named **AuthorList** that represents a *List*  that stores *Author* objects. 
* Aν instance variable of type *AuthorList* should be included in your *Book* class. From now on, each book can have more than one authors. 
* The *AuthorList* can be implemented internally (wrap inside) by using the *ArrayList* data structure, provided by the Java Collections Framework.


## Exercise 3 (continued)
* *AuthorList* should implement methods that provide at least the following functionality: 
 * a Constructor that can initialize and populate the List from a given array of authors (AuthorList(Author authorsArray[]){...}),
 * add an author, (only if he doesn't already exists,
 * check if author exists,
 * a toString method that returns a String with all names,
 * and (optionally) any other method of your preference!


## Exercise 3 (continued)
* Create a class **BookList** that represents a *List* data structure that stores *Book* objects
* An instance variable of type *BookList* should be included in your *Library* class also (replace the Book[] array from the previous implementation, if exists). 
* The *BookList* can be implemented internally (wrap inside) by using the *LinkedList* data structure, provided by the Java Collections Framework.
* Modify any code necessary in *Library* in order to delegate operation to the *BookList*s functionalities when needed


## Exercise 3 (continued)
* *BookList* should offer the following functionalities: 
 * exists(String title) - returns true or false if the book exists in the list
 * add book(Book newBook) - adds a new book at the end of the list (only if the book doesn't exist)
 * remove book - removes a book with a given title, if exists
* And also provide the following methods (previously *Library*'s responsibilities)
 * **printAvailableBooks**
 * **printBookDetails**
 * **printBooksFromAuthor**
 * **printTheMostPopularBook**


## Exercise 3 (continued)
* Create a class named *Transaction* that stores information related to the "renting a book", operation.
* Your class should have keep the following information
 * The book for which the transaction is being performed 
 * The date of requesting the current transaction
 * The date of serving of the current transaction
 * A counter that stores how many *Transactions* have been made
 * A unique identifier (that cannot be changed afte initialization) for each *Transaction* created 
* It should provide an overloaded Constructor and a setServedDate() method that updates the relevant instance variable


## Exercise 3 (continued)
* Create a *TransactionQueue* class that serves as a Queue data structure for storing *Transactions* that are pending to be executed. The *TransactionQueue* should be implemented by a data-structure of your preference (simple arrays, ArrayList, Linked-list) but should provide only the methods of a Queue
* An instance variable of type *TransactionQueue* should be introduced in your *Librarian* class since a librarian is responsible for serving the requests
* Every time that a book is requested, a Transaction should be created and stored in the Queue. 


## Exercise 3 (continued)
* Create a *TransactionHistory* class that represents a List data structure that stores executed *Transactions*.
* A field of type *TransactionHistory* should be introduced in your *Library* class
* Create a method *executePendingTransactions()* in your *Librarian* class. When this method is called by the *Librarian* it should execute one by one all stored pending transactions and print an indicative message for each executed transaction.
* Every executed *Transaction* should be removed from the pending transactions list and moved in the transaction history list of the *Library* class. 
* Add a method that prints all pending transactions in the *Librarian* class and all a method that prints the transaction history in the *Library*


## Exercise 3 (continued)
* Give the *Librarian* the ability to perform the *rentPhysicalCopy* functionality. The librarian should retrieve the book (through the Library), create the necessary transaction and store it to his pendiong queue.
* Extend the command-line User Interface to include all newly added functionalities! (add book, remove book, execute transactions)


## Exercise 3 (continued)
* Create a *TestLibrary* class and a main method in the class. In the main method execute the following code:
```java
    public static void main(String args[]) {
	/** Create Random authors */
        Author ruth = new Author("Ruth");
        Author diane = new Author("Diane");
        Author jacqueline = new Author("Jacqueline");
        Author rachel = new Author("Rachel");
        Author joan = new Author("Joan");
        Author theresa = new Author("Theresa");
        Author angela = new Author("Angela");
        Author helen = new Author("Helen");
        Author lisa = new Author("Lisa");
        
        /** Create books with from the existing authors */
        Book book1 = new Book("Book1",new Author[]{ruth, joan},"368777540-2",10,2,20);
        Book book2 = new Book("Book2",new Author[]{ruth},"963099898-2",10,1,22);
        Book book3 = new Book("Book3",new Author[]{jacqueline, rachel},"005382097-2",10,0,23);
        Book book4 = new Book("Book4",new Author[]{theresa, angela},"538310208-2",10,3,24);
        Book book5 = new Book("Book5",new Author[]{lisa},"562448132-2",10,4,26);
        Book book6 = new Book("Book6",new Author[]{helen},"670364563-2",10,2,21);
        Book book7 = new Book("Book7",new Author[]{diane, jacqueline},"466916869-2",10,5,17);
        Book book8 = new Book("Book8",new Author[]{angela, rachel},"764674973-2",10,0,15);
        Book book9 = new Book("Book9",new Author[]{theresa, jacqueline},"052469721-2",10,6,17);
        Book book10 = new Book("Book10",new Author[]{angela},"609291817-2",10,3,13);
        Book book11 = new Book("Book11",new Author[]{lisa, ruth},"451378028-2",10,8,12);
        Book book12 = new Book("Book12",new Author[]{theresa},"142352773-2",10,6,20);
        Book book13 = new Book("Book13",new Author[]{lisa, rachel},"115135166-2",10,0,20);
        Book book14 = new Book("Book14",new Author[]{helen},"631942468-2",10,3,20);
        Book book15 = new Book("Book15",new Author[]{angela, helen},"323662444-2",10,0,23);
        Book book16 = new Book("Book16",new Author[]{rachel},"121360492-2",10,0,12);
        Book book17 = new Book("Book17",new Author[]{theresa, jacqueline, angela},"391199302-2",10,0,20);
        Book book18 = new Book("Book18",new Author[]{angela,lisa},"549307784-2",10,1,20);
        Book book19 = new Book("Book19",new Author[]{theresa, helen},"368777230-2",10,23,20);
        Book book20 = new Book("Book20",new Author[]{ruth},"793027213-2",10,0,20);

        /** Create the BookList from the books array above **/
        BookList books = new BookList( new Book[]{book1,book2,book3,book4,book5,book6,book7,
                book8,book9,book10,book11,book12,book13,book14,book15,
                book16,book17,book18,book19,book20} );
        /** Assign the book collection to the library */
        Library library = new Library(books);
        /* A librarian undertakes the operation of the library */
        Librarian librarian = new Librarian(library);
        librarian.findMeAvailableBooks();
        librarian.findMeBook("Book3");
        librarian.findMeBooksFromAuthor("Ruth");
        librarian.findMostPopularBook();
        // Not existing cases
        librarian.findMeBook("Book0");
        librarian.findMeBooksFromAuthor("angor");
        // Make some transactions
        librarian.rentPhysicalCopy("Book1");
        librarian.rentPhysicalCopy("Book2");
        librarian.rentPhysicalCopy("Book2"); // no available copies left
        // execute transactions
        librarian.executePendingTransactions();
        librarian.executePendingTransactions(); // no pending trans left
        // print transactions history
        librarian.printTransactionHistory();

        // Show menu options
        librarian.showOptions();
    }
```


## Exercise 4 (Strings, Arrays)
* Create a Java program that checks if a given word is a *palindrome*. Palindrome words are the words that can be read backwards. (example: madam) 


## Exercise 5 (Arrays)
* Create a method **findMinAndPositions** that finds the min value of a given array of Integers and also prints its positions.
```java
public static void main(String[] args) {
    int[] array = {1, 3, 1, 2, 5, 6, 6, 8, 9, 12, 1, 13, 3, 1};
    findMinAndPositions(array);
}
```
* The results should be similar to the following:
```
    Min is 1 in positions: 0, 2, 10, 13
```
* Can you use **only one** *for* loop for solving the exercise?


## Exercise 3b
* Extend the functionality of Exercise 3 by adding the functionality of returning a book and 4 more entities: The UserList, the User, the ReturnBook and RentBook. 
* Specifically, create a class *User* that represents a user who can perform a transaction with the library. Users should have the following instance variables:
 * name
 * id - final and unique for each user
 * transactions - a TransactionsHistory that stores all Transactions related to the current user
 * next - a reference to the **next** user, a feature that makes the *User* class an element in a LinkedList


## Exercise 3b (continued)
* Create a class *UserList*, which stores *User* objects
* *UserList* should behave as a linked-list with elements of type *User*. (It should hold only the "head" of the list)
* *UserList* should offer the following functionalities:
 * search for a user
 * add a user (if he doesn't exist)
 * remove a user
 * print all users


## Exercise 3b (continued)
* Add a *user* (of type *User*) instance variable in class Transaction. Every transaction should now store also the user that interacted with the library 
* Create 2 classes named *RentBook* and *ReturnBook* respectively, who will extend the functionality of class Transaction
 * Each class should overwrite the *toString* method and print an appropriate message when renting or returning a book
* Add in the command line graphical UI the option to "return a book". From now on, when renting or returning the book you should ask for the users' name and perform the transaction only if he/she exists. 

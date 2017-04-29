## Learning objectives
* Define the linear data structure
* Learn the characteristics of the linear data structures
* Learn when to use them, according to your needs


## Linear data structures
* Data structure whose element(objects) are ordered in a way so that:
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
* A group of similar objects
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
* The Java platform provides the **String** class to create and manipulate strings.
* *String* objects are **immutable** -- they cannot change their state after construction


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
* Relatively slow process. Many *locking* and *unlocking* actions will take place at the cpu


## StringBuilder
* *Mutable* - can be modified after creation
* *Not synchronized* - accessing it and modifying it by more than one threads can produce unexpected results! 
* Much faster than the *StringBuffer* class


## Immutable vs mutable operations - example
```java
/* Simple String example */
String s = "";
int N = 100000;
for(int i=0; i<N; i++) {
    s += String.valueOf(i);
}

/** StringBuilder example */
StringBuilder builder = new StringBuilder();
for(int i=0; i<N; i++) {
    builder.append(i);
}
builder.toString();

/** StringBuffer example */
StringBuffer buff = new StringBuffer();
for(int i=0; i<N; i++) {
    buff.append(i);
}
buff.toString();
```


## Immutable vs Mutable operations - time comparison
Measuring the separate execution of each solution above resulted to:
 	* 78.5 millisecond using the += operand
 	*  3.7 millisecond using StringBuffer
 	*  1.4 millisecond using StringBuilder


## Available *String* Constructors 
* Java offers, among others, the following *constructors*
 * *String()*
 * *String(char[] value)*
 * *String(char[] value, int offset, int count)*
 * *String(String original)*
 * *String(StringBuilder builder)*


## Strings as arrays
* Class *String* offers, among others, the following methods (only signature's are presented) for acquiring information from a *String* object using its *index*<br>
 * *String substring(int beginIndex)*
 * *String substring(int beginIndex, int endIndex)*
 * *char charAt(int index)*
 * *String concat(String string2)*


## *Strings* as arrays - index 
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
* User have complete control of the insertion and removal of an element in the list
* The most common implementation of the List model are the *Linked-list* the and *ArrayList*. 


## The ArrayList
* *Arraylist* is a class which implements List interface
* *ArrayList* can dynamically grow and shrink according to the needs
* Code example:
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
 * *Vector* is synchronized when
 * *List* is not synchronized
* If run out of space:
 * *Vector* doubles its size, when
 * *List* increases its size by 50%


## The *Linked-list* Java class
* Each element (**node**) of a list is comprising of two items
 * the data and 
 * a reference to the next node. 
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


## CircleList, a linked-list example
<!-- TODO change to Student example -->
```java
class Circle {
    /* Linked-list nodes should have a field of their own
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


## Code Examples of the presented linear data structures
* The following slides present implementations of the sipmlified example that follows.
We need a List that stores the transactions that are executed for a BankAccount. 
Only two entities exist in our scenario: 
 * the *BankAccountTransaction* that represents the entity of the Transaction, and
 * the *BankAccountTransactionList* that represents a List that stores Transactions.


## Code Examples of the presented linear data structures
* For better understanding the difference between the linear data structures presented earlier,
the aforementioned scenario (and specifically the class *BankAccountTransactionList*) is implemented in two different ways: 
 * with an *ArrayList* (as provided by Java),
 * with a *Linked-list* (custom made and not the one provided by Java), and
 * (not implemented) as a *Queue* (again, custom made and not the one provided by Java). For the Queue check the slide **The Queue solution**


## The *ArrayList* solution
```java
/***
 * This class represents a transaction (transfer of money)
 * of a bank account. The 2 fields are just dummy fields since this 
 * example serves only demonstrating reasons for adding and removing 
 * objects in a list. 
 * @author angor
 */
public class BankAccountTransaction {
	/* amount of money of the transaction */
	private int amount_of_money;
	/* The type of transaction ("incoming" or "outgoing") */
	private String transaction_type;
	
	/* Overloaded constructor with 2 arguments */
	BankAccountTransaction(int amount_of_money, String transaction_type) {
		this.amount_of_money = amount_of_money;
		this.transaction_type = transaction_type;
	}

	/* Getters and Setter methods */
	public int getAmount_of_money() {
		return amount_of_money;
	}
	public void setAmount_of_money(int amount_of_money) {
		this.amount_of_money = amount_of_money;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}

	/* Returns a string with the field values of the class */
	@Override
	public String toString() {
		return "BankAccountTransaction [amount_of_money=" + amount_of_money
				+ ", transaction_type=" + transaction_type + "]";
	}	

}

```
* The source code above implements the *BankAccountTransaction* class


## The *ArrayList* solution (continued)
```java
import java.util.ArrayList;

/***
 * This class represents a list of a bank accounts' transactions.
 * For storing the Transactions we use an ArrayList provided by the 
 * Java Collections Framework 
 * (http://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)
 */
public class BankAccountTransactionList {
	/* An ArrayList that stores BankAccountTransaction objects.
	 * You only declare it here as a class field. The initialization 
	 * is performed in the constructor. */
	private ArrayList<BankAccountTransaction> bankAccountTransactions;

	/* The default constructor */
	public BankAccountTransactionList() {
		this.bankAccountTransactions = new ArrayList<>();
	}
	
	/* An overloaded constructor that initializes the BankAccountTransaction
	 * field of your class with a transaction_arraylist that received as 
	 * an argument */
	BankAccountTransactionList(ArrayList<BankAccountTransaction> transaction_arraylist) {
		this.bankAccountTransactions = transaction_arraylist;
	}
	
	/* Getter and Setter methods */
	public ArrayList<BankAccountTransaction> getTransaction_arraylist() {
		return bankAccountTransactions;
	}
	public void setTransaction_arraylist(
			ArrayList<BankAccountTransaction> transaction_arraylist) {
		this.bankAccountTransactions = transaction_arraylist;
	}
	
	/* Adds a new transaction at the last position of the 
	 * bankAccountTransactions ArrayList object. The object 
	 * should be added in the ArrayList, and this happens by 
	 * calling the add(Element e) method of the ArrayList class */
	public void add(BankAccountTransaction new_transaction) {
		this.bankAccountTransactions.add(new_transaction);
	}
	
	/* Adds a new transaction at the position (of the index argument) of the 
	 * bankAccountTransactions ArrayList object. The object 
	 * should be added in the ArrayList, and this happens by 
	 * calling the add(Element e) method of the ArrayList class */
	public void add(int index, BankAccountTransaction new_transaction) {
		// This check exists in order to avoid the case that you try to remove an
		// element in a position out_of_bounds of your list. out_of_bounds
		// can happen at the left and the right of your list.
		if(index > -1 && index < this.bankAccountTransactions.size()) {
			this.bankAccountTransactions.add(index, new_transaction);
		} else
			System.out.println("Index " + index + " out of bounds " + this.bankAccountTransactions.size());
	}
	
	/* Removes an element at position "index" of the bankAccountTransactions ArrayList. 
	 * This happens when your ArrayList object calls the remove(int index) 
	 * method of the ArrayList class */
	public void remove(int index) {
		// This check exists in order to avoid the case that you try to remove an
		// element in a position out_of_bounds of your list. out_of_bounds
		// can happen at the left and the right of your list.
		if(index > -1 && index < this.bankAccountTransactions.size()) {
			this.bankAccountTransactions.remove(index);
		}
	}
	
	/* Returns the number of the stored Transactions 
	 * This number is the size of the bankAccountTransactions list.
	 * you can get the size by calling the size() method of the ArrayList 
	 * class from your bankAccountTransactions object. */
	public int getNumberOfStoredTransactions() {
		return this.bankAccountTransactions.size();
	}
	
	/* prints all stored BankAccountTransaction */
	public void print() {
		// Your ArrayList object bankAccountTransactions gets its size
		// by calling the size() method of the ArrayList class.
		for(int i=0; i<this.bankAccountTransactions.size(); i++){
			// The way (i+1) + ". " that your printing statement starts 
			// exists only for aesthetic reasons!
			System.out.println((i+1) + ". " + this.bankAccountTransactions.get(i));
		}
		System.out.println("==============================================");
	}
}

```
* The source code above implements the BankAccountTransactionList class


## The *ArrayList* solution (continued)
```java
/* This class exists in order to test the 
 * functionalities of the BankAccountTransactionList
 * as implemented with an ArrayList (provided by the 
 * Java Collection Framework
 */
public class TestBankAccoutTransList_ArrayList {
	public static void main(String args[]) {
		/* Declare and initialize (by calling the default constructor 
		 * a BankAccountTransactionList object with name transactions_list 
		 * Your list is currently empty */
		BankAccountTransactionList transactions_list = new BankAccountTransactionList();
		/* Create some dummy BankAccountTransaction to be added in the list above */
		BankAccountTransaction transaction1 = new BankAccountTransaction(300, "incoming");
		BankAccountTransaction transaction2 = new BankAccountTransaction(400, "outgoing");
		BankAccountTransaction transaction3 = new BankAccountTransaction(700, "incoming");
		BankAccountTransaction transaction4 = new BankAccountTransaction(1000, "outgoing");
		BankAccountTransaction transaction5 = new BankAccountTransaction(500, "incoming");

		/* Adding the transactions to the list. Note that most of the transactions are 
		 * not added at the end of the list. What is the expected order? */
		transactions_list.add(transaction1);
		transactions_list.add(0,transaction2);
		transactions_list.add(1,transaction3);
		transactions_list.add(transaction4);
		transactions_list.add(1,transaction5);
		/* Print the stored transactions */
		transactions_list.print();
		
		/* Delete some (first and last) transactions */
		transactions_list.remove(0);
		transactions_list.remove(transactions_list.getNumberOfStoredTransactions() - 1);
		/* Print the stored transactions */
		transactions_list.print();
	}
}

```
* This, finally, is the *TestBankAccoutTransList_ArrayList* class that exists only to demonstrate the functionalities of the *BankAccountTransactionList*


## *Linked-List* solution
```java
/***
 * This class represent a transaction (transfer of money)
 * of a bank account. The 2 fields are just dummy fields since this 
 * example serves only demonstrating reasons for adding and removing 
 * objects in a list. The 3rd (next) field of type BankAccountTransaction
 * serves as a reference to the next element of a linked-list.
 * @author angor
 */
public class BankAccountTransaction {
	/* amount of money of the transaction */
	private int amount_of_money;
	/* The type of transaction ("incoming" or "outgoing") */
	private String transaction_type;
	/* A field of type BankAccountTransaction that keeps a reference 
	 * to the next BankAccountTransaction. This field is created in order 
	 * to make the BankAccountTransaction class behave as a "node" in 
	 * a Linked-list */
	private BankAccountTransaction next;
	
	/* Overloaded constructor with 2 arguments */
	BankAccountTransaction(int amount_of_money, String transaction_type) {
		this.amount_of_money = amount_of_money;
		this.transaction_type = transaction_type;
		/* You can ommit the following initialization since 
		 * this.next is, by default initialized as "null" */
		this.next = null;
	}

	/* Getters and Setter methods */
	public int getAmount_of_money() {
		return amount_of_money;
	}
	public void setAmount_of_money(int amount_of_money) {
		this.amount_of_money = amount_of_money;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	
	/* Getter and Setter for the newly introduce "next" field
	 * These methods are going to be used by the Linked-list */
	public BankAccountTransaction getNext() {
		return next;
	}
	public void setNext(BankAccountTransaction next) {
		this.next = next;
	}

	/* Returns a string with the field values of the class */
	@Override
	public String toString() {
		return "BankAccountTransaction [amount_of_money=" + amount_of_money
				+ ", transaction_type=" + transaction_type + "]";
	}	

}

```
* The source code above implements the BankAccountTransaction class. For the needs of the Linked-list the *next* field is also added that shows to the next element of the list. 


## *Linked-List* solution (continued)
```java
import java.util.ArrayList;

/***
 * This class represents a list of a bank accounts' transactions.
 * For storing the Transactions we implement the BankAccountTransactionList
 * class a LinkedList. 
 */
public class BankAccountTransactionList {
	/* Represents the first element of the Linked-list. It's the only that needs
	 * to be stored in the class. All the rest can be found by traversing the list 
	 * using first as your starting point. */
	private BankAccountTransaction first;

	/* The default constructor. or safety reasons (avoid NullPointerException) 
	 * we have to initialize the bankAccountTransactions object. */
	public BankAccountTransactionList() {
		/* You can ommit the following initialization since 
		 * this.next is, by default initialized as "null" */
		this.first = null;
	}
	

	/* Adds a new transaction at the last position of the 
	 * bankAccountTransactions Linked-list. */
	public void add(BankAccountTransaction new_transaction) {
		// if the first element is "null" then we only need to assign the 
		// new_transaction to the first element. No actions need to be performed
		// and thus, we exit the method by using a return statement. 
		// (yes, return in a void method!)
		if(this.first == null) {
			this.first = new_transaction;
		// if the check statement above is false, it means that at least one
		// element already exists in our list. in that case we need to traverse
		// the list until we find an element that has his "next" reference 
		// showing to "null", that means this element is the last in the list.
		} else {
			BankAccountTransaction current_transaction = this.first;
			while (current_transaction.getNext() != null) {
				current_transaction = current_transaction.getNext();
			}
			// After finding the last element of the list we only need to assign 
			// the new_transaction to the "next" of this element.
			current_transaction.setNext(new_transaction);
		}
	}
	
	/* Adds a new element at a specific position (index) of the list */
	public void add(int index, BankAccountTransaction new_transaction) {
		// This check exists in order to avoid the case that you try to remove an
		// element in a position out_of_bounds of your list. out_of_bounds
		// can happen at the left and the right of your list.
		if(index < 0 || index > this.getNumberOfStoredTransactions()) {
			return;
		// If you try to add at the beginning 	
		// keep the current first in a temp object
		// set the new_transaction as first
		// set the "next" of the new first as the old first!
		} else if (index == 0) {
			BankAccountTransaction temp = this.first;
			this.first = new_transaction;
			this.first.setNext(temp);
		// if you try to add at the end of the list
		// it behaves as a normal add and thus, it calls the simple add() method 
		} else if (index == this.getNumberOfStoredTransactions()) {
			this.add(new_transaction);
		// In any other case you need to traverse the list for as many times as
		// is requested (by index) and retrieve the element at that position.
		} else {
			BankAccountTransaction current_transaction = this.first;
			for (int counter = 1; counter < index - 1; counter++) {
				current_transaction = current_transaction.getNext();
			}
			// Store the "next" of the current element in a temp object
			BankAccountTransaction temp = current_transaction.getNext();
			// assign the new_transaction as "next" to the current element
			current_transaction.setNext(new_transaction);
			// assign the temp element as the next of the new_transaction
			new_transaction.setNext(temp);
		}
	}
	
	/* Removes the last element of the bankAccountTransactions Linked-list. */
	public void remove() {
		// if the first element is "null" then no actions need to be performed
		// and thus, we exit the method by using a return statement. 
		// (yes, return in a void method!)
		if(this.first == null) {
			return;
		// If the first element exists but has no next it means that we just need 
		// to set the first as null. We then, exit the method.
		} else if(this.first.getNext() == null) {
			this.first = null;
			return;
		// if the check statements above are false, it means that at least two
		// elements already exists in our list. in that case we need to traverse
		// the list until we find an element that has his "next"."next" reference 
		// showing to "null", that means this element is the previous to the last in the list.
		} else {
			BankAccountTransaction current_transaction = this.first;
			while (current_transaction.getNext().getNext() != null) {
				current_transaction = current_transaction.getNext();
			}
			// After finding the previous to the last element of the list we only need to 
			// set its "next" as "null"
			current_transaction.setNext(null);
		}
	}
	
	/* removes an element at a specific position (index) of the list */
	public void remove(int index) {
		// This check exists in order to avoid the case that you try to remove an
		// element in a position out_of_bounds of your list. out_of_bounds
		// can happen at the left and the right of your list.
		if(index < 0 || index > this.getNumberOfStoredTransactions() - 1) {
			return;
		// If you try to remove the element at the beginning 	
		// you just need to set the "next" of the first element as 
		// the first element
		} else if (index == 0) {
			this.first = this.first.getNext();
		// if you try to remove the element at the end of the list
		// it behaves as a normal remove and thus, it calls the simple remove() method 
		} else if (index == this.getNumberOfStoredTransactions() - 1) {
			this.remove();
		// In any other case you need to traverse the list for as many times as
		// is requested (by index) and retrieve the element at that position.
		} else {
			BankAccountTransaction current_transaction = this.first;
			for (int counter = 1; counter < index; counter++) {
				current_transaction = current_transaction.getNext();
			}
			// assign the "next"."next" of your current_transaction as 
			// "next". That way. you simply bypass the next element
			current_transaction.setNext(current_transaction.getNext().getNext());
		}
		
	}
	
	/* Returns the number of the stored Transactions 
	 * We need to traverse the list in order to count the elements */
	public int getNumberOfStoredTransactions() {
		// if the first element is "null" then the size is 0. 
		if(this.first == null) {
			return 0;
		// if the check statement above is false, it means that at least one
		// element already exists in our list. in that case we need to traverse
		// the list until we find an element that has his "next" reference 
		// showing to "null", that means this element is the last in the list.
		} else {
			// declare and initialize counter to 1 since the first element "exists" 
			// (is not "null")
			int counter = 1;
			BankAccountTransaction current_transaction = this.first;
			while (current_transaction.getNext() != null) {
				current_transaction = current_transaction.getNext();
				// increase counter by one for each existing element
				counter += 1;
			}
			return counter;
		}
	}
	
	/* prints all stored BankAccountTransaction */
	public void print() {
		// if the first element is "null" then the list is empty and there is nothing to print. 
		// No further actions need to be performed and thus, we exit the method by using 
		// a return statement. (yes, return in a void method!)
		if(this.first == null) {
			return;
		// if the check statement above is false, it means that at least one
		// element already exists in our list. in that case we need to traverse
		// the list until we find an element that has his "next" reference 
		// showing to "null", that means this element is the last in the list.
		} else {
			int counter = 1;
			BankAccountTransaction current_transaction = this.first;
			// Note that in this method, our while loop is executed for 
			// as long as current_transaction is not "null" and not like in the previous cases
			// (where the .getNext() != null)
			while (current_transaction != null) {
				System.out.println((counter++) + ". " + current_transaction.toString());
				current_transaction = current_transaction.getNext();
				// increase counter by one for each existing element
			}
			System.out.println("==============================================");
		}
	}
	
}

```
* The source code above implements the BankAccountTransactionList which is a linked-list!


## *Linked-List* solution (continued)
```java
/* This class exists in order to test the 
 * functionalities of the BankAccountTransactionList
 * implemented as a Linked-list
 */
public class TestBankAccoutTransList_LinkedList {
	public static void main(String args[]) {
		/* Declare and initialize (by calling the default constructor 
		 * a BankAccountTransactionList object with name transactions_list 
		 * Your list is currently empty */
		BankAccountTransactionList transactions_list = new BankAccountTransactionList();
		/* Create some dummy BankAccountTransaction to be added in the list above */
		BankAccountTransaction transaction1 = new BankAccountTransaction(300, "incoming");
		BankAccountTransaction transaction2 = new BankAccountTransaction(400, "outgoing");
		BankAccountTransaction transaction3 = new BankAccountTransaction(700, "incoming");
		BankAccountTransaction transaction4 = new BankAccountTransaction(1000, "outgoing");
		BankAccountTransaction transaction5 = new BankAccountTransaction(500, "incoming");

		/* Adding the transactions to the list. Note that most of the transactions are 
		 * not added at the end of the list. What is the expected order? */
		transactions_list.add(transaction1);
		transactions_list.add(0,transaction2);
		transactions_list.add(transaction3);
		transactions_list.add(1,transaction4);
		transactions_list.add(2,transaction5);
		/* Print the stored transactions */
		transactions_list.print();
		
		/* Delete some (first and last) transactions */
		transactions_list.remove(0); // remove the first
		transactions_list.remove(1); // remove at index 1
		transactions_list.remove(transactions_list.getNumberOfStoredTransactions()-1); //remove the last
		/* Print again the stored transactions */
		transactions_list.print();
	}
}
```
* This, finally, is the *TestBankAccoutTransList_LinkedList* class that exists only to demonstrate the functionalities of the *BankAccountTransactionList* implemented as a linked-list


## The *Queue* solution
* A Queue solution is not provided in source for one simple reason: Its implementation is almost identical to the previously presented Linked-list! 
* Can you guess how, by slightly changing the Linked-list source code, you can come up with a Queue?
(SPOILER ALERT:The answer comes to the next slide!)


## The *Queue* solution (continued)
* Remove the methods: 
 * *add(int index, Element e)* and *remove()*
* and apply the following one change and one addition:
 * *add(Element e)* - should be renamed to *enqueue(Element e)* and create a *dequeue()* as follows:
```java
/* Always removes the first element */
public void dequeue() {
	this.remove(0);
}
```
You end up having Queue! Only the *element()* method that return the first element (without removing it) but the Getter of the "first" field does the same.


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


## Exercise 1 (Arrays)
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


## Exercise 2 (Strings and Arrays)
*CaesarsCipher* is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. [link](https://en.wikipedia.org/wiki/Caesar_cipher)
<img src=media/caecars_cipher.png width=600 height=250 /></br>


## Exercise 2 (continued)
Create a class *CaesarsCipher* that performs the ciphering/deciphering on plain text as described by the Ceacar's cipher. This class should have the following two methods:
* ** String cipher(String message, int numOfShifts)** - ciphers and returns the given message (with the given numOfShifts) 
* **String decipher(String cipherText, int numOfShifts)** - deciphers and returns the given message (with the given numOfShifts) 
* Create a *TestCaesar* class and test the functionality of your *CaesarsCipher* class


## Exercise 3 (Collections)
* The goal of this Exercise is to modify the code of our *Library* project, so that more Authors and Books can be added dynamically during runtime! 
* Also, to provide additional functionality (like book transactions)
* The following [code //TODO](link here) is the skeleton code for Exercise 3 of the **Creating classes** session. You can work on your own code if you prefer! Work on a copy of your *Library* project,  do not **modify** the original project. 


## Exercise 3 (continued)
* **AuthorList**
* On your Library project add a class *AuthorList* that represents a *List*  that stores *Author* objects. 
* Aν instance variable of type *AuthorList* should be included in your *Library* class also. Library is now responsible for accessing and modifying the author list. 
* The *AuthorList* can be implemented internally (wrap inside) by using the *ArrayList* data structure, provided by the Java Collections Framework.


## Exercise 3 (continued)
* **AuthorList** should implement methods that provide at least the following functionality: 
 * a Constructor that can initialize and populate the List from a given array of authors (AuthorList(Author authorsArray[]){...}),
 * add an author,
 * remove an author,
 * find an author,
 * print the number of authors,
 * search if author exists,
 * or (optionally) any other method of your preference!


## Exercise 3 (continued)
* **BookList** 
* Create a class *BookList* that represents a *List* data structure that stores *Book* objects
* An instance variable of type *BookList* should be included in your *Library* class also (replace the Book[] array from the previous implementation, if exists). 
* The *BookList* can be implemented internally (wrap inside) by using the *LinkedList* data structure, provided by the Java Collections Framework.
* Modify any code necessary in *Library* in order to operate with LinkedList and use the *BookList*s functionalities


## Exercise 3 (continued)
* *BookList* should offer the following functionalities: 
 * addBook(Book newBook) - adds a new book at the end of the list (only if the book doesn't exist)
 * removeBook(String title) - removes a book, if exists
 * getBook(String title) - returns a book or null if it doesn't exist


## Exercise 3 (continued)
* Create a class named *Transaction* that stores information related to the renting and returning a book, operations.
* Your class should have keep the following information
 * The book for which the transaction is being performed 
 * The date of requesting the current transaction
 * The date of serving of the current transaction
 * A counter that stores how many *Transactions* have been made
 * A unique identifier (that cannot be changed afte initialization) for each *Transaction* created 
* It should provide an overloaded Constructor and a setServedDate() method that updates the relevant field


## Exercise 3 (continued)
* Create a *TransactionQueue* class that serves as a Queue data structure for storing *Transactions* that are pending to be executed. The *TransactionQueue* should be implemented by a data-structure of your preference (simple arrays, ArrayList, Linked-list) but should provide only the methods of a Queue
* A field of type *TransactionHistory* should be introduced in your *Library* class
* Every time that a book is requested, a Transaction should be created and stored in the Queue. 


## Exercise 3 (continued)
* Create a *TransactionHistory* class that represents a List data structure that stores executed *Transactions*.
* A field of type *TransactionHistory* should be introduced in your *Library* class
* Create a method *executePendingTransactions()* in your *Library* class. When this method is called by the *Librarian* it should virtually (no actual effect) execute each one of the stored pending transactions in the *TransactionQueue* of the Library and print an indicative message for each executed transaction.
* Every executed *Transaction* should be moved in the *TransactionHistory* list of the *Library* class. 


## Exercise 3 (continued)
* Create a *TestLibrary* class and a main method in the class. In the main method execute the following code:
```java
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
	Author[] authorsarray = {ruth, diane, jacqueline, rachel, joan, theresa, 
			angela, helen, lisa};
	AuthorList authors = new AuthorList(authorsarray);
	/** Create Random books from the above authors */
	Book book1 = new Book("Book1",ruth,"368777540-2",10,2,20);
	Book book2 = new Book("Book2",diane,"963099898-2",10,1,22);
	Book book3 = new Book("Book3",jacqueline,"005382097-2",10,0,23);
	Book book4 = new Book("Book4",rachel,"538310208-2",10,3,24);
	Book book5 = new Book("Book5",joan,"562448132-2",10,4,26);
	Book book6 = new Book("Book6",theresa,"670364563-2",10,2,21);
	Book book7 = new Book("Book7",angela,"466916869-2",10,5,17);
	Book book8 = new Book("Book8",helen,"764674973-2",10,0,15);
	Book book9 = new Book("Book9",lisa,"052469721-2",10,6,17);
	Book book10 = new Book("Book10",ruth,"609291817-2",10,3,13);
	Book book11 = new Book("Book11",diane,"451378028-2",10,8,12);
	Book book12 = new Book("Book12",jacqueline,"142352773-2",10,6,20);
	Book book13 = new Book("Book13",rachel,"115135166-2",10,0,20);
	Book book14 = new Book("Book14",joan,"631942468-2",10,3,20);
	Book book15 = new Book("Book15",theresa,"323662444-2",10,0,23);
	Book book16 = new Book("Book16",angela,"121360492-2",10,0,12);
	Book book17 = new Book("Book17",helen,"391199302-2",10,0,20);
	Book book18 = new Book("Book18",ruth,"549307784-2",10,1,20);
	Book book19 = new Book("Book19",ruth,"368777230-2",10,23,20);
	Book book20 = new Book("Book20",ruth,"793027213-2",10,0,20);
	/** Add the books to a Book array*/
	Book[] books = {book1,book2,book3,book4,book5,book6,book7,
			book8,book9,book10,book11,book12,book13,book14,book15,
			book16,book17,book18,book19,book20};
	BookList booklist = new BookList(books);
	/** Assign the book collection to the library */
	Library library = new Library(booklist, authors);
	/** Librarian the_guy_who _knows_a_lot undertakes the operation of the library */
	Librarian the_guy = new Librarian(library);

	/* Testing if the initialization of Library works correctly! */
	the_guy.findMeAvailableBooks();
	the_guy.findMeBook("Book3");
	the_guy.findMeBooksFromAuthor("Ruth");

	/* Search an author and return his instance if exists */
	String author_name_to_find = "Ruth";
	Author author = the_guy.getAuthor("Ruth");
	if(author != null) System.out.println("I found author " + author.getName());
	else System.out.println("Author " + author_name_to_find + " not found in the list.");
	/* Add a new book to the library's booklist */
	the_guy.addNewBookToLibrary("New Book!", author, "11111111-66", 5,5,0);
	/* Test if the new book is available */
	the_guy.findMeBooksFromAuthor("Ruth");
	/* Testing renting, returning and transaction printing */
	the_guy.findMeBook("New Book!");
	the_guy.rentBook("New Book!", "antonis");
	the_guy.findMeBook("New Book!");
	the_guy.findMeBook("Book3");
	the_guy.returnBook("Book3", "alice");
	the_guy.printPendingTransactions();
```


## Exercise 3 
* Extend the command-line User Interface to include all newly added functionalities! (add book, remove book, execute transactions) 


<!--## Exercise 3 (finale!) 
* Further extend the functionality of your system by adding the *User* and the *UserList* entities. 
* A *User* is a person registered to the *Library*
* The *UserList* is a list that holds all registered *Users*
* Introduce all necessary fields and methods in class
* The type of the data structure that should be used for the *UserList* is a linked-list -->


## Exercise 4 
* Create a Java program that checks if a given word is a *palindrome*. Palindrome words are the words that can be read backwards. (example: madam) 

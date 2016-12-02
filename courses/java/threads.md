## Processes and Threads
* Most implementations of the Java virtual machine
run as a single process and in the Java
programming language, concurrent programming
is mostly concerned with threads (also called lightweight processes).
Multiple processes can only be realized with multiple JVMs.


## Threads
* [Methods and Descriptions](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html)
* Threads share the process's resources.
This makes for efficient,
but potentially problematic, communication.
* Two ways to start a thread.


## Provide a runnable object
```java
 public class HelloRunnable implements Runnable {
    public void run() {
        System.out.println("Hello from thread!");
    }
    public static void main(String[] args) {
        (new Thread(new HelloRunnable())).start();
    }
 }
```


## Subclass thread
```java
public class HelloThread extends Thread {
    public void run() {
        System.out.println("Hello from thread!");
    }
    public static void main(String[] args) {
        (new HelloThread()).start();
    }
 }
```


## Interrupts and Joins
* An *interrupt* is an indication to a thread that it should stop.
* The *Thread.join* methods allow one thread to wait for the completion of another.


## Exercise 1
* Create a Thread called *CounterLoop*.
This thread
prints to the terminal all numbers up to a
specified-in-the-constructor variable called *counter*.
When a number is printed the thread pauses for 2 seconds.
If the thread is interrupted it prints
a message indicating that it has not finish.
* Your *main* should accept two arguments.
The first is passed to a variable called *patience*.
Main then initiates a CounterLoop thread and passes the second
argument to the constructor.
It then starts the thread.
If the CounterLoop thread takes more time (in ms)
than main's patience then it interrupts the thread
and finishes.
Before every check main waits for 1 second,
for the thread to finish.


## Exercise 2
* *ThreadEx* is a thread that has a Java collection
as a variable. The collection must be set
into the thread's constructor.
We do not want any synchronization issues so be
careful on your collection choice!
When the thread runs, it registers its ID
(see the *getId()* method) to the vector and
then it sleeps for 1 second.
* Your *main* should initiate three
threads by bypassing the same collection as
an argument to all of them.
Then, it starts all three threads.
It waits for them to finish and then it prints:
a) the size of the collection and b) the collection's
contents by using the corresponding iterator.

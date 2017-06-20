## Definition - Testing
*Dynamic* verification that the program has the
*expected* behevior
in a suitably *selected* *final* set of test cases

## Levels of testing
* Unit Testing
* Component Testing
* Integration Testing
* System Testing
* Acceptance Testing

## Testing by goal
* Acceptance testing
* Installation testing
* Alpha/beta testing
* Regression testing
* Performance testing
* Stress testing
* Recovery testing
* Interface testing
* Configuration testing
* Usability testing

## Useful testing techniques
* Ad hoc
* Exploratory
* Extreme values
* Random values
* Cover control paths
* Cover data paths
* Guess probably mistakes

## Testing practices
* Testing succeeds when it finds faults
* Establish test process and guidelines
* Documentation
* Test-driven development (TDD)
* Internal or through external team
* Integration based on risk analysis


## Testing activities
* Test plan
* Test cases
* Testing environment
* Test execution
* Test result evaluation
* Issue reporting
* Issue management

## Definition - Unit testing
Unit testing is a method of testing individual units of source code to determine if they are fit for use

## Unit testing
* Unit tests are the smallest testable parts of an application
* Is performed at the development phase of a software’s life cycle
* Detects problems early in the development process
* Simplifies Integration

## xUnit frameworks
* JUnit for Java
* unittest for Python 
* Nunit and/or xUnit for .NET

## The first example - JUnit
```java
import org.junit.Assert;
import org.junit.Test;
...
	@Test
	public void testCalculateNoc() {
		RegexBasedMetricsComputer metricsComp = new RegexBasedMetricsComputer("src/designPatterns/RegexBasedMetricsComputer.java");
		Assert.assertEquals(1, metricsComp.calculateNoc());
	}
...
```
## Unit-test plan
![](media/testPlan.png)

## Unit testing practices
* Define test classes and therein implement test methods (known also as “test cases”) 
* Each class should have its corresponding test class
* Test classes should have the same name as the functional class with an additional Test* prefix
* Test classes should follow the same package structure with the functional classes
* Unit tests should be independent from one other
* External dependencies should be removed

## Annotations - JUnit
Annotations are used over the methods in the Test classes and suites in order to depict their functionality. 
* @Test - defines a method as a test method 
* @Test(expected=Exception.class) – Fails if the method does not throw the expected Exception
* @Test(timeout=xxxx) – Fails if the test method requires more time than xxxx milliseconds to execute
* @Before & @After – This method is executed before (or after) each test method
* @BeforeClass & @AfterClass – This method is executed once before (or after) the execution of all test methods
* @Ignore – Ignores a test method

## Assert
Testing of assumptions is done inside each test method by the use of assertions from the Assert class.

The assert methods compare the actual value returned by a test to the expected value, throwing an  AssertionException if the comparison fails.

* assertTrue(“message”,boolean condition) – assertFalse(…)
* assertEquals(“message”, expected, actual, tolerance)
* assertNull(“message”, object) - assertNotNull(…)
* assertSame(“message”, expected, actual) – assertNotSame(…)
* assertArrayEquals(…), assertArrayNotEquals(…)
* fail()

## Fixtures
* @before and @after

## Exception testing
```java
@Test (expected = NoSuchFileException.class)
	public void testCalculateNocException() throws NoSuchFileException {
		RegexBasedMetricsComputer metricsComp = new RegexBasedMetricsComputer("somepath/somefile.java");
		Assert.assertEquals(1, metricsComp.calculateNoc());
	}
```
## Test suites
Suites allow grouping of Test classes. They are empty classes, annotated with the @RunWith and the @Suite.SuiteClasses annotations

When the suite class run all the tests in the included classes will also run
![](media/testSuite.png)

## Exercise 1
* Create a class named MySimpleMath and implement the following methods. For the each method create the necessary Test methods in the appropriate Test class in order to challenge the functionality of your code.
* int multiply(int a, int b) : Multiplies two positive given numbers and returns the result. If the result of the division cannot fit in an Integer you should throw an ArithmeticException(“Result cannot fit in an Integer”).
* double divide(int num, int denom) : Performs a division between two numbers and returns the result. num is the numerator and denom is the denominator. When the denom is zero an IllegalArgumentException("'denominator' cannot be zero").

## Exercise 2
* Write tests for your design patterns exercise
* Write tests for your current project(s)
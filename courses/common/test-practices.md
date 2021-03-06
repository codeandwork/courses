## Static analysis
* Automated code checking
* Finds:
 * logical errors
 * style problems
 * security problems
* Can include symbolic execution
* Representative Java tools:
 * [Checkstyle](http://checkstyle.sourceforge.net/)
 * [PMD](http://pmd.sourceforge.net/pmd-5.0.0)
 * [Findbugs](http://findbugs.sourceforge.net/)


## Code before Checkstyle
```java
package gr.aueb.dmst.dds.example;

/** Implementation of a simple non-empty parametric linked list type */
public class LinkedList <E> {
    /** Node's value */
    private E value;
    /** Next node */
    private LinkedList <E> next;

    /** Construct a list with a single element v */
    LinkedList(E v) {
        value = v;
        next = null;
    }

    /** Return a list with element n added to it */
    public LinkedList <E> add(E v) {
        LinkedList <E> n = new LinkedList <E>(v);
        n.next = this;
        return n;
    }

    /** Return the element at the list's head */
    public E getHead() {
        return value;
    }

    /** Return the list's tail */
    public LinkedList<E> getTail() {
        return next;
    }

    /** Return a string representation of the list */
    public String toString() {
        String me = value.toString();

        /* Recursive implementation */
        if (next == null)
            return me;
        else
            return me + " -> " + next;
    }

    /** Return the number of elements in the list */
    public int size() {
        /* Recursive implementation */
        if (next == null)
            return 1;
        else
            return next.size() + 1;
    }

    /** Return true if the specified element exists in the list */
    public boolean contains(E e) {
        /* Iterative implementation */
        for (LinkedList <E> i = this; i != null; i = i.next)
            if (i.value.equals(e))
                return true;
        return false;
    }

    /** Test harness */
    static public void main(String args[]) {
        LinkedList <Integer> ilst = new LinkedList <Integer>(0);

        ilst = ilst.add(1);
        ilst = ilst.add(18);
        ilst = ilst.add(45);

        for (int i = 0; i < 5; i++)
            ilst = ilst.add(i * 10);
        System.out.println(ilst);
    }
}
```


## Checkstyle output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<checkstyle version="5.7">
<file name="C:\dds\pubs\courses\prog2gp\junit\src\main\java\gr\aueb\dmst\dds\example\LinkedList.java">
<error line="0" severity="error" message="Missing package-info.java file." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocPackageCheck"/>
<error line="3" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="4" severity="error" message="Type Javadoc comment is missing an @param &lt;E&gt; tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocTypeCheck"/>
<error line="5" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="7" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="10" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="11" column="16" severity="error" message="Parameter v should be final." source="com.puppycrawl.tools.checkstyle.checks.FinalParametersCheck"/>
<error line="11" column="18" severity="error" message="Expected @param tag for &apos;v&apos;." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="16" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="17" severity="error" message="Expected an @return tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="17" column="5" severity="error" message="Method &apos;add&apos; is not designed for extension - needs to be abstract, final or empty." source="com.puppycrawl.tools.checkstyle.checks.design.DesignForExtensionCheck"/>
<error line="17" column="31" severity="error" message="Parameter v should be final." source="com.puppycrawl.tools.checkstyle.checks.FinalParametersCheck"/>
<error line="17" column="33" severity="error" message="Expected @param tag for &apos;v&apos;." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="19" column="15" severity="error" message="&apos;=&apos; is not preceded with whitespace." source="com.puppycrawl.tools.checkstyle.checks.whitespace.WhitespaceAroundCheck"/>
<error line="19" column="16" severity="error" message="&apos;=&apos; is not followed by whitespace." source="com.puppycrawl.tools.checkstyle.checks.whitespace.WhitespaceAroundCheck"/>
<error line="23" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="24" severity="error" message="Expected an @return tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="24" column="5" severity="error" message="Method &apos;getHead&apos; is not designed for extension - needs to be abstract, final or empty." source="com.puppycrawl.tools.checkstyle.checks.design.DesignForExtensionCheck"/>
<error line="25" column="21" severity="error" message="&apos;;&apos; is preceded with whitespace." source="com.puppycrawl.tools.checkstyle.checks.whitespace.NoWhitespaceBeforeCheck"/>
<error line="28" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="29" severity="error" message="Expected an @return tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="29" column="5" severity="error" message="Method &apos;getTail&apos; is not designed for extension - needs to be abstract, final or empty." source="com.puppycrawl.tools.checkstyle.checks.design.DesignForExtensionCheck"/>
<error line="33" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="34" severity="error" message="Expected an @return tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="34" column="5" severity="error" message="Method &apos;toString&apos; is not designed for extension - needs to be abstract, final or empty." source="com.puppycrawl.tools.checkstyle.checks.design.DesignForExtensionCheck"/>
<error line="38" severity="error" message="&apos;if&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="40" severity="error" message="&apos;else&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="44" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="45" severity="error" message="Expected an @return tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="45" column="5" severity="error" message="Method &apos;size&apos; is not designed for extension - needs to be abstract, final or empty." source="com.puppycrawl.tools.checkstyle.checks.design.DesignForExtensionCheck"/>
<error line="47" severity="error" message="&apos;if&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="49" severity="error" message="&apos;else&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="53" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="54" severity="error" message="Expected an @return tag." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="54" column="5" severity="error" message="Method &apos;contains&apos; is not designed for extension - needs to be abstract, final or empty." source="com.puppycrawl.tools.checkstyle.checks.design.DesignForExtensionCheck"/>
<error line="54" column="29" severity="error" message="Parameter e should be final." source="com.puppycrawl.tools.checkstyle.checks.FinalParametersCheck"/>
<error line="54" column="31" severity="error" message="Expected @param tag for &apos;e&apos;." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="56" severity="error" message="&apos;for&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="57" severity="error" message="&apos;if&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="62" severity="error" message="First sentence should end with a period." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocStyleCheck"/>
<error line="63" column="12" severity="error" message="&apos;public&apos; modifier out of order with the JLS suggestions." source="com.puppycrawl.tools.checkstyle.checks.modifier.ModifierOrderCheck"/>
<error line="63" column="29" severity="error" message="Parameter args should be final." source="com.puppycrawl.tools.checkstyle.checks.FinalParametersCheck"/>
<error line="63" column="36" severity="error" message="Expected @param tag for &apos;args&apos;." source="com.puppycrawl.tools.checkstyle.checks.javadoc.JavadocMethodCheck"/>
<error line="63" column="40" severity="error" message="Array brackets at illegal position." source="com.puppycrawl.tools.checkstyle.checks.ArrayTypeStyleCheck"/>
<error line="67" column="25" severity="error" message="&apos;18&apos; is a magic number." source="com.puppycrawl.tools.checkstyle.checks.coding.MagicNumberCheck"/>
<error line="68" column="25" severity="error" message="&apos;45&apos; is a magic number." source="com.puppycrawl.tools.checkstyle.checks.coding.MagicNumberCheck"/>
<error line="70" severity="error" message="&apos;for&apos; construct must use &apos;{}&apos;s." source="com.puppycrawl.tools.checkstyle.checks.blocks.NeedBracesCheck"/>
<error line="70" column="29" severity="error" message="&apos;5&apos; is a magic number." source="com.puppycrawl.tools.checkstyle.checks.coding.MagicNumberCheck"/>
<error line="71" column="33" severity="error" message="&apos;10&apos; is a magic number." source="com.puppycrawl.tools.checkstyle.checks.coding.MagicNumberCheck"/>
</file>
</checkstyle>
```


## Identified issues
* '*operator*' is preceded with whitespace.
* '*binary operator*' is not followed by whitespace.
* '*number*' is a magic number.
* 'if/else/for' construct must use '{}'s.
* 'public' modifier out of order with the JLS suggestions.
* Method '*name*' is not designed for extension - needs to be abstract, final or empty.
* Missing package-info.java file.
* Parameter *name* should be final.
* First sentence should end with a period.
* Expected @param tag for '*parameter*'.
* Expected an @return tag.
* Type Javadoc comment is missing an @param <E> tag.


## Code after corrections
```java
package gr.aueb.dmst.dds.example;

/**
 * Implementation of a simple non-empty parametric linked list type.
 * @param <E> The type of the values stored in the list.
 */
public class LinkedList <E> {
    /** Node's value. */
    private E value;
    /** Next node. */
    private LinkedList <E> next;

    /**
     * Construct a list with a single element.
     * @param v The value of the list's first element.
     */
    LinkedList(final E v) {
        value = v;
        next = null;
    }

    /** Add an element to the list.
     * @param v The value of the element to add.
     * @return A list with element v added to it.
     */
    public final LinkedList <E> add(final E v) {
        LinkedList <E> n = new LinkedList <E>(v);
        n.next = this;
        return n;
    }

    /**
     * Obtain the element at the list's head.
     * @return The value of the first element of the list.
     */
    public final E getHead() {
        return value;
    }

    /**
     * Obtain the list's tail.
     * @return The list starting from the second element.
     */
    public final LinkedList<E> getTail() {
        return next;
    }

    /**
     * Obtain a string representation of the list.
     * @return The list as a series of elements connected with arrows.
     */
    public final String toString() {
        String me = value.toString();

        /* Recursive implementation */
        if (next == null) {
            return me;
        } else {
            return me + " -> " + next;
        }
    }

    /**
     * Obtain the number of elements in the list.
     * @return The number of elements in the list.
     */
    public final int size() {
        /* Recursive implementation */
        if (next == null) {
            return 1;
        } else {
            return next.size() + 1;
        }
    }

    /**
     * Check whether the specified element exists in the list.
     * @param e The element to search for in the list.
     * @return True if the specified element is in the list, false otherwise.
     */
    public final boolean contains(final E e) {
        /* Iterative implementation */
        for (LinkedList <E> i = this; i != null; i = i.next) {
            if (i.value.equals(e)) {
                return true;
            }
        }
        return false;
    }
}
```


## Unit testing
* On smallest possible module
* Stand-alone
* Mutually independent
* Developed before or together with implementation
* Automatically executed
 * At build time
 * During (continuous) integration
* Aim at full code coverage


## Unit testing advantages
* Diagnoses problems in time
* Facilitates code refactoring
* Facilitates integration
* Provides documentation
* Encourages modular design (but discourages encapsulation)


## Java code
```java
package junit.samples.money;

/**
 * A simple Money.
 *
 */
public class Money implements IMoney {

	private int fAmount;
	private String fCurrency;

	/**
	 * Constructs a money from the given amount and currency.
	 */
	public Money(int amount, String currency) {
		fAmount= amount;
		fCurrency= currency;
	}
	/**
	 * Adds a money to this money. Forwards the request to the addMoney helper.
	 */
	public IMoney add(IMoney m) {
		return m.addMoney(this);
	}
	public IMoney addMoney(Money m) {
		if (m.currency().equals(currency()) )
			return new Money(amount()+m.amount(), currency());
		return MoneyBag.create(this, m);
	}
	public IMoney addMoneyBag(MoneyBag s) {
		return s.addMoney(this);
	}
	public int amount() {
		return fAmount;
	}
	public String currency() {
		return fCurrency;
	}
	public boolean equals(Object anObject) {
		if (isZero())
			if (anObject instanceof IMoney)
				return ((IMoney)anObject).isZero();
		if (anObject instanceof Money) {
			Money aMoney= (Money)anObject;
			return aMoney.currency().equals(currency())
							 && amount() == aMoney.amount();
		}
		return false;
	}
	public int hashCode() {
		return fCurrency.hashCode()+fAmount;
	}
	public boolean isZero() {
		return amount() == 0;
	}
	public IMoney multiply(int factor) {
		return new Money(amount()*factor, currency());
	}
	public IMoney negate() {
		return new Money(-amount(), currency());
	}
	public IMoney subtract(IMoney m) {
		return add(m.negate());
	}
	public String toString() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("["+amount()+" "+currency()+"]");
		return buffer.toString();
	}
	public /*this makes no sense*/ void appendTo(MoneyBag m) {
		m.appendMoney(this);
	}
}
```


## Java tests
```java
public class MoneyTest extends TestCase {
    private Money f12CHF;
    private Money f14CHF;
    private Money f28USD;

    protected void setUp() {
        f12CHF= new Money(12, "CHF");
        f14CHF= new Money(14, "CHF");
        f28USD= new Money(28, "USD");
    }
}

public void testMoneyMoneyBag() {
    // [12 CHF] + [14 CHF] + [28 USD] == {[26 CHF][28 USD]}
    Money bag[]= { f26CHF, f28USD };
    MoneyBag expected= new MoneyBag(bag);
    assertEquals(expected, f12CHF.add(f28USD.add(f14CHF)));
}

public static Test suite() {
    TestSuite suite= new TestSuite();
    suite.addTest(new MoneyTest("testMoneyEquals"));
    suite.addTest(new MoneyTest("testSimpleAdd"));
    return suite;
}
```


## Java Example: Running JUnit
![JUnit execution](media/junit.gif)


## C# Example (Money)
```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MoneyApp
{
    public class Money
    {
        public int value;
        public string currency;

        public Money(int p1, string p2)
        {
            this.value = p1;
            this.currency = p2;
        }
    }
}
```


## C# Example (MoneyBag)
```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MoneyApp;

namespace MoneyApp
{
    public class MoneyBag
    {
        public MyList bag;

        public MoneyBag(MyList bag)
        {
            this.bag = bag;
        }

        public MoneyBag()
        {
            bag = new MyList();
        }

        public void add(Money moneyObj)
        {
            bool found = false;
            foreach(Money money in bag)
            {
                if (money.currency.Equals(moneyObj.currency))
                {
                    money.value += moneyObj.value;
                    found = true;
                }
            }
            if (found == false)
                bag.Add(moneyObj);
        }
    }
}
```


## C# Example (Tests)
```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using MoneyApp;

namespace MoneyTests
{
    [TestFixture]
    public class MoneyTests
    {
        private Money f12CHF;
        private Money f14CHF;
        private Money f28USD;

        [SetUp]
        public void setUp()
        {
            f12CHF = new Money(12, "CHF");
            f14CHF = new Money(14, "CHF");
            f28USD = new Money(28, "USD");
        }
        [Test]
        public void testMoneyMoneyBag()
        {
            // [12 CHF] + [14 CHF] + [28 USD] == {[26 CHF][28 USD]}
            MyList bag = new MyList();
            Money f26CHF = new Money(26, "CHF");
            bag.Add(f26CHF);
            bag.Add(f28USD);

            MoneyBag expected = new MoneyBag(bag);
            MoneyBag actual = new MoneyBag();
            actual.add(f12CHF);
            actual.add(f28USD);
            actual.add(f14CHF);
            bool result = expected.bag.Equals(actual.bag);
            Assert.AreEqual(true, result);
        }
    }
}
```


## C# Example: Running tests
![Running C# tests](media/cs-testing.PNG)


## Example 2: Code
```java
package gr.aueb.dmst.dds.example;

/**
 * Implementation of a simple non-empty parametric linked list type.
 * @param <E> The type of the values stored in the list.
 */
public class LinkedList <E> {
    /** Node's value. */
    private E value;
    /** Next node. */
    private LinkedList <E> next;

    /**
     * Construct a list with a single element.
     * @param v The value of the list's first element.
     */
    LinkedList(final E v) {
        value = v;
        next = null;
    }

    /** Add an element to the list.
     * @param v The value of the element to add.
     * @return A list with element v added to it.
     */
    public final LinkedList <E> add(final E v) {
        LinkedList <E> n = new LinkedList <E>(v);
        n.next = this;
        return n;
    }

    /**
     * Obtain the element at the list's head.
     * @return The value of the first element of the list.
     */
    public final E getHead() {
        return value;
    }

    /**
     * Obtain the list's tail.
     * @return The list starting from the second element.
     */
    public final LinkedList<E> getTail() {
        return next;
    }

    /**
     * Obtain a string representation of the list.
     * @return The list as a series of elements connected with arrows.
     */
    public final String toString() {
        String me = value.toString();

        /* Recursive implementation */
        if (next == null) {
            return me;
        } else {
            return me + " -> " + next;
        }
    }

    /**
     * Obtain the number of elements in the list.
     * @return The number of elements in the list.
     */
    public final int size() {
        /* Recursive implementation */
        if (next == null) {
            return 1;
        } else {
            return next.size() + 1;
        }
    }

    /**
     * Check whether the specified element exists in the list.
     * @param e The element to search for in the list.
     * @return True if the specified element is in the list, false otherwise.
     */
    public final boolean contains(final E e) {
        /* Iterative implementation */
        for (LinkedList <E> i = this; i != null; i = i.next) {
            if (i.value.equals(e)) {
                return true;
            }
        }
        return false;
    }
}
```


## Example 2: Unit Tests
```java
package gr.aueb.dmst.dds.example;

import gr.aueb.dmst.dds.example.LinkedList;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class TestLinkedList {

    private LinkedList<Integer> list;
    private final int firstElement = 4;
    private final int missingElement = 42;

    @Before
    public void setUp() {
        list = new LinkedList<Integer>(firstElement);
    }

    @Test
    public void testGetSize() {
        Assert.assertEquals("failure - wrong size", list.size(), 1);
        list = list.add(1);
        Assert.assertEquals("failure - wrong size", list.size(), 2);
    }

    @Test
    public void testContains() {
        Assert.assertTrue("failure - does not contain first element",
                list.contains(firstElement));
        Assert.assertFalse("failure - contains missing element",
                list.contains(missingElement));
    }

    @Test
    public void testGetHead() {
        Assert.assertEquals("failure - wrong head", list.getHead(),
                (Integer)firstElement);
    }

    @Test
    public void testGetTail() {
        final int secondElement = 1000;
        list = list.add(secondElement).getTail();
        Assert.assertEquals("failure - wrong size", list.size(), 1);
        Assert.assertEquals("failure - wrong head", list.getHead(),
                (Integer)firstElement);
        Assert.assertTrue("failure - does not contain first element",
                list.contains(firstElement));
        Assert.assertFalse("failure - contains second element",
                list.contains(secondElement));
    }

    @Test
    public void testContructor() {
        Assert.assertEquals("failure - wrong size", list.size(), 1);
        Assert.assertEquals("failure - wrong head", list.getHead(),
                (Integer)firstElement);
        Assert.assertTrue("failure - does not contain first element",
                list.contains(firstElement));
        Assert.assertFalse("failure - contains missing element",
                list.contains(missingElement));
    }

    @Test
    public void testAdd() {
        final int secondElement = 1000;
        list = list.add(secondElement);
        Assert.assertEquals("failure - wrong size", list.size(), 2);
        Assert.assertEquals("failure - wrong head", list.getHead(),
                (Integer)secondElement);
        Assert.assertTrue("failure - does not contain first element",
                list.contains(firstElement));
        Assert.assertTrue("failure - does not contain second element",
                list.contains(secondElement));
        Assert.assertFalse("failure - contains missing element",
                list.contains(missingElement));
    }

    @Test
    public void testToString() {
        Assert.assertEquals("failure - wrong to String", list.toString(),
                ((Integer)firstElement).toString());
        final int secondElement = 1000;
        list = list.add(secondElement);
        Assert.assertEquals("failure - wrong to String", list.toString(),
                ((Integer)secondElement).toString() + " -> " +
                ((Integer)firstElement).toString());
    }

    @After
    public void tearDown() {
        /* Not really needed */
        list = null;
    }
}
```


## Code reviews
* Over-the-shoulder
* Email of diffs
* Pair programming (e.g. XP)
* Tool-assisted code review
  * (Pre or post commit)
  * Gerrit
  * GitLab / GitHub
  * Phabricator
  * Review Board


## Continuous integration (CI)
* Integrate changes to mainline in small increments
* Typically includes
  * Static analysis
  * Testing
  * Deployment
* Tool supported
  * Jenkins - Hudson
  * Travis CI
  * Team Foundation Server


## CI Practices
* Maintain a code repository
* Automate the build
* Make the build self-testing
* Regular (e.g. daily) incremental commits
* Build after every commit (to baseline)
* Keep the build fast
* Test in production environment clone
* Developers work on the latest version
* Everyone can see build results

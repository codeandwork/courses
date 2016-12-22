## Application Security
* Most programmers have been trained in terms of writing
code that implements the required functionality without
considering its many security aspects.
* As a result, they introduce "security bugs" in
their code.
* Such bugs can be exploited by attackers.


## Common Application Security Threats / Attacks
* [Code Injection](https://en.wikipedia.org/wiki/Code_injection)
* [Cross-Site Request Forgery](https://en.wikipedia.org/wiki/Cross-site_request_forgery)
* [Broken Authentication and Session Management](https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management)
* [Security Misconfigurations](https://www.owasp.org/index.php/Top_10_2013-A5-Security_Misconfiguration)


## Resources
* [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10)
* [CWE Top 25](http://cwe.mitre.org/top25/)


## Code Injection Attacks
<img src=media/tree-uml-1.png width=900 height=500 /></br>


## SQL Injection
```java
statement = "SELECT * FROM users WHERE name = '" + userName + "';"
```


## XSS (Persistent)
<img src=media/stored_xss.png width=900 height=500 /></br>


## XSS (Non-Persistent)
<img src=media/reflected_xss.png width=880 height=450 /></br>


## XSS (DOM-Based)
<img src=media/dom-based_xss.png width=880 height=570 /></br>


## CSRF
```html
<form action="/url/profile.php" method="post">
<input type="text" name="firstname"/>
<input type="text" name="lastname"/>
<br/>
<input type="text" name="email"/>
<input type="submit" name="submit" value="Update"/>
</form>
```


## CSRF (2)
```php
// initiate the session in order to validate sessions

session_start();

//if the session is registered to a valid user then allow update

if (! session_is_registered("username")) {

echo "invalid session detected!";

// Redirect user to login page
[...]

exit;
}

// The user session is valid, so process the request
// and update the information

update_profile();

function update_profile {
// read in the data from $POST and send an update
// to the database
SendUpdateToDatabase($_SESSION['username'], $_POST['email']);
[...]
echo "Your profile has been successfully updated.";
}
```


## CSRF (3)
```html
< script >

function SendAttack () {
	form.email = "attacker@example.com";
	// send to profile.php
	form.submit();
}

< /script >

<BODY onload="javascript:SendAttack();">

<form action="http://victim.example.com/profile.php" id="form" method="post">
<input type="hidden" name="firstname" value="Funny">
<input type="hidden" name="lastname" value="Joke">
<br/>
<input type="hidden" name="email">
</form>
```


## Secure Coding Practices
* User Input Validation: Consider all potentially
relevant properties, including length, type,
the range of acceptable values, and syntax
* Output Encoding: Check which input data will
be used in a dynamically generated web page that
is going to be displayed to a user
Parts of the same generated document may require
different encodings (i.e. JavaScript sections,
element attributes) and may contain malicious code.
There are many security encoding libraries that
can be utilized through the various web
application frameworks. All encoding must be
done on a trusted system


## Secure Coding Practices (2)
* Problematic APIs: Inspect API functions that
are misused in a way that renders the system
vulnerable (i.e. the gets function in C).
Note that even if such problematic functions
have been supplanted by more secure ones they
still remain available to support backwards
compatibility
* Data Protection: Sensitive data concerning
the application should be protected.
For instance, passwords should not be
stored in clear text on the server side


## Secure Coding Practices (3)
* Error Handling: In a similar manner,
sensitive data including stack traces,
system details and session identifiers
should not be revealed in error responses.
Such information may prove useful
for a malicious user searching for
vulnerabilities
* Authentication and Session Management:
For every critical functionality the
application should require strong
authentication for all pages and resources
(i.e. for money transactions enforce
authorization controls on every request).
In addition, the server’s information
interchange controls must follow well-vetted
algorithms that ensure sufficiently
random session identifiers


## Countermeasures
<img src=media/cias_countermeasures_all.png width=700 height=300 /></br>


## Program Analysis
* Lexical Analysis
* Data Flow Analysis
* Model Checking
* Symbolic Execution


## Dynamic Prevention
* Policy Enforcement
* Instruction Set Randomization
* Training
* Taint Tracking
* Parse Tree Validation


## Criteria
* Accuracy (False Positives, Negatives)
* Performance Overhead
* Ease of Use
* Security


## Practice Your Skills
[15 Vulnerable Sites To (Legally) Practice Your Hacking Skills](https://www.checkmarx.com/2015/04/16/15-vulnerable-sites-to-legally-practice-your-hacking-skills/)

## HTML5 and HTML forms

Antonis Kalipetis

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)


## Agenda

* What is HTML?
* HTML5 - what's new and awesome
* Forms - sending data to a server


## What is HTML

Hyper-text Markup Language

The way to structure your content in a webpage

Notes:
The history of HTML:

* October 1991 - HTML Tags an informal CERN document listing 18 HTML tags, was first mentioned in public.
* June 1992 - First informal draft of the HTML DTD.
* April 1995 (authored March 1995) - HTML 3.0.
* January 2008 - HTML5 was published as a Working Draft.
* 2014 HTML5 – Proposed Recommendation and Recommendation.


## Everything is a tag

HTML defines its structure in HTML tags.

An HTML page can have multiple tags in it.

```html
<tagname>content goes here...</tagname>
```


## The main HTML tags

* The `<!DOCTYPE html>` declaration defines this document to be HTML5
* The `<html>` element is the root element of an HTML page
* The `<head>` element contains meta information about the document
* The `<body>` element contains the visible page content


## A simple HTML5 structure

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Page Title</title>
</head>
<body>
    <h1>This is a Heading</h1>
    <p>This is a paragraph.</p>
</body>
</html>
```

<a href="http://www.w3schools.com/html/tryit.asp?filename=tryhtml_default" target="_blank">Try me</a>


## Content structure tags

Inside the `<body>` tag, we can include multiple HTML tags, which structure the page's content.

```html
<body>
    <h1>This is a Heading</h1>
    <p>This is a paragraph.</p>
</body>
```


## `<h*>` - Headings

Headings define the hierarchy in the titles of a webapge

The `<h1>` is the **most important** heading, while `<h6>` is the **least imoprtant** one

```html
<h1>This is heading 1</h1>
<h2>This is heading 2</h2>
<h3>This is heading 3</h3>
<h4>This is heading 4</h4>
<h5>This is heading 5</h5>
<h6>This is heading 6</h6>
```

**Imoprtant notice**: Use HTML headings for headings only. Don't use headings to make text BIG or bold.


## `<p>` - Paragraphs

Paragraphs in HTML are exactly that, paragraphs. They **separate** text blocks when the meaning of the text changes.

```html
<p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</p>
<p>
    Aenean luctus sed arcu non consectetur.
</p>
```

Is displayed as

<p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</p>
<p>
    Aenean luctus sed arcu non consectetur.
<p>


## `<a>` - Anchros

Anchros create a hyperlink that points to another place in the web.

```html
<a href="https://github.com/codeandwork" target="_blank">
    Code and Work
</a>
```

Is displayed as

<a href="https://github.com/codeandwork" target="_blank">
    Code and Work
</a>


## `<img>` - Images

Images can be loaded inside HTML pages too.

```html
<img src="media/html5.png" alt="HTML5">
```

Is displayed as

<img src="media/html5.png" alt="HTML5" width="200" height="200">


## `<ol>`, `<li>` - Ordered lists and list items

Listing items can be easily done by embedding list items in a list.

```html
<ol>
    <li>One</li>
    <li>Two</li>
</ol>
```

Is displayed as

<ol>
    <li>One</li>
    <li>Two</li>
</ol>


## `<ul>`, `<li>` - Unordered lists and list items

Changing the list type, changes the way list items are presented.

```html
<ul>
    <li>Apples</li>
    <li>Bananas</li>
</ul>
```

Is displayed as

<ul>
    <li>Apples</li>
    <li>Bananas</li>
</ul>


## `<ul>`, `<ol>` `<li>` - Listception

Of course, you can always go crazy.

```html
<ul>
    <li>Apples</li>
    <ol>
        <li>Bananas</li>
    </ol>
</ul>
```

Is displayed as

<ul>
    <li>Apples</li>
    <ol>
        <li>Bananas</li>
    </ol>
</ul>


## Formatting tags

HTML defines special elements for defining text with a special meaning.

* `<b>` - <b>Bold text</b>
* `<strong>` - <strong>Important text</strong>
* `<i>` - <i>Italic text</i>
* `<em>` - <em>Emphasized text</em>
* `<mark>` - <mark>Marked text</mark>
* `<small>` - <small>Small text</small>
* `<del>` - <del>Deleted text</del>
* `<ins>` - <ins>Inserted text</ins>


## Formatting tags

While they're good for formatting, they're even better at

telling the browser and crawlers **what your text means**.


## `<div>` vs `<span>` - Block vs inline elements

* HTML elements can be either `block` or `inline` elements
* The most common examples are **`<div>`** and **`<span>`** elements
* **Block-level** elements always start on a new line and takes up the full width available
* **Inline** elements do not start on a new line and only take up as much width as necessary


## `<div>` vs `<span>` - Block vs inline elements

```html
<div style="background-color:yellow;">
    <h1>My <span style="color:red">favourite</span> cities</h1>
    <h2>Athens</h2>
    <h2>Barcelona</h2>
</div>
```

<div style="background-color:yellow;">
    <h1>My <span style="color:red">favourite</span> cities</h1>
    <h2>Athens</h2>
    <h2>Barcelona</h2>
</div>


## HTML attributes

Attributes provide additional information about HTML elements.

* Links inside `<a>` tags
* Alternative text, width, height inside `<img>` tags


## HTML attributes

* HTML attributes are defined alongside their tags.
* They define specific properties for the tag
* Values should be quoted, while this is not mandatory

Prefered

```html
<a href="https://codeandwork.github.io/courses">Code and Work</a>
```

Correct, but should be avoided

```html
<a href=https://codeandwork.github.io/courses>Code and Work</a>
```


## New elements in HTML5

* New semantic elements like `<header>`, `<footer>`, `<article>`, and `<section>`
* New attributes of form elements like `number`, `date`, `time`, `calendar`, and `range`
* New graphic elements: `<svg>` and `<canvas>`
* New multimedia elements: `<audio>` and `<video>`


## New APIs in HTML5

* HTML Geolocation
* HTML Drag and Drop
* HTML Local Storage
* HTML Application Cache
* HTML Web Workers
* HTML Server-side events (SSE)


## Some interesting HTML5 elements

* `<header>` and `<footer>` - define the header and footer
* `<nav>` - defines the navigation area
* `<main>` - defines the main content
* `<section>` - defines different sections
* `<article>` - declaring that the content is an article


## HTML Forms

Forms are a structured and easy way to send user data over to a server.


## Creating an HTML form

* **Where** we want to send the data
* **How** we want to send the data
* **Which** are the data we want to send


## Creating an HTML form

The `<form>` HTML element

```
<form>
    .
    Form elements
    .
</form>
```


## The `<input>` element

The `<input>` element is the most imoprtant one. It has different flavors, for different types of data.

```html
<form>
    <input type="..." />
</form>
```

* `type="text"` - text input
* `type="radio"` - radio button
* `type="submit"` - form submission button


## The `<input>` element

Other `type="..."`s

* color
* email
* number
* range
* search
* tel
* date, datetime, datetime-local, time, week, month


## The `<input>` element

Attributes of `<input>` elements

* `name` - the name of the field to send to the server
* `disabled` - the field should be disabled
* `readonly` - the input field is read only
* `required` - the input field is required
* `size` - the width (in characters) of an input field
* `value` - the default value for an input field


## The `<select>` element

Defines a dropdown list

```html
<select name="cities">
    <option value="volvo">Athens</option>
    <option value="saab">Barcelona</option>
    <option value="audi">Rome</option>
    <option value="fiat">Belgrade</option>
</select>
```


## The `<textarea>` element

Defines a larger input text field

```html
<textarea name="story" rows="5" cols="60">
    This is the story of my life.
</textarea>
```


## The `action` and `method` attributes

These attributes define how and where the form will be submited

* `action` - defines the server URL that will be called
* `method` - defines which will be HTTP verb that will be used


## Form validation

Validating input is mostly handled using attributes.

* `max` - the maximum value
* `maxlength` - the maximum number of characters
* `min` - the minimum value
* `pattern` - a regular expression to check against


## A simple form

```html
<form action="/action">
    First name:<br>
    <input type="text" value="Mickey"><br>
    Last name:<br>
    <input type="text" name="lastname" value="Mouse"><br><br>
    <input type="submit" value="Submit">
</form>
```

Is displayed as

<form action="/action">
    First name:<br>
    <input type="text" value="Mickey"><br>
    Last name:<br>
    <input type="text" name="lastname" value="Mouse"><br><br>
    <input type="submit" value="Submit">
</form>


## A more complicated form

```html
<form action="/action">
    First name:<br>
    <input type="text" value="Mickey"><br>
    Date of birth:<br>
    <input type="date" name="date-of-birth"><br>
    <select name="cities">
        <option value="volvo">Athens</option>
        <option value="saab">Barcelona</option>
        <option value="audi">Rome</option>
        <option value="fiat">Belgrade</option>
    </select><br>
    <input type="submit" value="Submit">
</form>
```

Is displayed as

<form action="/action" method="post">
    First name:<br>
    <input type="text" value="Mickey"><br>
    Date of birth:<br>
    <input type="date" name="date-of-birth"><br>
    <select name="cities">
        <option value="volvo">Athens</option>
        <option value="saab">Barcelona</option>
        <option value="audi">Rome</option>
        <option value="fiat">Belgrade</option>
    </select><br>
    <input type="submit" value="Submit">
</form>


## HTTP methods

Forms are submited by default using the GET method.

* `GET` - used for getting information from the server
* `POST` - used for creating a resource

Apart from these, there are more HTTP verbs.

* `PUT` - used for changing a resource
* `PATCH` - used for **partially** changing a resource
* `DELETE` - used for deleting a resource


## Specifying the correct method

**`GET`** is the default method for forms, though it should be changed in ost of the cases.

Always use the **`POST`** when changing a user's state - log her in or out, udpate infromation, etc.

The rest of the verbs are mostly used in _APIs_, but we won't deal with them for now.


## Code styling

Last, but **definitely** not least, code style is important!

* Use correct document type
* Use lower case names in elements and attributes
* Close all HTML tags, either `<tag>content</tag>` or `<tag />`
* Avoid spaces before/after `=` equal signs, ie `href="/some-ref"`
* Avoid adding blank lines, only use them when you want to separate large code blocks

XHTML is a version of HTML that is valid XML - could be a good guideline though it's not a requirement.


## Time to train

![](media/jedi-training.jpg)


## Exercise 1

Make the image 128x128

```html
<!DOCTYPE html>
<html>
<body>

<img src="media/html5.png" width="512" height="512">

</body>
</html>
```


## Exercise 2

Add a link to Coding Bootcamp with reference to http://www.afdemp.org/bootcamp/

```html
<!DOCTYPE html>
<html>
<body>

Coding Bootcamp Link

</body>
</html>
```


## Exercise 3

Add the correct heading hierarchy to the text below.

Bonus: add your content there using paragraphs, or fill in [lorem ipsum text](http://www.lipsum.com/).

* My Awesome Blog
  * Articles
    * Article 1
    * Article 2
  * About me
    * My work
    * My education


## Exercise 4

Make an HTML form, containing an `<input>` element with `type="button"`, and `value="Submit"`.

```html
<!DOCTYPE html>
<html>
<body>
...
</body>
</html>

```


## Exercise 5

Add 2 radio buttons to the form. One for "yes", and one for "no", both with name="answer".

```html
<!DOCTYPE html>
<html>
<body>

<form>
...
</form>

</body>
</html>
```


## Exercise 6

Add a submit button to the form, and specify that the form should go to "action_page.php".

```html
<!DOCTYPE html>
<html>
<body>

<form>
Name: <input type="text" name="name">
...
</form>

</body>
</html>
```


## Exercise 7

Add the correct method to the form.

Hint: Logging in definitely changes a user's state.

```html
<!DOCTYPE html>
<html>
<body>

<form action="/login" method="...">
Username: <input type="text" name="username">
Password: <input type="password" name="password">
<input type="submit" value="Login">
</form>

</body>
</html>
```


## Test your forms!

For testing your forms, you can use the following action.

```html
<!DOCTYPE html>
<html>
<body>

<form action="http://bootcamp.akalipetis.com/debug">
Name: <input type="text" name="name">
Surname: <input type="text" name="surname">
<input type="submit" value="Register">
</form>

</body>
</html>
```


## Exercise 8

Create a form that:

* Sends a `POST` request to `http://bootcamp.akalipetis.com/ex8`
* Has the following fields
  * `username`
  * `password`

```html
<!DOCTYPE html>
<html>
<body>

<form ...>

</form>

</body>
</html>
```


## Exercise 9

Correct the form:

* Send a `GET` request to `http://bootcamp.akalipetis.com/ex9`
* Include the following fields
  * `username`
  * `favourite_colour`
* Submit it with the following values
  * `username`: `bootcamp`
  * `favourite_colour`: `green`


## Exercise 9

```html
<!DOCTYPE html>
<html>
<body>

<form ...>
Username: <input type="text" name="...">
Favourite colour:
<input type="radio" name="..." value="...">Blue<br>
<input type="radio" name="..." value="...">Yellow<br>
<input type="radio" name="..." value="...">Green<br>
<input type="submit" value="Vote">
</form>

</body>
</html>
```


## Thanks!

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)

## Static website
**Content**  
**\+ HTML**: Structure  
**\+ CSS**: Presentation  
**= Website**

A website is a way to present your content to the world, using HTML and CSS to present that content and make it look good.


## HTML
* HTML stands for Hyper Text Markup Language
* An HTML file is a text file containing markup tags
* These markup tags describe what is the structure of the website


## Anatomy of an HTML tag
Each tag has a *start tag*, *end tag*, some content in between and optional *attributes*.
```html
<tagname attribute="value">
  content
</tagname>

<a href="fedonman.open-tech.gr">
  link to my website
</a>
```


## `<html>` tag
The `<!doctype>` isn't an actual tag, but it needs to be at start of every HTML page to inform the browser which version of HTML you're using. The standard version nowadays is HTML5.

The `html` tag is always the first tag in the page.
```html
<!DOCTYPE html>
<html>
</html>
```


## `<head>` tag
The `<head>` contains *meta* information about the page, such as title, description, author information, character encoding etc.

It is also the place to load CSS files, fonts, and generally everything that needs to be loaded before the *rendering* of the page.


## `<head>` tag
`<head>` goes directly after `<html>`.
```html
<!DOCTYPE html>
<html>  
 <head>
  <meta charset="utf-8">
  <title>My new website</title>
  <description>An awesome description goes here!</description>
 </head>
</html>
```


## `<body>` tag
The body contains the actual content of the page.
```html
<!DOCTYPE html>
<html>  
 <head>
  <meta charset="utf-8">
  <title>My new website</title>
  <description>An awesome description goes here!</description>
 </head>
 <body>
   Content goes here!
 </body>
</html>
```


## What goes in the `<body>`?
1. Tags used for displaying content
2. Tags used for structuring content


## 1. Tags used for displaying content


## Headlines
The `<h1>` to `<h6>` tags are used to define HTML headings. `<h1>` defines the most important heading. `<h6>` defines the least important heading.
```html
<h1>Header 1</h1>
<h2>Header 2</h2>
...
<h6>Header 6</h6>
```
# Header 1
## Header 2
...
###### Header 6


## Paragraphs
The `<p>` tag defines a paragraph.
```html
<p>This is a paragraph.</p>
<p>This is another paragraph.</p>
```
This is a paragraph.

This is another paragraph.


## Emphasizing Text
Use `<em>` tag to give emphasis to a certain part of a paragraph or heading. `<strong>` tag denotes important text and can be nested multiple times to increase the importance level.
```html
<p>Can you tell me the <em>real reason</em>?</p>
<p><strong>Be responsible!</strong> Don't drink and drive.</p>
<p><strong><strong><strong>DANGER!</strong>NUCLEAR WEAPONS INSIDE</strong></strong></p>
```
<p>Can you tell me the <em>real reason</em>?</p>
<p><strong>Be responsible!</strong> Don't drink and drive.</p>
<p><strong><strong><strong>DANGER!</strong> NUCLEAR WEAPONS INSIDE</strong></strong></p>


## Line breaks
The `<br>` tag inserts a single line break. The `<br>` tag is an empty tag which means that it has no end tag.
```html
<p>They say the blacker the berry,<br>the sweeter the juice.<br>I say the darker the flesh,<br>then the deeper the roots.</p>
```
They say the blacker the berry,  
the sweeter the juice.  
I say the darker the flesh,  
then the deeper the roots.


## Unordered lists
The `<ul>` tag defines an unordered (bulleted) list. Use the `<ul>` tag together with the `<li>` tag to create unordered lists.
```html
<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>
```
* Coffee
* Tea
* Milk


## Ordered lists
The `<ol>` tag defines an ordered list. Use the `<ol>` tag together with the `<li>` tag to create ordered lists.
```html
<ol>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ol>
```
1. Coffee
2. Tea
3. Milk


## Nested lists
Lists can be nested and create a hierarchy.
```html
<ol>
  <li>Item 1</li>
  <li>Item 2
    <ul>
      <li>Sub-item 1</li>
      <li>Sub-item 2</li>
    </ul>
  </li>
  <li> Item 3</li>
</ol>
```
<ol>
  <li>Item 1</li>
  <li>Item 2
    <ul>
      <li>Sub-item 1</li>
      <li>Sub-item 2</li>
    </ul>
  </li>
  <li> Item 3</li>
</ol>


## Links
The `<a>` tag defines a hyperlink, which is used to link from one page to another. The most important attribute of the `<a>` tag is the `href` attribute, which indicates the link's destination.
```html
<p>Οι αιτήσεις για το 1ο Coding Bootcamp ξεκίνησαν! <a href="http://www.afdemp.org/">Μάθε περισσότερα!</a></p>
```
<p>Οι αιτήσεις για το 1ο Coding Bootcamp ξεκίνησαν! <a href="http://www.afdemp.org/">Μάθε περισσότερα!</a></p>


## Images
The `<img>` tag is used to show images. `<img>` tag has two <em>required</em> attributes: `src` and `alt`. `src` attribute contains the absolute or relative path of the image, while `alt` contains an alternate text shown if the image cannot be displayed.
```html
<img src="./media/html-andromeda.jpg" alt="Andromeda Galaxy">
<img src="http://leseed.open-tech.gr/wp-content/uploads/2015/11/fedonman.png" alt="Logo of fedonman">
```
<img src="http://www.outerspaceuniverse.org/wp-content/uploads/andromeda-galaxy-image.jpg" alt="Andromeda Galaxy">
<img src="http://leseed.open-tech.gr/wp-content/uploads/2015/11/fedonman.png" alt="Logo of fedonman">


## Video
The `<video>` tag specify a standard way to embed a video in a web page (in contrast to pre-HTML5 age when you had to use an external plug-in). We can set the width and height of the video with the `width` and `height` attributes. `controls` attribute adds controls, like play, pause and volume. `autoplay` attribute starts the video automatically.  


## Video
Inside `video` tag we can use two tags: `source` and `track`.  

The `source` element allows us to specify alternative video files. The browser will use the first compatible format. The `track` tag specifies text tracks like subtitles, that should be visible when the video is playing.   


## Video
```html
<video width="420" height="280" controls>
  <source src="http://techslides.com/demos/sample-videos/small.webm" type="video/webm">
  <source src="http://techslides.com/demos/sample-videos/small.ogv" type="video/ogg">
  <source src="http://techslides.com/demos/sample-videos/small.mp4" type="video/mp4">
  <track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English">
  <track src="subtitles_el.vtt" kind="subtitles" srclang="el" label="Greek">
</video>
```
<video width="420" height="280" controls>
  <source src="http://techslides.com/demos/sample-videos/small.webm" type="video/webm">
  <source src="http://techslides.com/demos/sample-videos/small.ogv" type="video/ogg">
  <source src="http://techslides.com/demos/sample-videos/small.mp4" type="video/mp4">
  <track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English">
  <track src="subtitles_el.vtt" kind="subtitles" srclang="el" label="Greek">
</video>


## Audio
The `audio` tag specify a standard way to embed audio in a web page without using external plug-in. It has exactly the same functionality as `video` tag.
```html
<audio controls>
  <source src="http://lyricmp3skull.co/s363640c/file/Space%20Oddity%20(Lido's%20Salute)/241740450.mp3" type="audio/mpeg">
  <p> audio tag is not supported! </p>
</audio>
```
<audio controls>
  <source src="http://lyricmp3skull.co/s363640c/file/Space%20Oddity%20(Lido's%20Salute)/241740450.mp3" type="audio/mpeg">
  Audio tag is not supported!
</audio>

The text inside the `<video>` and `<audio>` tags will only be displayed in browsers that do not support them.


## 2. Tags used for structuring content


## `<section>`
The HTML `<section>` element represents a generic section of a document, i.e., a thematic grouping of content, typically with a heading.

Each `<section>` should be identified by including a heading (`<h1>` - `<h6>` element) as a child of the `<section>` element.


## `section` example
```html
<article>
  <h1>How to use HTML5 Sectioning Elements</h1>
  <p>...</p>

  <section>
    <h2>The <main> Element</h2>
    <p>...</p>
  </section>
  <section>
    <h2>The <article> Element</h2>
    <p>...</p>
  </section>
  <section>
    <h2>The <section> Element</h2>
    <p>...</p>
  </section>
  ...
</article>
```


## `<article>`
The `<article>` element represents a self-contained composition in a document, page, application, or site, which is intended to be independently distributable or reusable.

This could be a forum post, a magazine or newspaper article, a blog entry, an object, or any other independent item of content.


## `<article>`
Each `<article>` should be identified, typically by including a heading (`<h1>`-`<h6>` element) as a child of the `<article>` element.

You can nest `<article>` elements within one another. In this case it’s implied that the nested elements are related to the outer `<article>` element.


## `<article>` example
```html
<article>
  <header>
    <h1>Blog Post Title</h1>
    <p>Posted 13th February 2014</p>
  </header>
  <p>...</p>
  <p>...</p>
  <p>...</p>
  <section>
    <h2>Comments</h2>
    <article>
      <footer>
        <p>Posted by: Joe Balochio</p>
      </footer>
      <p>This was a great article</p>
    </article>
    <article>
      ...
    </article>
  </section>
</article>
```


## `<header>`
The `<header>` element represents a group of introductory or navigational aids for its nearest sectioning content or sectioning root element.

It may contain some heading elements but also other elements like a logo, wrapped section's header, a search form, and so on.
```html
<header>
  <h1>Main Page Title</h1>
  <img src="mdn-logo-sm.png" alt="MDN logo">
</header>
```


## `<footer>`
The HTML `<footer>` element represents a footer for its nearest sectioning content or sectioning root element. A footer typically contains information about the author of the section, copyright data or links to related documents.
```html
<footer>
  Some copyright info or perhaps some author info for an &lt;article&gt;?
</footer>
```


## `<aside>`
The `<aside>` element represents a section of the page with content connected tangentially to the rest, which could be considered separate from that content.

These sections are often represented as sidebars or inserts. They often contain the definitions on the sidebars.

There may also be other types of information, such as related advertisements, the biography of the author, web applications, profile information or related links on the blog.


## `<aside>` example
```html
<article>
  <header>
    <h1>Google Buys Nest</h1>
    <p>Posted at 11:34am 13th January 2014</p>
  </header>
  <p>...</p>
  <p>...</p>

  <aside>
    <h1>Google (GOOG)</h1>
    <p>Google was founded in 1998 by Larry Page and Sergey Brin. The company...</p>
  </aside>
</article>
```


## `<nav>`
The HTML `<nav>` element (HTML Navigation Element) represents a section of a page that links to other pages or to parts within the page: a section with navigation links.

A document may have several `<nav>` elements, for example, one for site navigation and one for intra-page navigation.

Not all links of a document must be in a `<nav>` element, which is intended only for major block of navigation links; typically the `<footer>` element often has a list of links that don't need to be in a `<nav>` element.


## `<nav>` example
```html
<nav>
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```


## `<main>`
The HTML `<main>` element represents the main content of  the `<body>` of a document or application. The main content area consists of content that is directly related to, or expands upon the central topic of a document or the central functionality of an application. This content should be unique to the document, excluding any content that is repeated across a set of documents such as sidebars, navigation links, copyright information, site logos, and search forms (unless the document's main function is as a search form).


## `<address>`
The `<address>` element is one of the most commonly misunderstood HTML elements. This element is not for marking up postal address, but rather for representing the contact information for an article or web page. This could be a link to the author’s website or their email address.
```html
<address>
  Contact <a href="mailto:matt@example.com">Matt West</a>
</address>
```


## `<div>`
You should use `<div>` when there is no other more semantically appropriate element that suits your purpose. Its most common use will likely be for stylistic purposes — i.e., wrapping some semantically marked-up content in a CSS-styled container.
```html
<body>
  <div id="wrapper">
    <header>
      <h1>My Happy Blog</h1>
      <nav>
        <!-- ... -->
      </nav>
    </header>
    <!-- ... rest of site content ... -->
  </div>
</body>
```


## Forms


## Forms
HTML Forms are one of the main points of interaction between a user and a web site or application. They allow users to send data to the web site. Most of the time that data is sent to the web server, but the web page can also intercept it to use it on its own.

An HTML Form is made of one or more widgets. Those widgets can be text fields (single line or multiline), select boxes, buttons, checkboxes, or radio buttons. Most of the time those widgets are paired with a label that describes their purpose.


## `<form>`
All HTML forms start with a `<form>` element like this:
```html
<form action="/my-handling-form-page" method="post">

</form>
```
* The _action_ attribute defines the location (URL) where the form's collected data should be sent.
* The _method_ attribute defines which HTTP method to send the data with (it can be "get" or "post").


## Text input fields
Text input fields are the most basic form widgets. They are a very convenient way to let the user enter any kind of data. However, some text fields can be specialized to achieve particular needs.

It's worth noting that HTML form text fields are simple plain text input controls. This means that you cannot use them to perform rich editing


## Text input fields
All text fields share some common behaviors through attributes:
* They can be marked as `readonly` (the user cannot modify the input value) or even `disabled` (the input value is never sent with the rest of the form data)
* They can have a `placeholder`; this is text that appears inside the text input box that describes the purpose of the box briefly
* They can be constrained in `size` (the physical size of the box) and length (the maximum number of characters that can be entered into the box) with `maxlength`
* They can benefit from spell checking with `spellcheck`


## Single line text fields
A single line text field is created using an `<input>` element whose type attribute value is set to `text` (also, if you don't provide the type attribute, text is the default value). The value text for this attribute is also the fallback value if the value you specify for the type attribute is unknown by the browser.
```html
<input type="text">
```


## E-mail address field
This type of field is set with the value __email__ for the `type` attribute:
```html
<input type="email" multiple>
```
It adds this special validation constraint on the field: the user is required to type a valid e-mail address; any other content causes the field to be declared in error. It's also possible to let the user type several e-mail addresses by using the `multiple` attribute.


## Password field
This type of field is set using the value __password__ for the `type` attribute:
```html
<input type="password">
```
It doesn't add any special constraints to the entered text, but it obscures the value of the field so it can't be read.


## Search field
This type of field is set by using the value __search__ for the `type` attribute:
```html
<input type="search">
```
The main difference between a text field and a search field is one of look-and-feel (often, search fields are rendered with rounded corners). However, there is also one added feature to search fields: their values can be automatically saved to be auto completed across multiple pages on the same site.


## Phone number field
This type of field is set using __tel__ as the value of the `type` attribute:
```html
<input type="tel">
```
Due to the wide variety of phone number formats around the world, this type of field does not enforce any constraints on the value entered by a user. This is primarily a semantic difference, although on some devices (especially on mobile), a different virtual keypad might be presented.



## URL field
This type of field is set using the value __url__ for the `type` attribute:
```html
<input type="url">
```
It adds special validation constraints on the field, ensuring that only valid URLs are entered; if a value is entered that isn't a well-formed URL, the form is considered to be in an error state.


## Multi-line text fields
A multi-line text field is specified using a `<textarea>` element, rather than using the `<input>` element.
```html
<textarea cols="20" rows="10"></textarea>
```
The main difference between a textarea and a regular single line text field is that users are allowed to type text that includes hard line break (meaning it allows the characters carriage return [CR] and line feed [LF]).


## Drop-down content
Drop-down widgets are a simple way to let the user select one of many options. HTML has two forms of drop down content: the select box and autocomplete content. In both cases the interaction is the same. Once the control is activated, the browser displays a list of values the user can select among. This list of values is displayed on top of the page content.


## Select box
A select box is created with a `<select>` element with one or more `<option>` elements as its children, each of which specifies one of its possible values.
```html
<select>
  <option>Banana</option>
  <option>Cherry</option>
  <option>Lemon</option>
</select>
```


## Select box
If needed, the default value for the select box can be set using the selected attribute on the desired `<option>` element. The `<option>` elements can also be nested inside some `<optgroup>` elements to create visual groups of values:
```html
<select>
  <optgroup label="fruits">
    <option>Banana</option>
    <option selected>Cherry</option>
    <option>Lemon</option>
  </optgroup>
  <optgroup label="vegetables">
    <option>Carrot</option>
    <option>Eggplant</option>
    <option>Potatoe</option>
  </optgroup>
</select>
```


## Multi-choice select box
By default, a select box only lets the user select a single value. By adding the `multiple` attribute to the `<select>` element, the user becomes able to select several values. In that case, however, the select box no longer displays the values as dropdown content; instead, it's displayed as a regular list box.
```html
<select multiple>
  <option>Banana</option>
  <option>Cherry</option>
  <option>Lemon</option>
</select>
```


## Auto-complete content
You can provide suggested, automatically-completed values for form widgets using the `<datalist>` element with some child `<option>` elements to specify the values to display. Once set, the data list is bound to another widget using the `list` attribute.

Once a data list is affiliated with a form widget, its options are used to auto-complete text entered by the user; typically, this is done by presenting a drop-down box listing possible matches.


## Auto-complete content
```html
<label for="myFruit">What's your favorite fruit?</label>
<input type="text" id="myFruit" list="mySuggestion" />
<datalist id="mySuggestion">
  <option>Apple</option>
  <option>Banana</option>
  <option>Blackberry</option>
  <option>Blueberry</option>
  <option>Lemon</option>
  <option>Lychee</option>
  <option>Peach</option>
  <option>Pear</option>
</datalist>
```


## Checkable items
Checkable items are widgets whose state you can change by clicking on them. There are two kinds of checkable item: the check box and the radio button. Both use the checked attribute to indicate whether the widget is checked by default or not.

It's worth noting that these widgets do not behave exactly like other form widgets. For most form widgets, once the form is sent, all widgets that have a `name` attribute are sent, even if there is no value. In the case of checkable items, their values are sent only if they are checked. If they are not checked, nothing is sent, not even their name.


## Check box
A check box is created by using the `<input>` element with its `type` attribute set to the value __checkbox__.
```HTML
<input type="checkbox" checked>
```
The checkbox created by the preceding HTML is checked by default.


## Radio button
A radio button is created by using the `<input>` element with its `type` attribute set to the value __radio__.
```html
<input type="radio" checked>
```
Several radio buttons can be tied together. If they share the same value for their name attribute, they will be considered to be in the same group of buttons. Only one button in a given group may be checked at the same time; this means that when one of them is checked all the others automatically get unchecked.


## Radio button
```html
<fieldset>
  <legend>What gender are you?</legend>
  <p><label for="g1"><input type="radio" name="g" id="g1" value="M"> Male</label></p>
  <p><label for="g2"><input type="radio" name="g" id="g2" value="F"> Female</label></p>
  <p><label for="g3"><input type="radio" name="g" id="g3" value="B"> Both</label></p>
  <p><label for="g4"><input type="radio" name="g" id="g4" value="N"> None</label></p>
  <p><label for="g5"><input type="radio" name="g" id="g5" value="!"> This is not your concern!</label></p>
  <p><label for="g6"><input type="radio" name="g" id="g6" value="?"> Who cares?</label></p>
  <p><label for="g7"><input type="radio" name="g" id="g7" value="\o/"> Obi-Wan Kenobi</label></p>
</fieldset>
```


## Buttons
Within HTML forms, there are three kinds of button:
* __Submit__

  Sends the form data to the server.
* __Reset__

  Resets all form widgets to their default values.
* __Anonymous__

  Buttons that have no automatic effect but can be customized using JavaScript code.


## Buttons
A button is created using a `<button>` element or an `<input>` element. It's the value of the type attribute that specifies what kind of button is displayed:

```html
<!-- Submit -->
<button type="submit">
    This a <br><strong>submit button</strong>
</button>
<input type="submit" value="This is a submit button">
```
```html
<!-- Reset -->
<button type="reset">
    This a <br><strong>reset button</strong>
</button>
<input type="reset" value="This is a reset button">
```
```html
<!-- Anonymous -->
<button type="button">
    This an <br><strong>anonymous button</strong>
</button>
<input type="button" value="This is an anonymous button">
```


## Numbers
Widgets for numbers are created with the `<input>` element with its type attribute set to the value __number__. This control looks like a text field but allows only floating-point numbers, and usually provides some buttons to increase or decrease the value of the widget.

It's also possible to constrain the value by setting the `min` and `max` attributes. You can also specify the amount by which the increase and decrease buttons change the widget's value by setting the `step` attribute.
```html
<input type="number" min="1" max="10" step="2">
```


## Sliders
Another way to pick a number is to use a slider. Because, visually speaking, these are less accurate than text fields, sliders are used to pick a number whose exact value is not necessarily important.

A slider is created by using the `<input>` with its type attribute set to the value __range__. It's also highly recommended that you set the `min`, `max`, and `step` attributes.
```html
<input type="range" min="1" max="5" step="1">
```


## Date and time picker
Gathering date and time values has traditionally been a nightmare for web developers. HTML5 brings some enhancements here by providing a special control to handle this specific kind of data.

A date and time control is created using the `<input>` element and the proper value for the type attribute. Because you may wish to collect a date, a time, or both, there are several different available values for the `type` attribute.


## Date and time picker
This creates a widget to display and pick a date but without any time.
```html
<input type="date">
```

This creates a widget to display and pick a date with time in the UTC time zone.
```html
<input type="datetime">
```

This creates a widget to display and pick a date with time in any specific time zone.
```html
<input type="datetime-local">
```


## Date and time picker
This creates a widget to display and pick a month with a year.
```html
<input type="month">
```

This creates a widget to display and pick a time value.
```html
<input type="time">
```

This creates a widget to display and pick a week number and its year.
```html
<input type="week">
```


## Date and time picker
All date and time control can be constrained using the min and max attributes.
```html
<label for="myDate">When are you available this summer?</label>
<input type="date" min="2013-06-01" max="2013-08-31" id="myDate">
```


## File picker
HTML forms are able to send files to a server. The file picker widget is how the user can choose one or more files to send.

To create a file picker widget, you use the `<input>` element with its type attribute set to file. The types of files that are accepted can be constrained using the `accept` attribute. In addition, if you want to let the user pick more than one file, you can do so by adding the `multiple` attribute.

In this example, a file picker is created requesting graphic image files. The user is allowed to select multiple files.
```html
<input type="file" accept="image/*" multiple>
```

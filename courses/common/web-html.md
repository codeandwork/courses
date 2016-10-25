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


## `<article>`


## `<header>`


## `<footer>`


## `<aside>`


## `<nav>`


## `<div>`

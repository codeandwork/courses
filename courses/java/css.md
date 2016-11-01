## Introduction to CSS

Antonis Kalipetis

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)


## Agenda

* What is CSS?
* CSS selectors
* Styling our HTML


## What is CSS

* **CSS** stands for **C**ascading **S**tyle **S**heets
* Styles our HTML elements, to make them look pretty
* We can re-use the same stylesheets across multiple pages


## Adding CSS to HTML elements

CSS can be added to HTML elements using the `style="..."` attribute

```html
<p style="...">Styled paragraph content</p>
```


## An old CSS example

```html
<div style="background-color:yellow;">
    <h1>My <span style="color:red">favourite</span> cities</h1>
    <h2>Athens</h2>
    <h2>Barcelona</h2>
</div>
```

**Rendered:**

<div style="background-color:yellow;">
    <h1>My <span style="color:red">favourite</span> cities</h1>
    <h2>Athens</h2>
    <h2>Barcelona</h2>
</div>


## CSS Styling

CSS styling is made by defining CSS declarations - `property: value` pairs.

Each element is rendered after applying the declarations that match it.

```html
<div style="background-color:yellow;">
    <h1>My <span style="color:red">favourite</span> cities</h1>
    <h2>Athens</h2>
    <h2>Barcelona</h2>
</div>
```

Notes:

* Make the background of `div` yellow
* Make the text colour of `span` red


## Are we really going to add `style` to each and every element?

Of course not!


## How can I add stylesheets then?

* By adding styling using `style="..."` attributes
* By adding styling using `<style>` tags inside the `<head>`
* By inclusing CSS files using `<link rel="stylesheet" href="...">` tags inside the `<head>`


## CSS selectors

CSS can be applied to one or multiple elements using CSS selectors.

* The `element` selector appplies to all HTML elements with the `<element>` tag
* The `#id` selector applies to elements with a specific `id="id"` attribute
* The `.class` selector applies to elements containing a specific `class="class"` attribute


## Simple CSS syntax

```css
selector {
    property: value;
}
```

Notes:

* Start with a selector
* Add one or more declarations
  * Include properties and their values


## The previous example, with proper CSS

```html
<style>
    .bg-yellow {
        background: yellow;
    }
    .text-red {
        color: red;
    }
</style>
...
<div class="bg-yellow">
    <h1>My <span class="text-red">favourite</span> cities</h1>
    <h2>Athens</h2>
    <h2>Barcelona</h2>
</div>
```


## Advanced CSS selectors

CSS has more advanced selectors, for example

* `element element` - selects all elements inside a certain element
* `element>element`	- selects all elements where the direct parent is a certain element
* `:hover` - selects elements on mouse over
* `element.class` - combile selectors, all elements that have a class


## Defining colours in CSS

In CSS, there are multiple wayts to define a colour

* Valid colour names, ie `red`, `blue`, `yellow`, `green`
* **R**red, **G**reen, **B**lue, (**A**lpha), ie `rgba(255, 0, 0, 0.3)`, `rgb(255, 0, 0)`
* HEX colour codes, ie `#fefefe`

Notes:

* Valid colour codes include most common colours
  * Usually not the best choice
* RGB colours can take values 0-255, while RGBa alpha can be 0-1
* HEX colour codes are exactly the same as RGB colours with 6 characters
  * Values are 00-FF, same as RGB


## CSS Backgrounds

Adding a background to an element

* `background-color`
* `background-image`
* `background-repeat`
* `background-attachment`
* `background-position`


## CSS `display: ...` property

The `display` property is the most important one for handling layout.

* `display: block;` - used for making an `inline` element a `block` one
* `display: inline;` - used for making an `block` element a `inline` one


## Hiding elements

* `display: none;` - used for hiding elements
* `visibility: hidden` - used for hiding elements, but they still keep their space 


## Hiding elements

```html
<p>First</p>
<p style="display: none;">Second</p>
<p>Third</p>
<p style="visibility: hidden">Fourth</p>
<p>Fifth</p>
```

**Rendered:**

<p>First</p>
<p style="display: none;">Second</p>
<p>Third</p>
<p style="visibility: hidden">Fourth</p>
<p>Fifth</p>

Notes:

* Use `display: none` to completely hide an element
* Use `visibility: hidden` to hide an element and show it again, without the content moving around


## Positioning elements

Positioning can be made using the following ways

* `static` - the default positioning
* `relative` - relative to its normal position
* `fixed` - fixed inside the viewport, not affected by scrolling
* `absolute` - absolutely positioned relative to the closest ancestor

Notes:

* Use `static` and `relative` for most of the cases
* Use `fixed` if you want elements sticking in the viewport
* Use `absolute` only in special cases and when you know what you're doing


## References

* [http://www.w3schools.com/css/default.asp](http://www.w3schools.com/css/default.asp)
* [http://www.w3schools.com/cssref/css_selectors.asp](http://www.w3schools.com/cssref/css_selectors.asp)
* [https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started)


## Time to train

<img src="media/jedi-training.jpg" alt="Time to train" height="336" width="500"/>


## Exercise 1

Add a `green` background to the whole body

```html
<!DOCTYPE html>
<html>
<head>
    <style>
        
    </style>
</head>
<body>
</body>
</html>
```


## Exercise 2

Create a page with a blue div, that stays in the bottom of the screen at all times


## Exercise 3

Create an external CSS file, import it to an HTML page and make all paragraphs have red-coloured text


## Exercise 4

Make all paragraphs have a blue yellow, except the last one.

_Hint_: Use a special selector

```html
<!DOCTYPE html>
<html>
<head>
    <style>
        
    </style>
</head>
<body>
    <p>First</p>
    <p>Second</p>
    <p>Third</p>
    <p>Fourth</p>
    <p>Fifth</p>
</body>
</html>
```


## Thanks!

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)

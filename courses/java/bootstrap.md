## Grids and columns with Bootstrap

Antonis Kalipetis

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)


## Agenda

* What is Bootstrap?
* Understanding the grid
* Creating a simple Bootstrap-enabled page


## What is Bootstrap

Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web

Notes:

* Developed initially by Twiter
* Uses a flex grid to position the elements in a page
* Has nice and easy defaults for things like buttons, annotations, forms, etc


## Using Bootstrap

* Bootstrap can be easily loaded from a CDN
  * Meaning there's no need to add any files in your code, just the declarations in the HTML
* Styling elements is done using Bootstrap's special classes
* Everything is positioned using the grid


## The Bootstrap grid

Bootstrap includes a **responsive**, **mobile** first fluid grid system that appropriately scales up to **12 columns** as the device or viewport size increases. It includes **predefined classes** for easy layout options, as well as powerful mixins for generating more semantic layouts.


## The grid classes

* `container` or `container-fluid` - the container of a grid, use `fuild` for full-width
* `row` - each row of the grid
* `col-xs-*` - defines 1-12 columns in an extra small device (phone)
* `col-ms-*` - defines 1-12 columns in a medium device (tablet)
* `col-ls-*` - defines 1-12 columns in a large device (desktop)


## Creating a grid

Start with a `container` or `container-fluid`

```html
<div class="container">
    ...
</div>
```


## Creating a grid

Add one or more `row`s

```html
<div class="container">
    <div class="row">
        ...
    </div>
</div>
```


## Creating a grid

Add `col-*`s

```html
<div class="container">
    <div class="row">
        <div class="col-xs-4">I take 1/3 of the grid</div>
        <div class="col-xs-6">I take half the grid</div>
        <div class="col-xs-2">I take 1/6 of the grid</div>
    </div>
</div>
```


## Creating a grid

You can even mix `col-*`s to create custom behaviours

```html
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">I take all the mobile screen and half the tablet/desktop</div>
        <div class="col-xs-6 col-md-3">I take half mobile</div>
        <div class="col-xs-6 col-md-3">1/4 table/desktop</div>
    </div>
</div>
```


## Page header

```html
<div class="page-header">
    <h1>Example page header <small>Subtext for header</small></h1>
</div>
```


## Jumbotron

```html
<div class="jumbotron">
    <h1>Hello, world!</h1>
    <p>...</p>
    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>
```


## Navbar

```html
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">
                <img alt="Brand" src="...">
            </a>
        </div>
    </div>
</nav>
```


## Breadcrumbs

```html
<ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Library</a></li>
    <li class="active">Data</li>
</ol>
```


## Let's create a page together

![](media/party.jpg)


## References

* [http://getbootstrap.com/](http://getbootstrap.com/)
* [http://www.w3schools.com/bootstrap/default.asp](http://www.w3schools.com/bootstrap/default.asp)


## Time to train

<img src="media/jedi-training.jpg" alt="Time to train" height="336" width="500"/>


## Exercise

Move your project's page to Bootstrap


## Thanks!

[@akalipetis](https://twitter.com/akalipetis) - [https://www.akalipetis.com](https://www.akalipetis.com)

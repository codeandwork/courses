## Basics
* We use [reveal.js](http://lab.hakim.se/reveal-js/) for our slides,
  but this should be transparent to you
* We write slides either in Markdown or as a Jupyter Notebook
* More details follow


## Markdown slides
* Write slides in [GitHub flavoured Markdown](https://help.github.com/categories/writing-on-github/)
* Start title text with `##` followed by a space
* Start bullet items with `*` followed by a space
* Separate each slide from the next with two empty lines
* Add hyperlinks using the `[`_text_`](`_URL_`)` syntax


## Example
```md
## First slide title
* Bullet item 1
* Bullet item 2
 
 
## Second slide title
```


## Code listings
* Code listings are automatically highlighted
* Start a code listing with three backticks followed by the language's suffix
  on a single line
* Example:
```md
 ```java
 ```cs
 ```sql
 ```js
 ```HTML
```
* End code listings with three backticks on a single line
* Indent Markdown code with a space to avoid it being interpreted by _reveal.js_
* Prepend a space when closing a script tag in HTML listings (`</ script>`)
* Avoid two blank lines in the code; they confuse *reveal.js*.


## Images and other media
* Place images in the `media` directory under the corresponding course
  directory
* Insert media on a slide with the syntax `![](media/`_filename_`)`
* Example:
```md
![](media/hello.png)
```
* Use the PNG format for clipart and JPEG for photographs


## File organization
* Each lecture is written as a single Markdown or as a Jupyter Notebook file
* Name the file using Java variable identifier rules
* Suffix the Markdown file name with `.md`
* Example: `unitTests.md`
* Suffix the Jupyter file name with `.ipynb`


## Folder organization
* Place the file in one of the following folders
  * `java`: Java material
  * `cs`: C# material
  * `common`: Material common to both courses
  * `admin`: Course instructor and administrator material


## Linking lectures into a course
* Within the `courses` directory create or edit a Markdown file named after
  the course
  * Use a level-1 title for the course
  * Use a level-2 title for units
  * Enter each lecture as a separate bullet
* Example

```md
# Coding bootcamp: Java specialization
## Test driven development and object-oriented programming
* [Hello world!](java/hello.md)
* [Constructing and using objects](java/objects.md)
* [Python classes](common/pythonClasses.ipynb)
```


## Contributions
* You can perform small changes directly on the [GitHub repository](https://github.com/codeandwork/courses)
* For substantial work it is recommended that you work on a local repository
* Commit your changes with [proper commit messages](http://chris.beams.io/posts/git-commit/)
* Do not forget to push after committing


## Editing and build tools
* You will need to have the following tools installed
  * A Unix shell
  * Git
  * [Pandoc](http://pandoc.org/)
  * [rsync](https://rsync.samba.org/)
  * [Jupyter Notebook](http://jupyter.org/)
* This setup is trivial on Mac and Linux systems
* On Windows systems we recommend the installation of [Cygwin](https://www.cygwin.com/)
* [Anaconda](https://www.continuum.io/downloads) simplifies the Jupyter Notebook installation


## Building and deploying
* First clone the [GitHub repository](https://github.com/codeandwork/courses)
* Run `make` to build the presentation and note handouts
* This generates the material in the `web` directory
* View the presentations and handouts through [this link](../index.html)
* Pushing your changes will result in an automatic update of the [web site](https://codeandwork.github.io/courses/)


## Style
* Use lower case in titles, Not Title Case
* Start each bullet item with a capital
* Don't punctuate at the end of bullet items
* Spell-check what you write
* Use British spelling
* Don't pack your slides with text
* Take care of capitalization: JavaScript, SQL, Java, C#, Git, GitHub
* Put names of code and commands in backticks, e.g. \`main\` or \`git\`
* Avoid lines longer than 67 characters

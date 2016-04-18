# Nanotechnology Engineering Workterm Report in LaTeX

This is a LaTeX document class that was written with the intention of making the formatting of NE workterm reports easier.

The class was written by Michal Kononenko, with help from Paulo Miguel.

The package was written to conform to the work report guidelines v_1.1 in the Nanotechnology Engineering WKRPT 300 course. While we try our best to conform to the standard, we can IN NO WAY GUARANTEE THAT THIS PACKAGE WILL FORMAT THE WORK TERM REPORT PROPERLY. There may be bugs. Therefore, we must be vigilant. If you find a bug, please report it [here](https://github.com/MichalKononenko/UWWorkTermReport/issues/new).

## Why Use LaTeX?

If you have never used LaTeX before, then you should give it a try. LaTeX is a fairly easy to use document preperation system that allows for high quality typesetting. LaTeX is especially useful when writing math equations in line and when dealing with tables and figures.

The best part of this class is that almost everything is done for you. Take a look at the example workterm report (```example.tex```) that is included in our package and you'll see how easy LaTeX can be.

You can also find more information on how to use LaTeX online:

* [FAQ][1]
* [Getting Started with LaTeX][2]

[1]: http://faq.tug.org
[2]: http://www.tug.org/begin.html

## Using UWWorkTermReport

Using the package is extremely easy. The ```example.tex``` file has all the commands required to create the sections in the front matter, body, and back matter, Most importantly, it takes care of all the formatting as described in the WKRPT x00 documentation. It also explains the commands required to write math equations, insert figures and automatically generate your back matter.

Most importantly, this class automatically deals with page numbering, the table of contents, the list of figures and the list of figures, allowing you to only need to think about what to write and not how to format the document itself.

## Useful Documentation

The following is a list of documentation pertaining to a few commands and packages that are useful when writing a workterm report. The majority of these packages and commands are used in the ```example.tex``` file. This list is meant to be used as further instructions if the ```example.tex``` is unclear.

* [Tables][3]
* [Math using AMSMath package][4]
* [Figures][5]
* [Glossary and Acronyms][6]

[3]: https://www.sharelatex.com/learn/Tables
[4]: http://bit.ly/1SOkDHR
[5]: https://www.sharelatex.com/learn/Positioning_of_Figures
[6]: https://www.sharelatex.com/learn/Glossaries

For more general documentation on LaTeX environments and commands, [sharelatex.com][7] is an extremely useful resource.

[7]: https://www.sharelatex.com/


## Compiling example.tex

Popular document editors like Microsoft Word are built on the principle of "WYSIWYG", or "What You See Is What You Get". LaTeX is not one of those editors. As a result, LaTeX requires a separate "compilation" step between you writing your ```.tex``` file, and converting that file into a ```.pdf``` file suitable for publishing or submission. Furthermore, some of the dynamic features like glossaries and references require are not part of a "standard" LaTeX compilation process. The onus is on you, the user, to run the ```makeglossaries``` and ```bibtex``` commands in the appropriate order to build your work term report.
In order to successfully build the example document, you will need a TeX back end to do the actual typesetting. This project was tested with [TeXLive][8] as the back end.

[8]: https://www.tug.org/texlive/

Ensure that you have ```pdflatex```, ```bibtex```, and ```makeglossaries``` available on your machine. You can check if you have them by using the ```which``` command, followed by the name of the program. On Windows, the command is ```where```. If this works, follow the instructions below.

1. ```cd``` into the ```src``` directory of this repository.
2. Run ```pdflatex example.tex```. When you will be making your work term report, you will replace ```example.tex``` with your own ```.tex``` file. You should see a bunch of files in the source directory.
3. Run ```bibtex example```. Notice the omission of the file extension. This is intentional. This will build a database of citations using a ```.bib``` file that you specify in your ```.tex``` file.
4. Run ```makeglossaries example```, again omitting the file extension. This program works similarly to ```bibtex```, but it builds the glossary instead of the bibliography.
5. Run ```pdflatex example.tex```. This second run of ```pdflatex``` updates the build with the glossaries and references.
6. At this point, you should see an ```example.pdf``` file in the ```src``` directory. This is the completed build.

## Contributors

* Michal Kononenko (mkononen@uwaterloo.ca)
* Paulo Miguel (pmiguel@uwaterloo.ca)

# Programming guide for the `capm` R package
#### Oswaldo Santos Baquero
#### Markos Amaku
#### Fernando Ferreira
<br>
Contact: <oswaldosant@gmail.com>
<br>
Last revision: 16 June 2016  
In case of not being reading the online version, this version might be outdated.  
Click [here](https://www.gitbook.com/book/oswaldosantos/programming-guide-for-the-capm-r-package/details) to access the book's webpage.
<br><br><br><br>

The purpose of this guide is to show you how to implement the general [workflow](http://oswaldosantos.github.io/capm) supported by the `capm`, without going into theoretical details or practical implications (these will be the focus of research papers and other complementary documentation).  
 
#### Assumptions to reproduce this guide:

* Minimal background in R programming.
* Familiarity with R functions' help pages.
* `capm` version 0.9.1 installed.
* The current working directory must contain the following files: 
 * pilot.csv
 * psu.ssu.csv
 * santos.dbf
 * santos.prj
 * santos.shp
 * santos.shx
 * survey.data.csv

These files can be downloaded [here](https://github.com/oswaldosantos/programming-guide-for-the-capm-r-package) using the "Clone or download" button and the "Download ZIP" link. After decompressing the directory, the files will be found in the "rmds" subdirectory.  

We will not use all the `capm` functions and for those used, only some arguments will be explored. Please, see the functions' help pages for details.
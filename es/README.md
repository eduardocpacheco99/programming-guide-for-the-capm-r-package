# Programming guide for the `capm` R package
#### Oswaldo Santos Baquero
oswaldosant@gmail.com  
Last revision: 8/3/2015
<br><br><br><br>

In this guide I will show you how to implement the general [workflow](http://oswaldosantos.github.io/capm) supported by the `capm`, without going into theoretical details or practical implications (these will be the focus of research papers and other complementary documentation).  
 
#### Assumptions to reproduce this guide:

* Minimal background in R programming.
* Familiarity with R functions' help pages.
* `capm` version 0.7.2 installed.
 * Current CRAN version is 0.7.0, so install the version 0.7.2 using `install_github('capm', 'oswaldosantos')` after loading the `devtools` package.
* The current working directory must contain the following files: 
 * pilot.csv
 * psu.ssu.csv
 * santos.dbf
 * santos.prj
 * santos.shp
 * santos.shx
 * survey.data.csv

This files can be downloaded [here](https://github.com/oswaldosantos/programming_guide_for_the_capm_package) using the "Download ZIP" button at the bottom right.  

I will not use all the `capm` functions and the functions that I will use have additional arguments that give more flexibility. Please, see the functions' help pages for details.
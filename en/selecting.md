

## Selecting sampling units

With the `capm` package it is possible to implement three sample designs:  
* Systematic random sampling  
* Stratified random sampling  
* Complex random sampling (two-stage cluster desings with PPS selection)  

Let's implement a two-stage cluster design, the most challenging but also the most appropriate in some situations (large cities). The file `psu.ssu.csv` contains data of Santos city in Brazil.  Data were extracted from a bureau of Statistics ([IBGE](http://ibge.gov.br)). The first column has unique identifiers of census tracks, our Primary Sampling Units (PSU's). The second column contains the number of households in each PSU. Households are our Secondary Sampling Units (SSU's) and they are also the measure of size for PSU's.  

Load the package and import the file.


```r
> library(capm)
> psu.ssu <- read.csv(file = 'psu.ssu.csv')
```

We can see that there are 652 PSU's and the first six rows give us an idea of the data.


```r
> nrow(psu.ssu); head(psu.ssu)
```

```
[1] 652
```

```
         psu ssu
1 3.5485e+14 119
2 3.5485e+14  43
3 3.5485e+14  79
4 3.5485e+14 129
5 3.5485e+14  53
6 3.5485e+14  46
```

All PSU's are apparently equal due to scientific notation output. The identifiers must be unique for each PSU. To verify this requirement we can change the printing default or verify that the number of different identifiers is equal to the number of PSU.


```r
> print(head(psu.ssu), digits = 15)
```

```
              psu ssu
1 354850005000001 119
2 354850005000002  43
3 354850005000003  79
4 354850005000004 129
5 354850005000007  53
6 354850005000008  46
```

```r
> length(unique(psu.ssu[ , 1]))
```

```
[1] 652
```

The file contains exactly the information we need to sample PSU's with probability proportional to their sizes (PPS), with replacement. If the `write` argument of `SamplePPS` is set as `TRUE`, selected PSU will be saved in a "csv" file, which can be viewed in a spreadsheet software. The output will have as many rows as selected PSU's. Remember that the a PSU can be selected more than once because sampling is with replacement.   

If we use `set.seed(some_number)`, the next pseudo random sample always will be the same. In this guide I will use `set.seed(4)` so you can reproduce exactly all the examples. However, in real applications you must not use `set.seed`.


```r
> set.seed(4)
> pilot.psu <- SamplePPS(psu.ssu = psu.ssu,
+                        psu = 10,
+                        write = FALSE)
```

Inspecting the object we have just created, we can see that the PSU's identifiers `class` were converted to `character`. This means that identifiers are now represented as text, not as numbers.


```r
> str(pilot.psu, vec.len = 1)
```

```
'data.frame':	10 obs. of  2 variables:
 $ selected.psu: chr  "354850005000377" ...
 $ size        : int  210 409 ...
```

```r
> head(pilot.psu)
```

```
     selected.psu size
1 354850005000377  210
2 354850005000012  409
3 354850005000195  288
4 354850005000185  224
5 354850005000524  227
6 354850005000174  243
```

Selecting SSU's is as simple as the previous selection. The output will have as many rows as selected SSU's in each PSU and as many columns as selected PSU's.


```r
> set.seed(4)
> pilot.ssu <- SampleSystematic(
+     psu.ssu = pilot.psu,
+     su = 5, write = FALSE)
```

Let's see the first two columns to have an idea.


```r
> head(pilot.ssu[ , 1:2])
```

```
     354850005000377 354850005000012
[1,]              25               1
[2,]              67              82
[3,]             109             163
[4,]             151             244
[5,]             193             325
```

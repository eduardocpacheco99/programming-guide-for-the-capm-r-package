



Population pyramids summarizes the basic composition of a population. At minimum, they are built from age and sex variables but they can be conditioned on a third categorical variable. The data to be used must have each variable in a separate column and those columns must be specified in the respective arguments' function.


```r
> matrix(names(survey.data), ncol = 1)
```

```
      [,1]                     
 [1,] "interview_id"           
 [2,] "psu"                    
 [3,] "dogs"                   
 [4,] "sex"                    
 [5,] "age"                    
 [6,] "sterilized"             
 [7,] "sterilized.ly"          
 [8,] "births"                 
 [9,] "present"                
[10,] "fate"                   
[11,] "acquired"               
[12,] "outside"                
[13,] "acquired.ly"            
[14,] "immigrant"              
[15,] "immigrant.ly"           
[16,] "immigrant.sterilized.ly"
```

```r
> PlotPopPyramid(dat = survey.data,
+                age.col = 'age',
+                sex.col = 'sex')
```

![plot of chunk pyramids](figures/pyramids-1.png) 

```r
> PlotPopPyramid(dat = survey.data,
+                age.col = 5,
+                sex.col = 4,
+                str.col = 6)
```

![plot of chunk pyramids](figures/pyramids-2.png) 



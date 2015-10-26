



## Construyendo pirámides poblacionales

Las pirámides poblaciones resumen la composición básica de la población. Como mínimo, son construidas a partir de las variables "edad" y "sexo", pero pueden estar condicionadas por una tercera variable categórica. Las variables deben ser espcificadas en los respectivos argumentos de la función.

Antes de crear las pirámides, cambiemos las categorías de las variables "sexo" y "esterilizado" para que el texto de los gráficos quede en español.


```r
> survey.data[ , 4] <- as.character(survey.data[ , 4])
> survey.data[ , 4] <-
+     ifelse(survey.data[ , 4] == 'Female', 'Hembra', 'Macho')
> survey.data[ , 4] <- as.factor(survey.data[ , 4])
> survey.data[ , 6] <- as.character(survey.data[ , 6])
> survey.data[ , 6] <-
+     ifelse(survey.data[ , 6] == 'yes', 'si', 'no')
> survey.data[ , 6] <- as.factor(survey.data[ , 6])
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
+                sex.col = 'sex',
+                stage.label = 'Años')
```

![plot of chunk pyramids](figures/pyramids-1.png) 

```r
> PlotPopPyramid(dat = survey.data,
+                age.col = 5,
+                sex.col = 4,
+                str.col = 6,
+                stage.label = 'Años',
+                legend.label = 'Esterilizados')
```

![plot of chunk pyramids](figures/pyramids-2.png) 



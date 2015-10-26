



## Estimando características demográficas

Habiendo definido la muestra final, supongamos que fuimos a visitar todas las residencias seleccionadas y los datos colectados fueron guardados en un archivo llamado `survey.data.csv` (la página de ayuda de `survey.data` describe las variables).


```r
> survey.data <- read.csv('survey.data.csv')
> head(survey.data)
```

```
  interview_id        psu dogs    sex age sterilized
1            1 3.5485e+14    1   Male   9        yes
2            1 3.5485e+14    1 Female   1         no
3            2 3.5485e+14    1 Female   7        yes
4            3 3.5485e+14    1   Male  11         no
5            4 3.5485e+14    1 Female  13         no
6            5 3.5485e+14    1 Female   3         no
  sterilized.ly births present    fate     acquired outside
1           yes      0     yes in_home       bought      no
2            no      0     yes in_home       bought      no
3            no      0     yes in_home       bought      no
4            no      0     yes in_home born_in_home      no
5            no      0     yes in_home         gift     yes
6            no      0     yes in_home      adopted      no
  acquired.ly immigrant immigrant.ly immigrant.sterilized.ly
1          no       yes         <NA>                    <NA>
2         yes       yes          yes                      no
3         yes       yes          yes                      no
4          no        no           no                    <NA>
5          no       yes         <NA>                    <NA>
6         yes        no           no                    <NA>
```

Para estimar los parámetros poblacionales, el primer paso es definir el diseño muestral que dió origen a los datos. Para hacerlo, necesitamos un archivo con todas las unidades muestrales de la población (`psu.ssu`) y un archivo con los datos muestrales (`survey.data`). Este último archivo, debe tener una columna con las UPM, otra con las USM y otra con el número de UPM incluídas en la muestra (si una UPM fue seleccionada más de una vez, cada ocurrencia debe ser contada).


```r
> design <- DesignSurvey(sample = survey.data,
+                        psu.ssu = psu.ssu,
+                        psu.col = 2,
+                        ssu.col = 1,
+                        psu.2cd = 20)
```

Definir el tipo de estimativa para cada variable es facil.


```r
> variables <- c('total', 'prop', 'mean', 'prop',
+                'prop', 'total', rep('prop', 8))
```

Es conveniente confirmar que hemos definido el tipo de estimativa que queremos.


```r
> cbind(names(design$variables), variables)
```

```
                                variables
 [1,] "dogs"                    "total"  
 [2,] "sex"                     "prop"   
 [3,] "age"                     "mean"   
 [4,] "sterilized"              "prop"   
 [5,] "sterilized.ly"           "prop"   
 [6,] "births"                  "total"  
 [7,] "present"                 "prop"   
 [8,] "fate"                    "prop"   
 [9,] "acquired"                "prop"   
[10,] "outside"                 "prop"   
[11,] "acquired.ly"             "prop"   
[12,] "immigrant"               "prop"   
[13,] "immigrant.ly"            "prop"   
[14,] "immigrant.sterilized.ly" "prop"   
```

Ahora estamos listos para obtener nuestras primeras estimativas.


```r
> (estimates <- SummarySurvey(design = design,
+                             variables = variables,
+                             rnd = 3))
```

```
                                  Estimate       SE     2.5 %
Total.dogs                       89854.007 3469.878 83053.171
Prop.sex.Female                      0.440    0.034     0.374
Prop.sex.Male                        0.560    0.034     0.494
Mean.age                             5.717    0.320     5.089
Prop.sterilized.no                   0.754    0.024     0.706
Prop.sterilized.yes                  0.246    0.024     0.199
Prop.sterilized.ly.no                0.918    0.015     0.889
Prop.sterilized.ly.yes               0.082    0.015     0.052
Total.births                      7724.362 2998.858  1846.709
Prop.present.no                      0.130    0.020     0.092
Prop.present.yes                     0.870    0.020     0.831
Prop.fate.deied                      0.050    0.012     0.026
Prop.fate.given                      0.034    0.011     0.012
Prop.fate.in_home                    0.870    0.020     0.831
Prop.fate.lost                       0.025    0.008     0.009
Prop.fate.sold                       0.021    0.008     0.006
Prop.acquired.adopted                0.104    0.015     0.075
Prop.acquired.born_in_home           0.114    0.016     0.083
Prop.acquired.bought                 0.230    0.023     0.185
Prop.acquired.gift                   0.552    0.027     0.499
Prop.outside.no                      0.915    0.018     0.879
Prop.outside.yes                     0.085    0.018     0.049
Prop.acquired.ly.no                  0.585    0.026     0.535
Prop.acquired.ly.yes                 0.415    0.026     0.365
Prop.immigrant.no                    0.709    0.026     0.658
Prop.immigrant.yes                   0.291    0.026     0.241
Prop.immigrant.ly.no                 0.853    0.019     0.814
Prop.immigrant.ly.yes                0.147    0.019     0.109
Prop.immigrant.sterilized.ly.no      0.890    0.074     0.744
Prop.immigrant.sterilized.ly.yes     0.110    0.074    -0.035
                                    97.5 %  Deff Error (%)
Total.dogs                       96654.842 1.149     7.569
Prop.sex.Female                      0.506 1.350    14.973
Prop.sex.Male                        0.626 1.350    11.780
Mean.age                             6.344 1.475    10.978
Prop.sterilized.no                   0.801 0.923     6.277
Prop.sterilized.yes                  0.294 0.923    19.212
Prop.sterilized.ly.no                0.948 0.900     3.234
Prop.sterilized.ly.yes               0.111 0.900    36.374
Total.births                     13602.016 0.877    76.094
Prop.present.no                      0.169 1.012    29.707
Prop.present.yes                     0.908 1.012     4.450
Prop.fate.deied                      0.074 0.919    47.797
Prop.fate.given                      0.056 1.147    65.511
Prop.fate.in_home                    0.908 1.012     4.450
Prop.fate.lost                       0.042 0.856    65.651
Prop.fate.sold                       0.036 0.816    69.996
Prop.acquired.adopted                0.133 0.683    27.751
Prop.acquired.born_in_home           0.145 0.709    26.820
Prop.acquired.bought                 0.274 0.862    19.436
Prop.acquired.gift                   0.606 0.896     9.740
Prop.outside.no                      0.951 1.264     3.928
Prop.outside.yes                     0.121 1.264    42.064
Prop.acquired.ly.no                  0.635 0.794     8.582
Prop.acquired.ly.yes                 0.465 0.794    12.091
Prop.immigrant.no                    0.759 0.943     7.116
Prop.immigrant.yes                   0.342 0.943    17.325
Prop.immigrant.ly.no                 0.891 0.733     4.469
Prop.immigrant.ly.yes                0.186 0.733    25.846
Prop.immigrant.sterilized.ly.no      1.035 1.974    16.354
Prop.immigrant.sterilized.ly.yes     0.256 1.974   132.061
```

El resultado anterior es bastante útil pero puede no ser suficiente. Hagamos una copia (`sample1`) de un subconjunto de `survey.data`, para estimar el total de animales esterilizados (en lugar de la proporción) y para obtener estimativas condicionadas por el sexo.


```r
> sample1 <-
+     survey.data[, c('interview_id', 'psu',
+                     'dogs', 'sex', 'sterilized',
+                     'sterilized.ly', 'fate')]
> sample1[, 'sterilized'] <-
+     as.character(sample1[, 'sterilized'])
> sample1[which(sample1$sterilized == 'yes'),
+         'sterilized'] <- 1
> sample1[which(sample1[, 'sterilized'] == 'no'),
+         'sterilized'] <- 0
> sample1[, 'sterilized'] <-
+     as.numeric(sample1[, 'sterilized'])
```

Despúes de definir el diseño muestral de la forma usual


```r
> design.sex <- DesignSurvey(sample = sample1,
+                            psu.ssu = psu.ssu,
+                            psu.col = 2,
+                            ssu.col = 1,
+                            psu.2cd = 20)
```

podemos crear un diseño para cada sexo.


```r
> design.f <- subset(design.sex, sex == 'Female')
> design.m <- subset(design.sex, sex == 'Male')
```

A partir de aquí no hay nada nuevo.


```r
> # Comillas cerradas exculyen una variable
> # del processo de estimación.
> names(design.sex$variables)
```

```
[1] "dogs"          "sex"           "sterilized"   
[4] "sterilized.ly" "fate"         
```

```r
> variables.sex <- c('total', '', 'total', 
+                    'prop', 'prop')
> cbind(names(design.sex$variables),
+       variables.sex)
```

```
                     variables.sex
[1,] "dogs"          "total"      
[2,] "sex"           ""           
[3,] "sterilized"    "total"      
[4,] "sterilized.ly" "prop"       
[5,] "fate"          "prop"       
```

```r
> (estimates.f <- SummarySurvey(design.f,
+                               variables.sex,
+                               rnd = 3))
```

```
                        Estimate       SE     2.5 %    97.5 %
Total.dogs             39564.936 3796.867 32123.214 47006.658
Total.sterilized       12782.673 1498.520  9845.628 15719.718
Prop.sterilized.ly.no      0.870    0.029     0.813     0.926
Prop.sterilized.ly.yes     0.130    0.029     0.074     0.187
Prop.fate.deied            0.046    0.015     0.016     0.075
Prop.fate.given            0.030    0.014     0.003     0.057
Prop.fate.in_home          0.885    0.023     0.840     0.931
Prop.fate.lost             0.008    0.008    -0.007     0.023
Prop.fate.sold             0.031    0.015     0.002     0.061
                        Deff Error (%)
Total.dogs               Inf    18.809
Total.sterilized       0.849    22.977
Prop.sterilized.ly.no  0.951     6.502
Prop.sterilized.ly.yes 0.951    43.405
Prop.fate.deied        0.683    65.209
Prop.fate.given        0.859    91.229
Prop.fate.in_home      0.681     5.113
Prop.fate.lost         0.980   190.573
Prop.fate.sold         0.953    93.435
```

```r
> (estimates.m <- SummarySurvey(design.m,
+                               variables.sex,
+                               rnd = 3))
```

```
                        Estimate       SE     2.5 %    97.5 %
Total.dogs             50289.071 3026.661 44356.925 56221.216
Total.sterilized        9345.857 1693.130  6027.383 12664.330
Prop.sterilized.ly.no      0.957    0.017     0.924     0.989
Prop.sterilized.ly.yes     0.043    0.017     0.011     0.076
Prop.fate.deied            0.053    0.014     0.026     0.080
Prop.fate.given            0.037    0.016     0.006     0.067
Prop.fate.in_home          0.857    0.027     0.805     0.910
Prop.fate.lost             0.039    0.015     0.010     0.068
Prop.fate.sold             0.013    0.009    -0.005     0.031
                        Deff Error (%)
Total.dogs               Inf    11.796
Total.sterilized       1.225    35.508
Prop.sterilized.ly.no  1.074     3.383
Prop.sterilized.ly.yes 1.074    74.580
Prop.fate.deied        0.613    50.532
Prop.fate.given        1.115    82.643
Prop.fate.in_home      0.966     6.145
Prop.fate.lost         0.963    74.725
Prop.fate.sold         1.041   134.273
```


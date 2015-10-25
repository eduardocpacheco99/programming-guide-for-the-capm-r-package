



Having defined the final sample, suppose we went to visit all the selected households and the collected data were recorded in a file called `survey.data.csv` (the help page for `survey.data` describes the variables).


```r
> survey.data <- read.csv('survey.data.csv')
> head(survey.data)
```

```
  interview_id        psu dogs    sex age sterilized sterilized.ly births
1            1 3.5485e+14    1   Male   9        yes           yes      0
2            1 3.5485e+14    1 Female   1         no            no      0
3            2 3.5485e+14    1 Female   7        yes            no      0
4            3 3.5485e+14    1   Male  11         no            no      0
5            4 3.5485e+14    1 Female  13         no            no      0
6            5 3.5485e+14    1 Female   3         no            no      0
  present    fate     acquired outside acquired.ly immigrant immigrant.ly
1     yes in_home       bought      no          no       yes         <NA>
2     yes in_home       bought      no         yes       yes          yes
3     yes in_home       bought      no         yes       yes          yes
4     yes in_home born_in_home      no          no        no           no
5     yes in_home         gift     yes          no       yes         <NA>
6     yes in_home      adopted      no         yes        no           no
  immigrant.sterilized.ly
1                    <NA>
2                      no
3                      no
4                    <NA>
5                    <NA>
6                    <NA>
```

To estimate the population parameters, the first step is to define the sampling design from which the data came from. To do this, we need a file containing all the sampling units in the population (`psu.ssu`) and a file with the sampling data (`survey.data`). This last file must have a column with the PSU's, another with the SSU's and another with the number of PSU's included in the sample (if a PSU was selected more than once, each occurrence must be counted).


```r
> design <- DesignSurvey(sample = survey.data,
+                        psu.ssu = psu.ssu,
+                        psu.col = 2,
+                        ssu.col = 1,
+                        psu.2cd = 20)
```

Setting the type of estimate for each variable is easy.


```r
> variables <- c('total', 'prop', 'mean', 'prop',
+                'prop', 'total', rep('prop', 8))
```

It is convenient to confirm that we have defined the type of estimates we want.


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

Now we are ready to get our first estimates.


```r
> (estimates <- SummarySurvey(design = design,
+                             variables = variables,
+                             rnd = 3))
```

```
                                  Estimate       SE     2.5 %    97.5 %
Total.dogs                       89854.007 3469.878 83053.171 96654.842
Prop.sex.Female                      0.440    0.034     0.374     0.506
Prop.sex.Male                        0.560    0.034     0.494     0.626
Mean.age                             5.717    0.320     5.089     6.344
Prop.sterilized.no                   0.754    0.024     0.706     0.801
Prop.sterilized.yes                  0.246    0.024     0.199     0.294
Prop.sterilized.ly.no                0.918    0.015     0.889     0.948
Prop.sterilized.ly.yes               0.082    0.015     0.052     0.111
Total.births                      7724.362 2998.858  1846.709 13602.016
Prop.present.no                      0.130    0.020     0.092     0.169
Prop.present.yes                     0.870    0.020     0.831     0.908
Prop.fate.deied                      0.050    0.012     0.026     0.074
Prop.fate.given                      0.034    0.011     0.012     0.056
Prop.fate.in_home                    0.870    0.020     0.831     0.908
Prop.fate.lost                       0.025    0.008     0.009     0.042
Prop.fate.sold                       0.021    0.008     0.006     0.036
Prop.acquired.adopted                0.104    0.015     0.075     0.133
Prop.acquired.born_in_home           0.114    0.016     0.083     0.145
Prop.acquired.bought                 0.230    0.023     0.185     0.274
Prop.acquired.gift                   0.552    0.027     0.499     0.606
Prop.outside.no                      0.915    0.018     0.879     0.951
Prop.outside.yes                     0.085    0.018     0.049     0.121
Prop.acquired.ly.no                  0.585    0.026     0.535     0.635
Prop.acquired.ly.yes                 0.415    0.026     0.365     0.465
Prop.immigrant.no                    0.709    0.026     0.658     0.759
Prop.immigrant.yes                   0.291    0.026     0.241     0.342
Prop.immigrant.ly.no                 0.853    0.019     0.814     0.891
Prop.immigrant.ly.yes                0.147    0.019     0.109     0.186
Prop.immigrant.sterilized.ly.no      0.890    0.074     0.744     1.035
Prop.immigrant.sterilized.ly.yes     0.110    0.074    -0.035     0.256
                                  Deff Error (%)
Total.dogs                       1.149     7.569
Prop.sex.Female                  1.350    14.973
Prop.sex.Male                    1.350    11.780
Mean.age                         1.475    10.978
Prop.sterilized.no               0.923     6.277
Prop.sterilized.yes              0.923    19.212
Prop.sterilized.ly.no            0.900     3.234
Prop.sterilized.ly.yes           0.900    36.374
Total.births                     0.877    76.094
Prop.present.no                  1.012    29.707
Prop.present.yes                 1.012     4.450
Prop.fate.deied                  0.919    47.797
Prop.fate.given                  1.147    65.511
Prop.fate.in_home                1.012     4.450
Prop.fate.lost                   0.856    65.651
Prop.fate.sold                   0.816    69.996
Prop.acquired.adopted            0.683    27.751
Prop.acquired.born_in_home       0.709    26.820
Prop.acquired.bought             0.862    19.436
Prop.acquired.gift               0.896     9.740
Prop.outside.no                  1.264     3.928
Prop.outside.yes                 1.264    42.064
Prop.acquired.ly.no              0.794     8.582
Prop.acquired.ly.yes             0.794    12.091
Prop.immigrant.no                0.943     7.116
Prop.immigrant.yes               0.943    17.325
Prop.immigrant.ly.no             0.733     4.469
Prop.immigrant.ly.yes            0.733    25.846
Prop.immigrant.sterilized.ly.no  1.974    16.354
Prop.immigrant.sterilized.ly.yes 1.974   132.061
```

The previous output is very useful but might not be enough. Let's make a copy (`sample1`) of a subset of `survey.data`, to estimate the total number of sterilized animals (instead of the proportion) and to get estimates conditioned on sex.


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

After defining a sampling design in the usual way


```r
> design.sex <- DesignSurvey(sample = sample1,
+                            psu.ssu = psu.ssu,
+                            psu.col = 2,
+                            ssu.col = 1,
+                            psu.2cd = 20)
```

we can create a design for each sex.


```r
> design.f <- subset(design.sex, sex == 'Female')
> design.m <- subset(design.sex, sex == 'Male')
```

From here, there is nothing new.


```r
> # Empty quotes exclude a variable
> # from the estimation procedure.
> names(design.sex$variables)
```

```
[1] "dogs"          "sex"           "sterilized"    "sterilized.ly"
[5] "fate"         
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
                        Estimate       SE     2.5 %    97.5 %  Deff
Total.dogs             39564.936 3796.867 32123.214 47006.658   Inf
Total.sterilized       12782.673 1498.520  9845.628 15719.718 0.849
Prop.sterilized.ly.no      0.870    0.029     0.813     0.926 0.951
Prop.sterilized.ly.yes     0.130    0.029     0.074     0.187 0.951
Prop.fate.deied            0.046    0.015     0.016     0.075 0.683
Prop.fate.given            0.030    0.014     0.003     0.057 0.859
Prop.fate.in_home          0.885    0.023     0.840     0.931 0.681
Prop.fate.lost             0.008    0.008    -0.007     0.023 0.980
Prop.fate.sold             0.031    0.015     0.002     0.061 0.953
                       Error (%)
Total.dogs                18.809
Total.sterilized          22.977
Prop.sterilized.ly.no      6.502
Prop.sterilized.ly.yes    43.405
Prop.fate.deied           65.209
Prop.fate.given           91.229
Prop.fate.in_home          5.113
Prop.fate.lost           190.573
Prop.fate.sold            93.435
```

```r
> (estimates.m <- SummarySurvey(design.m,
+                               variables.sex,
+                               rnd = 3))
```

```
                        Estimate       SE     2.5 %    97.5 %  Deff
Total.dogs             50289.071 3026.661 44356.925 56221.216   Inf
Total.sterilized        9345.857 1693.130  6027.383 12664.330 1.225
Prop.sterilized.ly.no      0.957    0.017     0.924     0.989 1.074
Prop.sterilized.ly.yes     0.043    0.017     0.011     0.076 1.074
Prop.fate.deied            0.053    0.014     0.026     0.080 0.613
Prop.fate.given            0.037    0.016     0.006     0.067 1.115
Prop.fate.in_home          0.857    0.027     0.805     0.910 0.966
Prop.fate.lost             0.039    0.015     0.010     0.068 0.963
Prop.fate.sold             0.013    0.009    -0.005     0.031 1.041
                       Error (%)
Total.dogs                11.796
Total.sterilized          35.508
Prop.sterilized.ly.no      3.383
Prop.sterilized.ly.yes    74.580
Prop.fate.deied           50.532
Prop.fate.given           82.643
Prop.fate.in_home          6.145
Prop.fate.lost            74.725
Prop.fate.sold           134.273
```


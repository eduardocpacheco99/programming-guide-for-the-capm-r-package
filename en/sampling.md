



Continuing with the two-stage cluster design, there are two sources of data that we need to calculate the sample size and composition. The first is the `psu.ssu` file we have imported in the first section. The second contains the data we have hypothetically collected in the pilot sample we designed above. The `pilot.csv` file contains as many rows as households visited in the pilot. The first column contains identifiers for the PSU to which the respective household belongs to. The second column contains the number of dogs observed in the households. Having these files, we just need to define the level of confidence we want, the error we are ready to accept and an estimate of cost. The last is the ratio between the cost associated with visiting a PSU and the cost associated with making an interview. 


```
                                               Value
Sample size                             3.000000e+02
Number of PSU to be sampled             2.000000e+01
Number of SSU to be sampled in each psu 1.500000e+01
Intercluster variance                   1.878684e+04
Intracluster variance                   9.066137e-01
Intraclass correlation coefficient      2.945012e-01
```

Once defined the size and composition for the final sample, selecting sampling units is a matter of repeating what we did in the first two sections, using the output from above (20 PSU's and 15 SSU's per PSU). Note that 2.000000e+01 = 20 and 1.500000e+01 = 15.


```r
> final.psu <- SamplePPS(psu.ssu, 20, write = F)
> final.ssu <- SampleSystematic(final.psu, 15,
+                               write = F)
> MapkmlPSU(shape = 'santos',
+           psu = final.psu[, 1], id = 1)
```




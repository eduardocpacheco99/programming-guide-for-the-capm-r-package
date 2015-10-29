setwd('~/Documents/projects/programming-guide-for-the-capm-r-package/rmds/')
library(knitr)
library(markdown)
rm(list = ls())

## Selecting sampling units
knit('selecting.Rmd')

## Mapping sampling units
knit('mapping.Rmd')

## Calculating sample size
knit('sampling.Rmd')

## Estimating demographic characteristics
knit('estimating.Rmd')

## Building population pyramids
knit('pyramids.Rmd')

## Assessing intervention effects
knit('assessing.Rmd')

## Prioritizing interventions
knit('prioritizing.Rmd')

setwd('~/Documents/projects/programming-guide-for-the-capm-r-package')
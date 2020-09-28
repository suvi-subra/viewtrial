# **About viewTRiAL**

The viewTRiAL package is a R Shiny web application prototype designed to build and deploy Centralized Monitoring 
R shiny web applications in clinical studies within the Department of Clinical Research at University of Basel. 

# **Install viewTRiAL**

## Installing from CTU's repository 

```r

setwd("~repos/proj/piCentralizedMonitoring/R")
system("R CMD INSTALL viewTRiAL")

```

## Installing from GitHub

```r

library(devtools)
devtools::install_github("suvi-subra/viewTRiAL")

```

## Running viewTRiAL

```r

library(viewTRiAL)
run_app()

```

# **About viewTRiAL**

The viewTRiAL package is a R Shiny (package {shiny} version 1.5.0) web application prototype (https://dkfbasel.shinyapps.io/testApp/) designed to build and deploy Centralized Monitoring 
R shiny web applications in clinical studies within the Department of Clinical Research at University of Basel. 

# **Install viewTRiAL**

## Installing from CTU's repository 

```r

setwd("~repos/proj/piCentralizedMonitoring/R")
system("R CMD INSTALL viewTRiAL")

```

## Installing from GitHub

```r

devtools::install_github("suvi-subra/viewTRiAL")

```

## Running viewTRiAL

```r

library(viewTRiAL)
run_app()

```

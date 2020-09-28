# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
usethis::use_package("dplyr")
usethis::use_package("shinydashboard")
usethis::use_package("ggplot2")
usethis::use_package("lubridate")
usethis::use_package("stringr")
usethis::use_package("magrittr")
usethis::use_package("plotly")
usethis::use_package("secuTrialR")

## Add modules ----
## Create a module infrastructure in R/
golem::add_module( name = "overview") # Name of the module
golem::add_module( name = "recruit") # Name of the module
golem::add_module( name = "consent") # Name of the module

## Create R files for other functions
## For list of module names
usethis::use_r("get_modules")
usethis::use_r("plot_recruitment")

## Add helper functions ----
## Creates ftc_* and utils_*
# golem::add_fct( "helpers" ) 
# golem::add_utils( "helpers" )

## External resources
## Creates .js and .css files at inst/app/www
# golem::add_js_file( "script" )
# golem::add_js_handler( "handlers" )
# golem::add_css_file( "custom" )

## Add internal datasets ----
## If you have data in your package
# usethis::use_data_raw( name = "create_data", open = FALSE ) 

## Tests ----
## Add one line by test you want to create
# usethis::use_test( "app" )

# Documentation

## Vignette ----
usethis::use_vignette("viewTRiAL")
rmarkdown::render("vignettes/viewTRiAL.Rmd", output_format=c("pdf_document"))
# devtools::build_vignettes()

## Code coverage ----
## (You'll need GitHub there)
# usethis::use_github()
# usethis::use_travis()
# usethis::use_appveyor()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")


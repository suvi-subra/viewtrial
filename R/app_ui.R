#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import lubridate
#' @import secuTrialR
#' @noRd
app_ui <- function(request) {

  
  ## Source to create dummy dataset
  #source("../create_dummy_data.R")
  
  ## Get module label names
  mod <- get_modules()
  
    # Leave this function for adding external resources
    golem_add_external_resources()
    # List the first level UI elements here 
    fluidPage(
      dashboardPage(skin = "purple",
                    ## Header
                    dashboardHeader(title = "Study name", titleWidth = 300),
                    
                    ## Sidebar
                    dashboardSidebar(width = 300,
                                     sidebarMenu(
                                       menuItem("Overview", tabName = mod$overview, icon = icon("chart-pie")),
                                       ## Expected 3-month visit date (EVD) = Randomization date + 90 days
                                       menuItem("Performance measures", icon = icon("chart-pie"),
                                                ## 1st SIDEBAR TAB: Recruitment and retention
                                                menuSubItem("Recruitment and Retention", tabName = mod$recruitment),
                                                ## 2nd SIDEBAR TAB: Informed consent and eligibility
                                                menuSubItem("Informed consent and Eligibility", tabName = mod$consent),
                                                ## 3rd SIDEBAR TAB: Data quality
                                                menuSubItem("Data Quality", tabName = mod$quality)),
                                       
                                       menuItem("Study Management", icon = icon("chart-pie"),
                                                ## 1st SIDEBAR TAB: Visits
                                                menuSubItem("Visits", tabName = mod$visits),
                                                ## 2nd SIDEBAR TAB: Biosampling
                                                menuSubItem("Biosampling/Imaging data", tabName = mod$lab),
                                                ## 3rd SIDEBAR TAB: Safety
                                                menuSubItem("Safety management", tabName = mod$safety),
                                                ## 4th SIDEBAR TAB: Staff management
                                                menuSubItem("Staff management", tabName = mod$staff)),
                                       
                                       ## Date range filter
                                       dateRangeInput("period", "Randomization date:",
                                                      start = as.POSIXct("2019-06-01"),
                                                      end   = as.POSIXct(today())),
                                       ## Center filter
                                       selectInput("center", "Center", choices = c("All", sort(levels(dummy_baseline$centre))), selected = "All"),
                                       width = "350")),
                    
                    ## Body
                    dashboardBody(
                      
                      tabItems(
                        ## Overview tab
                        mod_overview_ui(mod$overview, label = mod$overview),
                        mod_recruit_ui(mod$recruitment, label = mod$recruitment),
                        mod_consent_ui(mod$consent, label = mod$consent)
                      )
                    ) ## dashboardBody
      ) ## dashboardPage
    )

}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'testApp'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}


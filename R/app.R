#' Main shiny UI function for viewEstrelle
#'
#'Controls the general appearance, header, sidebar, body, tabs with modules, etc.
#'
#' @return shiny.tag list object containing the dashboard page
#' @seealso \code{\link{app_srv}}, \code{\link{run_app}}
#' @import lubridate
#' @import shiny
#' @import shinydashboard
#' @export

app_ui <- function(){

mod <- get_modules()
data <- get_data()

#shinyUI(
  fluidPage( ## To scale components in realtime to fill all available browser width
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
                  selectInput("center", "Center", choices = c("All", sort(levels(data$baseline$centre))), selected = "All"),
                  width = "350")),

              ## Body
              dashboardBody(

                tabItems(
                  ## Overview tab
                  mod_overview_UI(mod$overview, label = mod$overview),
                  mod_consent_UI(mod$consent, label = mod$consent)
                )
              ) ## dashboardBody
      ) ## dashboardPage
   )## fluidPage
#)## shinyUI

}

#' Main Shiny server function for secuTrialRshiny
#'
#' Calls all modules required by app_ui, and passes on relevant data.
#'
#' @param input session's input object
#' @param output session's output object
#' @seealso \code{\link{app_ui}}, \code{\link{run_shiny}}
#' @import shiny
#' @export
#'
app_srv <- function(input, output) {

  ## Get all module names
  mod <- get_modules()
  data <- get_data()


    bl_period <- reactive(

      if(input$center != "All"){
        filter(data$baseline, centre == input$center & date_random.date >= input$period[1] & date_random.date <= input$period[2])

      } else{
        filter(data$baseline, date_random.date >= input$period[1] & date_random.date <= input$period[2])
      })

  ## Call modules for tabs

  ## Overview tab
  callModule(mod_overview_srv, mod$overview, data1 = bl_period)
  callModule(mod_consent_srv, mod$consent, data1 = bl_period)

}

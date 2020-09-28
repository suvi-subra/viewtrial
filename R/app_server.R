  #' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  ## Get module label names
  mod <- get_modules()
  
  ## Create reactive dataframes
  bl_period <- reactive(
    
    if(input$center != "All"){
      filter(dummy_baseline, centre == input$center & date_random.date >= input$period[1] & date_random.date <= input$period[2])
      
    } else{
      filter(dummy_baseline, date_random.date >= input$period[1] & date_random.date <= input$period[2])
    })
  
  # List the first level callModules here
  ## Overview tab
  callModule(mod_overview_server, mod$overview, baseline.data = bl_period)
  ## TODO: Edit argument for recruitment data
  callModule(mod_recruit_server, mod$recruitment, baseline.data = bl_period)
  callModule(mod_consent_server, mod$consent, baseline.data = bl_period)
  
}

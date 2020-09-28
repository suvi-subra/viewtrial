#' consent UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_consent_ui <- function(id, label){
  ns <- NS(id)

    tabItem(tabName = label,
            
            fluidRow(
              valueBoxOutput(ns("consent"), width = 12)
            ),
            
            dataTableOutput(ns("consenttable"))
    )
  
}
    
#' consent Server Function
#'
#' @noRd 
mod_consent_server <- function(input, output, session, baseline){
  ns <- session$ns
  
  output$consent <- renderValueBox({
    no <- baseline() %>% nrow()
    valueBox(value = no, subtitle = "informed consent(s) have been obtained", color = "red")
  })
  
  
  output$consenttable <- renderDataTable({
    
    df <- baseline() %>%
      arrange(pat_id) %>%
      select( "Patient ID" = pat_id, "Center" = centre, "Date of consent" = date_consent.date)
    
  }, escape = FALSE)
 
}
    
## To be copied in the UI
# mod_consent_ui("consent_ui_1")
    
## To be copied in the server
# callModule(mod_consent_server, "consent_ui_1")
 

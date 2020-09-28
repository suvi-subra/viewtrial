#' recruit UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_recruit_ui <- function(id, label){
  ns <- NS(id)
    tabItem(tabName = label,
            fluidRow(
              ## Expected sample size
              valueBoxOutput(ns("expected"), width = 6),
              valueBoxOutput(ns("actual"), width = 6)
            )
    )

}
    
#' recruit Server Function
#'
#' @noRd 
mod_recruit_server <- function(input, output, session, baseline.data){
  ns <- session$ns
  
  output$expected <- renderValueBox({
    ## TODO: Enter expected sample size
    valueBox(value = 250, subtitle = "Expected sample size", color = "blue")
  })
  
  output$actual <- renderValueBox({
    ## TODO: Enter expected sample size
    no <- baseline.data() %>% nrow()
    ## TODO: Determine percentage
    percent <- round(no/250*100, digits = 1)
    valueBox(value = paste0(no, " (", percent, "%)"), subtitle = "Recruited", color = "green")
  })
 
}
    
## To be copied in the UI
# mod_recruit_ui("recruit_ui_1")
    
## To be copied in the server
# callModule(mod_recruit_server, "recruit_ui_1")
 

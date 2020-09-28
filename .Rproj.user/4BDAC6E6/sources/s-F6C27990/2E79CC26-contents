#' overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_overview_ui <- function(id, label){
  ns <- NS(id)
  
    tabItem(tabName = label,
            fluidRow(
              ## No.of participants randomized
              valueBoxOutput(ns("randomized"), width = 12)
            ),
            
            fluidRow(
              valueBoxOutput(ns("active"), width = 6),
              valueBoxOutput(ns("withdrew"), width = 6)
            ),
            
            fluidRow(
              ## Plot displaying no.of participants randomized across acute centers
              box(
                width = 6,
                height = "600",
                title = "Recruitment by centers",
                status = "primary",
                plotlyOutput(ns('recruitplot'), height = "500"),
                solidHeader = TRUE,
                collapsible = FALSE),
              
            )
    )

}
    
#' overview Server Function
#'
#' @noRd 
mod_overview_server <- function(input, output, session, baseline.data){
  ns <- session$ns
 
  output$randomized <- renderValueBox({
    valueBox(value = nrow(baseline.data()), subtitle = "Randomized", color = "green")
  })
  
  output$withdrew <- renderValueBox({
    
    ## Fill in the value of withdrawn
    no <- baseline.data() %>% filter(withdrawn == TRUE) %>% nrow()
    valueBox(value = no, subtitle = "Withdrawn", color = "red")
  })
  
  output$active <- renderValueBox({
    no <- baseline.data() %>% filter(withdrawn == FALSE) %>% nrow()
    valueBox(value = no, subtitle = "Currently active", color = "blue")
  })
  
  output$recruitplot <- renderPlotly({
    
    ## Enrolment plot data ------------------------------------------------------------------------------------------------------------------- ##
    plot_recruitment(baseline.data(), "date_random.date", "centre")
    
    
  })
}
    
## To be copied in the UI
# mod_overview_ui("overview_ui_1")
    
## To be copied in the server
# callModule(mod_overview_server, "overview_ui_1")
 

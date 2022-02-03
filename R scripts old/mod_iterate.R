#' mod_iterate UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_mod_iterate_ui <- function(id){
  ns <- NS(id)
  tagList(
      shinyjs::useShinyjs(),
      shinyjs::disabled(
        actionButton(ns("img_previous"), label = NULL, icon = icon("chevron-left"))
      ),
      actionButton(ns("img_next"), label = NULL, icon = icon("chevron-right"))
      )
}


    
#' mod_iterate Server Functions
#'
#' @noRd 
mod_mod_iterate_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_mod_iterate_ui("mod_iterate_ui_1")
    
## To be copied in the server
# mod_mod_iterate_server("mod_iterate_ui_1")

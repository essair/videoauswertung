#' buttons UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_buttons_ui <- function(id){
  ns <- NS(id)
  tagList(
    column(12,
           h2("Information!", style="color: #fff0;"),
           radioButtons(ns("bat_yes_no"), "Fledermaus?", choices=c("Ja", "Nein"), selected="Ja"),
           radioButtons(ns("crossing"), "Straßenquerung?", choices=c("Ja", "Nein")),
           radioButtons(ns("safe_flight"), "Sicherer Flug?", choices=c("Ja", "Nein", "NA"), selected="NA"),
           selectInput(ns("species_group"), "Art / Artengruppe", 
                       choices=c("Ppip", "Ppyg", "Pnat/Pkuh", "Pipistrelloid", "Myotis", "Plecotus", "Nnyc", "Nlei", "unbestimmt"),
                       selected="unbestimmt"),
           textAreaInput(ns("notes"), "Bemerkungen", height="200px"))
    
 
  )
}
    
#' buttons Server Functions
#'
#' @noRd 
mod_buttons_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_buttons_ui("buttons_ui_1")
    
## To be copied in the server
# mod_buttons_server("buttons_ui_1")

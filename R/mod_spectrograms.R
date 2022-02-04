#' spectrograms UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_spectrograms_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
    column(12,
           fluidRow(plotOutput(ns("plot1"))),
           fluidRow(plotOutput(ns("plot2"))))##need to make these smaller
    )
               
  )
}
    
#' spectrograms Server Functions
#'
#' @noRd 
mod_spectrograms_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$plot1 <- renderPlot({
      
      spec1 <- av::read_audio_fft(
        "/home/sarah/git/videoauswertung/data/AM4_20211008_181000_1.wav",
       # window = hanning(1024),
        overlap = 0.75,
        sample_rate = NULL,
        start_time = 14,
        end_time = 19)
      
      plot(spec1, dark=FALSE)
    }, height=300)
 
    output$plot2 <- renderPlot({
      
      spec2 <- av::read_audio_fft(
        "/home/sarah/git/videoauswertung/data/AM4_20211008_181000_1.wav",
        # window = hanning(1024),
        overlap = 0.75,
        sample_rate = NULL,
        start_time = 14,
        end_time = 19)
      
      plot(spec2, dark=FALSE)
      
    }, height=300)
    
  })
}
    
## To be copied in the UI
# mod_spectrograms_ui("spectrograms_ui_1")
    
## To be copied in the server
# mod_spectrograms_server("spectrograms_ui_1")

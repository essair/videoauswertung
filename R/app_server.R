#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic
  #mod_camera_images_server("camera_images_ui_1")
  mod_app_images_server("app_images_ui_1")
  mod_spectrograms_server("spectrograms_ui_1")

  
}

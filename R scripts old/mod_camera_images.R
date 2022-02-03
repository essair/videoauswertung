#' camera_images UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
    

###second attempt## ## ## ## ## ## ## ## 
mod_camera_images_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(4, EBImage::displayOutput(ns("img_left"), height = "700px")),
      column(4, EBImage::displayOutput(ns("img_middle"), height = "700px")),
      column(4, EBImage::displayOutput(ns("img_right"), height = "700px"))
    )
  )
}



mod_camera_images_server <- function(input, output, session) { #current row
  moduleServer( id, function(input, output, session){
  ns <- session$ns
  output$img_left <- EBImage::renderDisplay({
    f <- EBImage::readImage("inst/app/www/Zwerg_fledermaus.png")
    # golem::print_dev("module display")
    #f <- EBImage::readImage(current_row$df$file_dest_left)
    EBImage::display(f)
  })
  
  output$img_middle <- EBImage::renderDisplay({
     f <- EBImage::readImage("inst/app/www/Zwerg_weitere_Flugbahn.png")
    #f <- EBImage::readImage(current_row$df$file_dest_middle)
    EBImage::display(f)
  })
  
  output$img_right <- EBImage::renderDisplay({
    f <- EBImage::readImage("inst/app/www/Zwerg_weitere_Flugbahn.png")
    #f <- EBImage::readImage(current_row$df$file_dest_right)
    EBImage::display(f)
  })
})

}

## To be copied in the UI
# mod_display_pictures_ui("display_pictures_ui_1")

#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_input_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    splitLayout(
      shiny::fileInput(ns("input_pic_paths"),
                       multiple = FALSE,
                       accept = c(".csv", ".rds"),
                       label = "Datei mit Pfaden zu Bildern"),
      cellArgs = list(style = "padding: 6px")
    )
  )
}
 

    
#' name_of_module1 Server Functions
#'
#' @noRd 
mod_input_data_server <- function(input, output, session){
    ns <- session$ns
    
input_data <- reactiveValues(data = NULL)
    
    observe({
      req(input$input_pic_paths)
      file_path_dats <- input$input_pic_paths$datapath
      ext_dats <- tools::file_ext(file_path_dats)
      validate(need(ext_dats %in% c("csv", "Rds", "RDS"), "Bitte .csv oder .Rds hochladen"))
      if (ext_dats == "csv") {
        df <- readr::read_csv2(file_path_dats)
      } else {
        df <- readRDS(file_path_dats)
      }
      input_data$data <- df
    })
    
    observe({
      req(input$input_eval_saved)
      file_path_eval_saved <-  input$input_eval_saved$datapath
      ext_eval_saved <- tools::file_ext(file_path_eval_saved)
      validate(need(ext_eval_saved %in% c("csv"), "Bitte .csv hochladen"))
      df <- readr::read_csv2(file_path_eval_saved, col_types = "cccTTcccddddddcclccc")
      
      input_data$eval_saved <- df
    })
    
    
    return(input_data)
  }
 
## To be copied in the UI
# mod_input_data_ui("input_data_ui_1")
    
## To be copied in the server
# mod_input_data_server("input_data_ui_1")

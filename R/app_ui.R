#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    fluidPage(
        column(9,
               h1("Datenauswertung"),
               mod_app_images_ui("app_images_ui_1"),
               mod_spectrograms_ui("spectrograms_ui_1")
        ),
        column(3,
               mod_buttons_ui("buttons_ui_1")
        )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'videoauswertung'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}


#' Javascript tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
javascript_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(
        width = 6,
        box("Javascript topics: shinyjs, simple custom functions, advanced custom functions")
      )
    )
  )

}

#' Javascript tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
javascript_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

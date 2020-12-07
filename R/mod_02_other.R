#' Other tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
other_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(
        width = 6,
        box("This tab is about other shiny techniques")
      )
    )
  )

}

#' Other tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
other_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

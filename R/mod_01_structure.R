#' Structure tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
structure_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(
        width = 6,
        box("This tab is about structuring an app as a package")
      )
    )
  )

}

#' Structure tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
structure_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

#' Interface tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
interface_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(
        width = 6,
        box("Interface Topics: CSS styling, modals, alerts, progress notifiers, css loaders")
      )
    )
  )

}

#' Interface tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
interface_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

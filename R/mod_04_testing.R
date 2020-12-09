#' Testing tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
testing_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(
        width = 6,
        box("Testing topics: testthat, shinytest, covr")
      )
    )
  )

}

#' Testing tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
testing_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

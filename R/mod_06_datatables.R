#' DT Datatables tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
datatables_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(
        width = 6,
        box("DT Datatables topics: benefits, customising appearance, javascript callbacks, dynamic manipulation")
      )
    )
  )

}

#' DT Datatables tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
datatables_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

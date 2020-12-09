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
        box("Other topics: profiling, how shiny works, controlling reactivity")
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

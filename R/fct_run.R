#' Run the app
#'
#' @import shiny
#'
#' @export
run_app <- function() {

  runApp(appDir = system.file("demo", package = "cbShinyDemo"))

}

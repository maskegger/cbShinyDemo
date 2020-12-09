#' Run the app
#'
#' @import shiny
#'
#' @export
run_app <- function() {

  runApp(appDir = system.file("demo", package = "cbShinyDemo"))

}


#' Run module demo app
#'
#' @import shiny
#'
#' @export
run_moduleDemo <- function() {

  runApp(appDir = system.file("moduleDemo", package = "cbShinyDemo"))

}

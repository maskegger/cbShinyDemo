#' Show project structure as tree
#'
#' Use the data.tree package to show an example
#' file structure for shiny app package
#'
#' @return data.tree object
#'
#' @import data.tree
#'
#' @export
get_project_tree <- function() {

  proj <- Node$new("appPackage")
  description <- proj$AddChild("DESCRIPTION")
  namespace <- proj$AddChild("NAMESPACE")
  inst <- proj$AddChild("inst/")
  app <- inst$AddChild("app/")
  app_global <- app$AddChild("global.R")
  app_ui <- app$AddChild("ui.R")
  app_server <- app$AddChild("server.R")
  www <- app$AddChild("www/")
  r_folder <- proj$AddChild("R/")
  r_runapp <- r_folder$AddChild("run_app.R")
  r_mod1 <- r_folder$AddChild("mod_01_intro.R")
  r_mod2 <- r_folder$AddChild("mod_02_dashboard.R")
  r_mod2_fct <- r_folder$AddChild("mod_02_dashboard_fct_visuals.R")
  r_utils <- r_folder$AddChild("utils.R")
  man <- proj$AddChild("man/")
  readme <- proj$AddChild("README.md")
  tests <- proj$AddChild("tests/")

  return(proj)
}

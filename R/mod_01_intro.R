#' Intro tab UI
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
intro_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      h2("Demonstrating Intermediate R Shiny",
         class = "page-title"),
      column(
        width = 6,
        box(
          width = NULL,
          h3("Intro"),
          p("This R Shiny app provides two functions, firstly it is a place for me to store information about interesting
            or advanced shiny techniques so I can easily pick them up again in future. Secondly, it can be shared with
            colleagues at the DfE or presented in a Coffee & Coding session to share knowledge of intermediate to advanced
            R shiny methods and packages."),
          p("The app is designed using a shinydashboard layout (see the UI tab for more information). Each tab consists
            of several colour-coded sections regarding different aspects of the overall topic."),
          p("This app is not an exhaustive list of shiny topics and will assume at least a basic knowledge of R and shiny, as
            the primary concern will be slightly more advanced topics."),
          p("Some tabs in the app (i.e. 'Structure' and 'UI') will contain subjective 'best practices' which I follow and have
            found to work for me. It is of course true that these may not be suitable in all situations and may not be to your
            tastes. If that is the case then feel free to ignore them or adapt them as you see fit."),
          p("The code for the app will be available at", a("my github repo.", href = "github.com/chrisbrownlie/cbShinyDemo"), "For
            more information on the code structure see the README for this repo as well as the Structure tab."),
          p("Finally, if any DfE colleagues wish to contribute to this, give feedback or suggest content for improvement, please
            don't hesitate to get in touch."),
          tags$footer("This app was created by ", a("Chris Brownlie", href = "github.com/chrisbrownlie"))
        )
      )
    )
  )

}

#' Intro tab server
#'
#' @import shiny
#' @import shinydashboard
#'
#' @export
intro_server <- function(id) {

  moduleServer(
    id,
    function(input,
             output,
             session) {


    }
  )

}

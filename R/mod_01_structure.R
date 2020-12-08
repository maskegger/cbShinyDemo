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
      h3("Structuring a Shiny app", style = "font-size:40px;text-align:center"),
      column(
        width = 12,
        box(
          width = NULL,
          status = "info",
          h3("Structuring as a package"),
          p("One of the best ways of structuring a complex R Shiny app is as an R Package. There are many reasons for this, most important of which are
            a) you can take full advantage of the testing capabilities of R through packages such as devtools and covr, b) it helps keep business logic
            and app logic separate and c) you can more easily share your app with others (particularly if hosting online via something like RSConnect
            isn't an option)."),
          p("There are many great resources for package development which I won't go into here but I'd recommend checking out these links if you are
            interested to learn more about R package development in general, or why it is a good idea to structure a Shiny app as a package.")
        )
      )
      ),
    fluidRow(
      column(
        width = 3,
        box(
          width = NULL,
          status = "info",
          h4("What it should look like..."),
          p("To the right you can see an example of what the project structure will look like if you structure your project as a package. Note an easy way to
            skip to this setup is to install the usethis package and run usethis::use_package(), or if you are starting a new project you can use RStudio
            to select 'New R Package', which will give you placeholders for all the important files and folders you'll need."),
          p("As mentioned elsewhere, I won't be addressing the idea of package development beyond the basics of what is needed for an R Shiny app so check
            out the links provided for more information."),
          p("The file structure to the right shows how I tend to structure my app packages, but this can be tweaked for personal preference if desired (for example,
            the golem framework recommends storing the app R files in the R/ folder too)."),
          p("The structure to the right can be thought of as the bare minimum needed. There are many other folders and options which can be
            set or included, such as renv files, .gitignore, .Rbuildignore, data folders etc. See Package Development resources for more info.")
        )
      ),
      column(
        width = 3,
        box(
          width = NULL,
          status = "info",
          h4("Example file structure"),
          tags$img(src = "img_structure.png")
        )
      ),
      column(
        width = 6,
        box(
          width = NULL,
          status = "info",
          h4("Explaining the structure elements"),
          p("Addressing each of the elements of the project in turn:"),
          tags$ul(
            tags$li(tags$strong("DESCRIPTION"),
               tags$ul(
                 tags$li("Gives key information about your package, such as the author, version and license."),
                 tags$li("Also describes package dependencies - you'll probably want to put any package you use in
                         the app (e.g. shiny) in the 'Depends' section."),
                 tags$li("Can be generated with usethis::use_description()")
               )
               ),
            tags$li(tags$strong("NAMESPACE"),
                    tags$ul(
                      tags$li("Describes the package dependencies and exports"),
                      tags$li("Generate automatically through the use of roxygen2 comments and devtools::document()")
                    )
                    ),
            tags$li(tags$strong("inst"),
                    tags$ul(
                      tags$li("Folder which makes files within visible to the users project."),
                      tags$li("Used here to store the app R files, in a folder called 'app'")
                    )),
            tags$li(tags$strong("R"),
                    tags$ul(
                      tags$li("The folder containing all your R code (other than the app files)"),
                      tags$li("The (golem) naming conventions used here will be discussed further down the page"),
                      tags$li("Importantly: includes a file (here named run_app.R) which contains a function
                              (here named run_app()) which calls runApp(appDir = system.file('app', package = 'appPackage')).
                              This function takes in the directory containing the shiny app and runs it. This means that
                              anyone who downloads your package can simply call appPackage::run_app() and see your shiny app.")
                    )),
            tags$li(tags$strong("man"),
                    tags$ul(
                      tags$li("Contains function documentation files."),
                      tags$li("Generated automatically through the use of roxygen2 comments and devtools::document()")
                    )),
            tags$li(tags$strong("README"),
                    tags$ul(
                      tags$li("Explains and describes the project and associated app"),
                      tags$li("Can be created with usethis::use_readme_md() or usethis::use_readme_rmd()")
                    )),
            tags$li(tags$strong("tests"),
                    tags$ul(
                      tags$li("Contains function and app testing files"),
                      tags$li("Commonly contains testthat/ and shinytest/ folders and files created by the packages")
                    ))
          )
        )
      )
    ),
    fluidRow(
      column(
        width = 12,
        box(
          width = NULL,
          status = "info",
          h4("Other Notes"),
          p("There are many ways to work using this package structure, given the flexibility that it affords you. Some key points include:"),
          tags$ul(
            tags$li("Remembering to document all functions and generate the documentation with devtools::document()"),
            tags$li("Using testthat and shinytest to create tests, then testing all of these at once with runTests()"),
            tags$li("After making changes to the app, I load the package using devtools::load_all() (or the keyboard shortcut Ctrl+Shift+L)"),
            tags$li("After loading the changes I've made, I can run the app with the run_app() function. For ease, I often include a one-letter
                    alias function. E.g. after the run_app definition I include r <- run_app. This means I can run the app by calling r(), speeding
                    up the process.")
          ),
          p("Note that this structure needs tweaking for use with our Azure DevOps/RSConnect infrastructure:"),
          tags$ul(
            tags$li("RSConnect expects your project root directory to contain either an app.R file or both ui.R and server.R."),
            tags$li("To get around this, you simply need to add an app.R file to your project root directory which returns a shiny.appobj object."),
            tags$li("The easiest way to do this is to add an argument to your run_app() function, whereby the default behaviour is to
                    run your app via runApp(), but an optional flag will force the function to instead return the app object via
                    shinyAppDir()"),
            tags$li("Then in your app.R file, you simply load your package with pkgload::load_all() and then call run_app() - with your
                    option set to return the object rather than run it.")
          )
        )
      )
    ),


    fluidRow(
      column(
        width = 12,
        box(
          width = NULL,
          status = "warning",
          h3("Naming conventions")
        )
      )
    ),


    fluidRow(
      column(
        width = 12,
        box(
          width = NULL,
          status = "success",
          h3("Modules")
        )
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

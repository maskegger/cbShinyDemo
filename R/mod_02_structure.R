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
      h2("Structuring a Shiny app",
         class = "page-title"),
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
          h3("Naming conventions"),
          p("The project structure above uses the naming conventions suggested by thinkR (the creators of the golem package). For more
            information, see the relevant section of their book",
            a("Engineering Shiny.", href = "https://engineering-shiny.org/structure.html#conventions-matter")),
          p("The basic premise is that the app is compartmentalised using the concept of",
            a("shiny modules.", href = "https://shiny.rstudio.com/articles/modules.html"), "See the bottom of this page for an alternative
            explanation of modules."),
          p("In most apps, you will have a selection of pages or tabs. It is good practice to put each of these into their own module. As
            well as the benefits outlined at the bottom of the page, this will give you a larger number of short, manageable scripts, which
            are far easier to debug and to keep track of. This will also help to separate out the logic of the app to avoid unrelated elements
            becoming entangled."),
          p("The aforementioned file naming convention can be described as follows:"),
          tags$ul(
            tags$li("All R files (except ui/server/global) start with one of the following:",
                    tags$ul(
                      tags$li(strong("mod"), "- indicating that they are part of a specific module (either the definition of the module itself
                              or functions that are only used within the module)"),
                      tags$li(strong("fct"), "- meaning they contain important 'business logic' functions that are used either outside of modules
                              or across many modules"),
                      tags$li(strong("utils"), "- meaning they contain helper functions which do not contain any business logic (and can be
                              used anywhere in the app.")
                    )),
            tags$li(strong("For mod files,"), "the 'mod' is followed by a number denoting the order of the module in the app (in terms of the logical
                    progression from page/tab 1 to page/tab n) and this is followed by the name of the module which is usually just the name of the
                    tab/page it represents. If there are modules or functions within a module, the same convention is just repeated, e.g. if the first
                    module of the app is named mod_01_homepage.R and it has a module within it called 'login', the name of the file containing that module
                    should be mod_01_homepage_mod_login.R"),
            tags$li(strong("For fct files,"), "they are followed by a single word or phrase to describe what the functions are used for. As with modules,
                    they can be appended onto an existing module to signify that the functions are only used within that module. E.g. you might have
                    mod_03_importData_fct_sqlConn.R, for a set of functions that help you connect to a SQL database and are used in the third tab of
                    the app (which is called 'import data'). Alternatively if they are used in multiple modules you can either append them to the first
                    module they appear in, or keep them separate (e.g. just 'fct_sqlConn.R')"),
            tags$li(strong("For utils files,"), "these follow the same naming structure as fct files - they are followed by a single word or phrase to describe
                    what the functions achieve, with the key difference being that they don't contain 'business logic' and are just helper functions. For many
                    apps it may be enough to just have a single utils.R file.")
          )
        )
      )
    ),


    fluidRow(
      column(
        width = 12,
        box(
          width = NULL,
          status = "success",
          h3("Modules"),
          p("A module can be thought of as a mini app-function. Using modules you can define a pair of functions, which return a module UI and a module Server
            respectively. When you call the functions, you assign an ID which you pass to both. This ID uniquely identifies a single call of a particular module.
            This is also how the two elements of the module communicate with each other. This is done by using a namespace function ns()."),
          p("The premise of the namespace function is very simple but also extremely effective. Instead of creating an input with an inputId of 'test', for example,
            you would wrap the inputId in ns(). The namespace function then prefixes whatever it is passed with the namespace from which the input is placed - that
            is, the ID of the module from which it is called."),
          p("For example, imagine you have a module in your app, which you call with id 'module1'. Within this module you have a selectInput, where you have set
            the id to ns('selection1'), using the ns() function to ensure the ID is namespaced. What the ns() function does in this case, is return
            'module1-selection1'."),
          p("The beauty of this simple function is that you can now call the same module 100 times, supplying a different module ID each time and you will not have
            any conflicts in names - imagine if instead of one button and text, you had 20, 30 or 100 inputs and outputs. The inputs will automatically be named e.g.
            'module2-selection1', 'module3-selection1'. This is one of the main benefits that modules were introduced for."),
          p("The code below shows a simple app with modules. Although this is a trivial example, hopefully it demonstrates how useful modules can be for situations
            where you have repeated elements in your app that you need to keep separate. This app can be viewed if you have downloaded the cbShinyDemo package, by
            running run_moduleDemo()."),
          verbatimTextOutput(ns("example_app_with_module"))
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


      output$example_app_with_module <- renderPrint({

        example_app <- readLines(system.file("moduleDemo", "app.R", package = "cbShinyDemo"))

        cat(example_app, sep = "\n")

      })


    }
  )

}

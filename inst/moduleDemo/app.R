library(shiny)

simple_counter_ui <- function(id) {
  ns <- NS(id)

  div(
    actionButton(ns("plus_one"),
                 "Plus one"),
    textOutput(ns("tracker"))
  )
}

simple_counter_server <- function(id) {

  moduleServer(id,
               function(input,
                        output,
                        session) {

                 count <- reactiveVal(0)

                 observeEvent(input$plus_one, {count(count() +1)})

                 output$tracker <- renderText(paste0("The value for counter with namespace '", session$ns(""), "' is ", count()))

               })

}

ui <- basicPage(
  simple_counter_ui("first"),
  simple_counter_ui("second"),
  simple_counter_ui("third")
)

server <- function(input, output, session) {
  simple_counter_server("first")
  simple_counter_server("second")
  simple_counter_server("third")
}

shinyApp(ui, server)

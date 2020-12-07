header <- dashboardHeader(title = "Shiny Demo")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Structure",
             tabName = "structure"),
    menuItem("Other",
             tabName = "other")
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("structure",
            structure_ui("main")),
    tabItem("other",
            other_ui("main"))
  )
)

ui <- dashboardPage(header = header,
                    sidebar = sidebar,
                    body = body)

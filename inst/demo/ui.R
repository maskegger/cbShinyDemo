header <- dashboardHeader(title = "cbShinyDemo")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Intro",
             tabName = "intro"),
    menuItem("Structure",
             tabName = "structure"),
    menuItem("UI",
             tabName = "interface"),
    menuItem("Testing",
             tabName = "testing"),
    menuItem("Javascript",
             tabName = "javascript"),
    menuItem("DT DataTables",
             tabName = "datatables"),
    menuItem("Other topics",
             tabName = "other")
  )
)

body <- dashboardBody(

  tags$link(rel = "stylesheet",
            type = "text/css",
            href = "styling.css"),

  tabItems(
    tabItem("intro",
            intro_ui("intro")),
    tabItem("structure",
            structure_ui("structure")),
    tabItem("interface",
            interface_ui("interface")),
    tabItem("testing",
            testing_ui("testing")),
    tabItem("javascript",
            javascript_ui("javascript")),
    tabItem("datatables",
            datatables_ui("datatables")),
    tabItem("other",
            other_ui("other"))
  )
)

ui <- dashboardPage(header = header,
                    sidebar = sidebar,
                    body = body)

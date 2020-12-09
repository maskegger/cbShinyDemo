server <- function(input, output, session) {

  intro_server("intro")

  structure_server("structure")

  interface_server("interface")

  testing_server("testing")

  javascript_server("javascript")

  datatables_server("datatables")

  other_server("other")

}

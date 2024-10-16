mod_MetricTable_UI = function(id) {
  ns <- NS(id)
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "MetricTable",
    htmlDependency_gtShiny(),
    htmlDependency_gtShinyInput(),
    shiny::htmlOutput(ns("table"), class = "gtInput")
  )
}

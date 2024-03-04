modScatterUI <- function(id) {
  ns <- NS(id)
    uiOutput(ns("all_charts"), class = "chart-container")
}

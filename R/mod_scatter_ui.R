mod_scatter_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("all_charts"), class = "chart-container")
}

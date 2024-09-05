mod_Scatter_UI <- function(id) {
  ns <- NS(id)
  uiOutput(ns("all_charts"), class = "chart-container")
}

mod_ScatterPlot_UI <- function(id, plot_title = NULL) {
  ns <- NS(id)
  card_header <- if (!is.null(plot_title)) {
    bslib::card_header(plot_title)
  }
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "chart",
    card_header,
    Widget_ScatterPlotOutput(ns("scatter_plot"))
  )
}

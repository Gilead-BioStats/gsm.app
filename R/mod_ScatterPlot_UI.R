#' ScatterPlot Module UI
#'
#' @inheritParams shared-params
#' @return A [bslib::card()] with an optional title and a
#'   [Widget_ScatterPlotOutput()].
#' @keywords internal
mod_ScatterPlot_UI <- function(id, strPlotTitle = NULL) {
  ns <- NS(id)
  card_header <- if (!is.null(strPlotTitle)) {
    bslib::card_header(strPlotTitle)
  }
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "chart",
    card_header,
    Widget_ScatterPlotOutput(ns("scatter_plot"))
  )
}

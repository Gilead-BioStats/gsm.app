#' ScatterPlot Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
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
    htmlDependency_ScatterPlotInput(),
    Widget_ScatterPlotOutput(ns("plot"))
  )
}

#' ScatterPlot Input javascript
#'
#' Attach `scatterPlot.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_ScatterPlotInput <- function() {
  htmltools::htmlDependency(
    name = "scatterPlot",
    version = "1.0.0",
    src = "inputs",
    package = "gsm.app",
    script = "scatterPlot.js"
  )
}

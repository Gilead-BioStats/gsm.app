#' TimeSeries Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [Widget_TimeSeriesOutput()].
#' @keywords internal
mod_TimeSeries_UI <- function(id, strPlotTitle = NULL) {
  ns <- NS(id)
  card_header <- if (!is.null(strPlotTitle)) {
    bslib::card_header(strPlotTitle)
  }
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "chart",
    card_header,
    htmlDependency_TimeSeriesInput(),
    Widget_TimeSeriesOutput(ns("plot"))
  )
}

#' Time Series Input JavaScript
#'
#' Attach `timeSeriesInput.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_TimeSeriesInput <- function() {
  htmltools::tagList(
    htmlDependency_WidgetInputHelpers(),
    htmltools::htmlDependency(
      name = "timeSeriesInput",
      version = "1.0.0",
      src = "inputs",
      package = "gsm.app",
      script = "timeSeriesInput.js"
    )
  )
}

#' ScatterPlot Set Module UI
#'
#' @inheritParams shared-params
#'
#' @return An [htmltools::tagList()] containing a [bslib::layout_column_wrap()]
#'   of plots, and the output of [out_DetectCardClicks()] (the JavaScript
#'   necessary to detect that the plot has been clicked).
#' @keywords internal
mod_ScatterPlotSet_UI <- function(id, chrMetrics) {
  ns <- NS(id)
  plots <- purrr::imap(
    chrMetrics,
    function(MetricID, MetricName) {
      mod_ScatterPlot_UI(ns(MetricID), MetricName)
    }
  )
  tagList(
    bslib::layout_column_wrap(id = id, width = 1/2, !!!unname(plots)),
    out_DetectCardClicks(id, ns("selectedScatterPlot"))
  )
}

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

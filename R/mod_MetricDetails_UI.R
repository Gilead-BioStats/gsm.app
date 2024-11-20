#' Metric Details UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_MetricDetails_UI <- function(id) {
  ns <- NS(id)
  bslib::navset_underline(
    id = ns("selected_tab"),
    bslib::nav_panel(
      "Scatter Plot",
      mod_ScatterPlot_UI(ns("scatter_plot"))
    ),
    bslib::nav_panel(
      "Bar Chart (KRI Value)",
      mod_BarChart_UI(ns("bar_chart_metric"))
    ),
    bslib::nav_panel(
      "Bar Chart (KRI Score)",
      mod_BarChart_UI(ns("bar_chart_score"))
    ),
    bslib::nav_panel(
      "Time Series",
      mod_TimeSeries_UI(ns("time_series"))
    ),
    bslib::nav_panel(
      "Analysis Output",
      mod_MetricTable_UI(ns("analysis_output"))
    )
  )
}

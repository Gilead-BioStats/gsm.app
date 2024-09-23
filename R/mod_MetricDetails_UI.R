#' Metric Details UI
#'
#' @inheritParams shared-params
#'
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
      div(
        class = "card mb-3",
        style = "margin-top: 4px;",
        div(
          class = "card-body",
          gsm::Widget_BarChartOutput(ns("bar_chart_metric"))
        )
      )
    ),
    bslib::nav_panel(
      "Bar Chart (KRI Score)",
      div(
        class = "card mb-3",
        style = "margin-top: 4px;",
        div(
          class = "card-body",
          gsm::Widget_BarChartOutput(ns("bar_chart_score"))
        )
      )
    ),
    bslib::nav_panel(
      "Time Series",
      div(
        class = "card mb-3",
        style = "margin-top: 4px;",
        div(
          class = "card-body",
          gsm::Widget_TimeSeriesOutput(ns("time_series"))
        )
      )
    ),
    bslib::nav_panel(
      "Analysis Output",
      div(
        id = "analysis_output_table",
        class = "card mb-3",
        style = "margin-top: 4px;",
        div(
          class = "card-body",
          uiOutput(ns("results"))
        )
      )
    )
  )
}

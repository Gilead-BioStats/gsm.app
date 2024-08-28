#' Metric Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_metric_details_ui <- function(id) {
  ns <- NS(id)

  ui <- htmltools::tagList(
    shiny::column(
      width = 12,
      tabsetPanel(
        id = ns("selected_tab"),
        tabPanel(
          "Scatter Plot",
          div(
            class = "card mb-3",
            style = "margin-top: 4px;",
            div(
              class = "card-body",
              gsm::Widget_ScatterPlotOutput(ns("scatter_plot"))
            )
          )
        ),
        tabPanel(
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
        tabPanel(
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
        tabPanel(
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
        tabPanel(
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
        ),
        type = "pills"
      )
    )
  )

  return(ui)
}

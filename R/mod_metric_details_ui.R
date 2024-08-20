#' Metric Details UI
#'
#' @inheritParams shared-params
#'
#' @export
mod_metric_details_ui <- function(id) {
  ns <- shiny::NS(id)

  ui <- div(
    class = "row",
    div(
      class = "col-12 col-sm-12 col-md-12 col-lg-12 col-xxl-10",
      style = "min-width: 850px;",
      shiny::tabsetPanel(
        id = ns("selected_tab"),
        shiny::tabPanel(
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
        shiny::tabPanel(
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
        shiny::tabPanel(
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
        shiny::tabPanel(
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
        shiny::tabPanel(
          "Analysis Output",
          div(
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

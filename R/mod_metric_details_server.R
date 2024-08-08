#' Metric Details Server
#'
#' @inheritParams shared-params
#'
#' @export
mod_metric_details_server <- function(id,
                                      rctv_dfResults,
                                      rctv_lMetric,
                                      dfGroups,
                                      rctv_dfBounds) {
  shiny::moduleServer(id, function(input, output, session) {
    output$scatter_plot <- gsm::renderWidget_ScatterPlot({
      gsm::Widget_ScatterPlot(
        rctv_dfResults(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        dfBounds = rctv_dfBounds(),
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })

    output$bar_chart_score <- gsm::renderWidget_BarChart({
      gsm::Widget_BarChart(
        rctv_dfResults(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        strOutcome = "Score",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })

    output$bar_chart_metric <- gsm::renderWidget_BarChart({
      gsm::Widget_BarChart(
        rctv_dfResults(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        strOutcome = "Metric",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })

    output$time_series <- gsm::renderWidget_TimeSeries({
      gsm::Widget_TimeSeries(
        rctv_dfResults(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        strOutcome = "Score",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })

    output$results <- renderUI({
      gsm::Report_MetricTable(
        rctv_dfResults() %>%
          dplyr::select(
            -dplyr::all_of(c("GroupLevel", "StudyID", "SnapshotDate"))
          ),
        dfGroups,
        strGroupLevel = "Site"
      ) %>%
        HTML()
    })
  })
}

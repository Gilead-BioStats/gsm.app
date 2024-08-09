#' Metric Details Server
#'
#' @inheritParams shared-params
#'
#' @export
mod_metric_details_server <- function(id,
                                      dfResults,
                                      dfMetrics,
                                      dfGroups,
                                      dfBounds,
                                      rctv_strSite,
                                      rctv_strMetricID) {
  shiny::moduleServer(id, function(input, output, session) {
    rctv_dfResults_byMetricID <- reactive({
      filter_byMetricID(dfResults, rctv_strMetricID())
    })
    rctv_lMetric <- reactive({
      lMetric <- as.list(
        filter_byMetricID(dfMetrics, rctv_strMetricID())
      )
      if (rctv_strSite() != "None") {
        lMetric$selectedGroupIDs <- rctv_strSite()
      }
      lMetric
    })
    rctv_dfBounds_byMetricID <- reactive({
      filter_byMetricID(dfBounds, rctv_strMetricID())
    })

    output$scatter_plot <- gsm::renderWidget_ScatterPlot({
      gsm::Widget_ScatterPlot(
        rctv_dfResults_byMetricID(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        dfBounds = rctv_dfBounds_byMetricID(),
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })
    output$bar_chart_metric <- gsm::renderWidget_BarChart({
      gsm::Widget_BarChart(
        rctv_dfResults_byMetricID(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        strOutcome = "Metric",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })
    output$bar_chart_score <- gsm::renderWidget_BarChart({
      gsm::Widget_BarChart(
        rctv_dfResults_byMetricID(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        strOutcome = "Score",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })
    output$time_series <- gsm::renderWidget_TimeSeries({
      gsm::Widget_TimeSeries(
        rctv_dfResults_byMetricID(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        strOutcome = "Score",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )
    })
    output$results <- renderUI({
      gsm::Report_MetricTable(
        rctv_dfResults_byMetricID() %>%
          filter_byGroupID(rctv_strSite()) %>%
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

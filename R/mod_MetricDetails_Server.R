#' Metric Details Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the group selected that was
#'   most recently selected on one of the tabs.
#' @keywords internal
mod_MetricDetails_Server <- function(
  id,
  dfResults,
  dfGroups,
  dfBounds,
  rctv_lMetric,
  rctv_strSiteID,
  rctv_strMetricID
) {
  moduleServer(id, function(input, output, session) {
    # Shared reactives ----
    rctv_dfResults_byMetricID <- reactive({
      filter_byMetricID(dfResults, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfBounds_byMetricID <- reactive({
      filter_byMetricID(dfBounds, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfResults_Latest <- reactive({
      gsm::FilterByLatestSnapshotDate(rctv_dfResults_byMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    # Selections from tabs ----

     mod_ScatterPlot_Server(
      "scatter_plot",
      rctv_dfResults = rctv_dfResults_byMetricID,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      rctv_dfBounds = rctv_dfBounds_byMetricID,
      rctv_strSiteID = rctv_strSiteID
    )

    mod_BarChart_Server(
      "bar_chart_metric",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Metric",
      rctv_strSiteID = rctv_strSiteID
    )

    mod_BarChart_Server(
      "bar_chart_score",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Score",
      rctv_dfBounds = rctv_dfBounds_byMetricID,
      rctv_strSiteID = rctv_strSiteID
    )

    mod_TimeSeries_Server(
      "time_series",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Score",
      rctv_dfBounds = rctv_dfBounds_byMetricID,
      rctv_strSiteID = rctv_strSiteID
    )

    mod_MetricTable_Server(
      "analysis_output",
      rctv_dfResults = rctv_dfResults_byMetricID,
      dfGroups = dfGroups,
      rctv_strSiteID = rctv_strSiteID
    )
  })
}

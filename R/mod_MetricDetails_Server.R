#' Metric Details Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the group selected that was
#'   most recently selected on one of the tabs. Currently only implemented for
#'   the "Scatter Plot" tab (returns a reactive value that evaluates to `NULL`
#'   for the other cases).
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

    rctv_dfResults_Latest <- reactive({
      gsm::FilterByLatestSnapshotDate(rctv_dfResults_byMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfBounds_byMetricID <- reactive({
      filter_byMetricID(dfBounds, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_strScatterGroup <- mod_ScatterPlot_Server(
      "scatter_plot",
      rctv_dfResults = rctv_dfResults_byMetricID,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      rctv_dfBounds = rctv_dfBounds_byMetricID
    )
    # Placeholders until these are reigned in with modules.
    rctv_strBarValueGroup <- reactive(NULL)
    rctv_strBarScoreGroup <- reactive(NULL)
    rctv_strTimeSeriesGroup <- reactive(NULL)
    rctv_strAnalysisOutputGroup <- mod_MetricTable_Server(
      "analysis_output",
      rctv_dfResults = rctv_dfResults_byMetricID,
      dfGroups = dfGroups,
      rctv_strSiteID = rctv_strSiteID
    )

    # Outputs ----
    rctv_strSelectedGroupID <- reactive({
      req(input$selected_tab)
      switch(input$selected_tab,
        "Scatter Plot" = rctv_strScatterGroup(),
        "Bar Chart (KRI Value)" = {
          output$bar_chart_metric <- gsm::renderWidget_BarChart({
            gsm::Widget_BarChart(
              rctv_dfResults_Latest(),
              lMetric = rctv_lMetric(),
              dfGroups = dfGroups,
              strOutcome = "Metric",
              bAddGroupSelect = FALSE,
              strShinyGroupSelectID = "site"
            )
          })
          outputOptions(output, "bar_chart_metric", suspendWhenHidden = FALSE)
          rctv_strBarValueGroup()
        },
        "Bar Chart (KRI Score)" = {
          output$bar_chart_score <- gsm::renderWidget_BarChart({
            gsm::Widget_BarChart(
              rctv_dfResults_Latest(),
              lMetric = rctv_lMetric(),
              dfGroups = dfGroups,
              strOutcome = "Score",
              bAddGroupSelect = FALSE,
              strShinyGroupSelectID = "site"
            )
          })
          outputOptions(output, "bar_chart_score", suspendWhenHidden = FALSE)
          rctv_strBarScoreGroup()
        },
        "Time Series" = {
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
          outputOptions(output, "time_series", suspendWhenHidden = FALSE)
          rctv_strTimeSeriesGroup()
        },
        "Analysis Output" = rctv_strAnalysisOutputGroup()
      )
    })

    return(rctv_strSelectedGroupID)
  })
}

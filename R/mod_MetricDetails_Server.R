#' Metric Details Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_MetricDetails_Server <- function(
  id,
  dfResults,
  dfGroups,
  dfBounds,
  rctv_lMetric,
  rctv_strSiteID,
  rctv_strMetricID) {
  moduleServer(id, function(input, output, session) {
    # Shared reactives ----
    rctv_dfResults_byMetricID <- reactive({
      filter_byMetricID(dfResults, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())
    rctv_dfResults_AnalysisOutput <- reactive({
      rctv_dfResults_byMetricID() %>%
        dplyr::arrange("GroupID") %>%
        dplyr::select(
          "GroupID", "Numerator", "Denominator", "Metric",
          "Score", "Flag", "MetricID"
        )
    }) %>%
      bindCache(rctv_strMetricID())
    rctv_dfBounds_byMetricID <- reactive({
      filter_byMetricID(dfBounds, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    # Outputs ----
    observe({
      switch(input$selected_tab,
             "Scatter Plot" = {
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
               outputOptions(output, "scatter_plot", suspendWhenHidden = FALSE)
             },
             "Bar Chart (KRI Value)" = {
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
               outputOptions(output, "bar_chart_metric", suspendWhenHidden = FALSE)
             },
             "Bar Chart (KRI Score)" = {
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
               outputOptions(output, "bar_chart_score", suspendWhenHidden = FALSE)
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
             },
             "Analysis Output" = {
               output$results <- renderUI({
                 gsm::Report_MetricTable(
                   rctv_dfResults_AnalysisOutput(),
                   dfGroups,
                   strGroupLevel = "Site"
                 ) %>%
                   HTML()
               })
               observe({
                 shinyjs::runjs(
                   sprintf(
                     "highlightTableRow('analysis_output_table', '%s');",
                     rctv_strSiteID()
                   )
                 )
               })
               shinyjs::runjs("tableClick('analysis_output_table');")
             }
      )
    }) %>%
      bindEvent(input$selected_tab)
  })
}

#' Metric Details UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_MetricDetails_UI <- function(id, chrMetrics) {
  ns <- NS(id)
  bslib::navset_underline(
    id = ns("selected_tab"),
    bslib::nav_item(
      class = "navbar-extras",
      htmlDependency_Stylesheet("navbarExtras.css"),
      shinyWidgets::virtualSelectInput(
        inputId = ns("metric"),
        # label = strong("Metric"),
        label = NULL,
        choices = chrMetrics,
        inline = TRUE
      )
    ),
    bslib::nav_spacer(),
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

#' Metric Details Server
#'
#' @inheritParams shared-params
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
      req(rctv_strMetricID())
      FilterbyMetricID(dfResults, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfBounds_byMetricID <- reactive({
      req(rctv_strMetricID())
      FilterbyMetricID(dfBounds, rctv_strMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfResults_Latest <- reactive({
      req(rctv_strMetricID())
      gsm.kri::FilterByLatestSnapshotDate(rctv_dfResults_byMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfBounds_Latest <- reactive({
      req(rctv_strMetricID())
      gsm.kri::FilterByLatestSnapshotDate(rctv_dfBounds_byMetricID())
    }) %>%
      bindCache(rctv_strMetricID())

    observe({rctv_strMetricID(input$metric)})

    srvr_SyncVirtualSelectInput("metric", rctv_strMetricID, session)

    # Selections from tabs ----

    mod_ScatterPlot_Server(
      "scatter_plot",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      rctv_dfBounds = rctv_dfBounds_Latest,
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
      rctv_dfBounds = rctv_dfBounds_Latest,
      rctv_strSiteID = rctv_strSiteID
    )

    mod_TimeSeries_Server(
      "time_series",
      rctv_dfResults = rctv_dfResults_byMetricID,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Score",
      rctv_dfBounds = rctv_dfBounds_byMetricID,
      rctv_strSiteID = rctv_strSiteID
    )

    mod_MetricTable_Server(
      "analysis_output",
      rctv_dfResults = rctv_dfResults_Latest,
      dfGroups = dfGroups,
      rctv_strSiteID = rctv_strSiteID
    )
  })
}

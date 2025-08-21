#' Metric Details UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_MetricDetails_UI <- function(id, dfMetrics) {
  ns <- NS(id)
  # Only give choices from the last GroupLevel at first.
  dfMetrics <- dfMetrics %>%
    dplyr::filter(
      .data$GroupLevel ==
        sort(
          unique(dfMetrics$GroupLevel),
          decreasing = TRUE
        )[[1]]
    ) %>%
    dplyr::arrange(.data$Metric)
  bslib::navset_underline(
    id = ns("selected_tab"),
    mod_NavSelect_UI(
      ns("metric"),
      chrChoices = rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric)
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
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  rctv_lMetric,
  rctv_strGroupID,
  rctv_strGroupLevel,
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

    observe({
      req(input$`metric-select`)
      rctv_strMetricID(input$`metric-select`)
    })

    # I can't get tests to see this happening so far. I tested manually and it
    # functions as expected.
    #
    # nocov start
    bindEvent(
      observe({
        strMetricID <- rctv_strMetricID()
        dfMetrics <- dplyr::filter(
          dfMetrics,
          .data$GroupLevel == rctv_strGroupLevel()
        ) %>%
          dplyr::arrange(.data$Metric)
        if (!strMetricID %in% dfMetrics$MetricID) {
          strMetricID <- dfMetrics$MetricID[[1]]
        }
        shinyWidgets::updateVirtualSelect(
          inputId = "metric-select",
          choices = rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric),
          selected = strMetricID,
          session = session
        )
      }),
      rctv_strGroupLevel(),
      ignoreInit = TRUE
    )
    # nocov end

    srvr_SyncVirtualSelectInput(
      "metric-select",
      rctv_strSelected = rctv_strMetricID,
      session = session
    )

    # Selections from tabs ----

    mod_ScatterPlot_Server(
      "scatter_plot",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      rctv_dfBounds = rctv_dfBounds_Latest,
      rctv_strGroupID = rctv_strGroupID
    )

    mod_BarChart_Server(
      "bar_chart_metric",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Metric",
      rctv_strGroupID = rctv_strGroupID
    )

    mod_BarChart_Server(
      "bar_chart_score",
      rctv_dfResults = rctv_dfResults_Latest,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Score",
      rctv_dfBounds = rctv_dfBounds_Latest,
      rctv_strGroupID = rctv_strGroupID
    )

    mod_TimeSeries_Server(
      "time_series",
      rctv_dfResults = rctv_dfResults_byMetricID,
      rctv_lMetric = rctv_lMetric,
      dfGroups = dfGroups,
      strOutcome = "Score",
      rctv_dfBounds = rctv_dfBounds_byMetricID,
      rctv_strGroupID = rctv_strGroupID
    )

    mod_MetricTable_Server(
      "analysis_output",
      rctv_dfResults = rctv_dfResults_Latest,
      dfGroups = dfGroups,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel
    )
  })
}

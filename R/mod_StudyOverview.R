#' Study Overview UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_StudyOverview_UI <- function(id, dfGroups, dfResults, dfMetrics) {
  ns <- NS(id)
  dfResults <- gsm.kri::FilterByLatestSnapshotDate(dfResults)
  strSiteRiskMetric <- "Analysis_srs0001"

  bslib::layout_columns(
    col_widths = c(3, 9),
    mod_StudyInformation_UI(ns("study_information"), dfGroups, dfResults),
    bslib::navset_underline(
      id = ns("nav_bar"),
      bslib::nav_panel(
        title = "Overview Table",
        mod_GroupOverview_UI(ns("table"), dfResults)
      ),
      bslib::nav_panel(
        title = "Scatter Plots",
        mod_ScatterPlotSet_UI(
          ns("scatter"),
          dplyr::filter(dfMetrics, .data$MetricID != strSiteRiskMetric)
        )
      )
    )
  )
}

#' Study Overview Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_StudyOverview_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strMetricID
) {
  strSiteRiskMetric <- "Analysis_srs0001"
  moduleServer(id, function(input, output, session) {
    rctv_intClickCounter <- reactiveVal()

    # Update things when the user clicks the GroupOverview table.
    mod_GroupOverview_Server(
      "table",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strMetricID = rctv_strMetricID
    )

    # Update things when the user clicks a plot.
    mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dplyr::filter(dfMetrics, .data$MetricID != strSiteRiskMetric),
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strMetricID = rctv_strMetricID
    )
  })
}

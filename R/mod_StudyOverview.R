#' Study Overview UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_StudyOverview_UI <- function(id, dfGroups, dfResults, chrMetrics) {
  ns <- NS(id)
  dfResults <- gsm.kri::FilterByLatestSnapshotDate(dfResults)

  bslib::layout_columns(
    col_widths = c(2, 10),
    out_StudyInformation(dfGroups, dfResults),
    bslib::navset_underline(
      id = ns("nav_bar"),
      bslib::nav_panel(
        title = "Overview Table",
        mod_GroupOverview_UI(ns("table"), dfResults)
      ),
      bslib::nav_panel(
        title = "Scatter Plots",
        mod_ScatterPlotSet_UI(ns("scatter"), chrMetrics)
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
    rctv_strMetricID
) {
  moduleServer(id, function(input, output, session) {
    rctv_intClickCounter <- reactiveVal()

    # Update things when the user clicks the GroupOverview table.
    mod_GroupOverview_Server(
      "table",
      dfResults,
      dfMetrics,
      dfGroups,
      rctv_strGroupID,
      rctv_strMetricID
    )

    # Update things when the user clicks a plot.
    mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strMetricID = rctv_strMetricID
    )
  })
}

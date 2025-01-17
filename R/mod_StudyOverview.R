#' Study Overview UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_StudyOverview_UI <- function(id, dfResults, chrMetrics) {
  ns <- NS(id)
  dfResults <- gsm::FilterByLatestSnapshotDate(dfResults)

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
    rctv_strSiteID,
    rctv_strMetricID
) {
  moduleServer(id, function(input, output, session) {
    rctv_intClickCounter <- shiny::reactiveVal()

    # Update things when the user clicks the GroupOverview table.
    mod_GroupOverview_Server(
      "table",
      dfResults,
      dfMetrics,
      dfGroups,
      rctv_strMetricID,
      rctv_strSiteID
    )

    # Update things when the user clicks a plot.
    mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strSiteID = rctv_strSiteID
    )
  })
}

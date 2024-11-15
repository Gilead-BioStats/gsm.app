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

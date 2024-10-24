#' Study Overview UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_StudyOverview_UI <- function(id, dfResults, chrMetrics) {
  ns <- NS(id)
  dfResults <- gsm::FilterByLatestSnapshotDate(dfResults)

  bslib::navset_underline(
    id = ns("nav_bar"),
    bslib::nav_panel(
      title = "Overview Table",
      bslib::card(
        full_screen = TRUE,
        bslib::card_body(
          mod_RAGPillSet_UI(
            ns("kri_counts"),
            intRed = sum(abs(dfResults$Flag) == 2, na.rm = TRUE),
            intAmber = sum(abs(dfResults$Flag) == 1, na.rm = TRUE)
          ),
          Widget_GroupOverviewOutput(
            ns("site_overview_table"),
            height = "100%"
          ),
          htmltools::htmlDependency(
            "rbm-viz-css",
            "2.1.0",
            src = "htmlwidgets/lib/rbm-viz-2.1.0",
            stylesheet = "rbm-viz.css",
            package = "gsm"
          )
        ),
        id = "study-overview-table-card"
      )
    ),
    bslib::nav_panel(
      title = "Scatter Plots",
      mod_ScatterPlotSet_UI(ns("scatter"), chrMetrics)
    )
  )
}

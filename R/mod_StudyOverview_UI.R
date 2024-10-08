#' Study Overview UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_StudyOverview_UI <- function(id, dfResults, chrMetrics) {
  ns <- NS(id)
  bslib::navset_underline(
    id = ns("nav_bar"),
    bslib::nav_panel(
      title = "Overview Table",
      bslib::card(
        full_screen = TRUE,
        bslib::card_body(
          out_KRIColor(gsm::FilterByLatestSnapshotDate(dfResults)),
          gsm::Widget_GroupOverviewOutput(
            ns("site_overview_table"),
            height = "100%"
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

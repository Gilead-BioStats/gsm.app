#' Shiny UI function
#'
#' The user interface for a gsm deep dive app.
#'
#' @inheritParams shared-params
#' @returns A Shiny UI object
#' @keywords internal
gsmApp_UI <- function(
  dfAnalyticsInput,
  dfGroups,
  dfMetrics,
  dfResults,
  strTitle = "GSM Deep Dive",
  tagListSidebar = NULL
) {
  # Transform data for use in lower-level functions. ----
  intNParticipants <- length(unique(dfAnalyticsInput$SubjectID))
  lStudy <- make_lStudy(dfGroups, dfResults)
  chrMetrics <- rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric)
  chrSites <- sort(unique(dfGroups$GroupID[dfGroups$GroupLevel == "Site"]))

  bslib::page_navbar(
    id = "primary_nav_bar",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    fillable = FALSE,
    !!!out_MainTabs(dfResults = dfResults, chrMetrics = chrMetrics),
    sidebar = out_Sidebar(
      lStudy,
      chrMetrics,
      chrSites,
      intNParticipants,
      tagListSidebar
    ),
    header = favawesome_icon("angles-up", fill = colorScheme("red"))
  )
}

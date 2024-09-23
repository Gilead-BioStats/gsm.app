#' Shiny UI function
#'
#' This function defines the user interface for your Shiny web application.
#' It specifies the layout of the web page and the interface elements it contains.
#'
#' @inheritParams shared-params
#' @return A Shiny UI object
#' @keywords internal
gsmApp_UI <- function(dfResults,
  dfMetrics,
  dfGroups,
  intNParticipants,
  strTitle = "GSM Deep Dive") {
  # Transform data for use in lower-level functions. ----
  lStudy <- make_lStudy(dfGroups, dfResults)
  chrMetrics <- rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric)
  chrSites <- sort(unique(dfGroups$GroupID[dfGroups$GroupLevel == "Site"]))

  bslib::page_navbar(
    # class = "bg-light",
    id = "primary_nav_bar",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    !!!out_MainTabs(dfResults = dfResults),
    sidebar = out_Sidebar(lStudy, chrMetrics, chrSites, intNParticipants)
  )
}

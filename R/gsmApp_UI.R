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

  # Return ----
  bslib::page_fluid(
    shinyjs::useShinyjs(),
    class = "bg-light",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    htmlDependency_Stylesheet(),
    htmlDependency_HighlightTableRow(),
    htmlDependency_TableClick(),
    out_MainContent(
      lStudy = lStudy,
      chrMetrics = chrMetrics,
      chrSites = chrSites,
      dfResults = dfResults,
      intNParticipants = intNParticipants,
      strTitle = strTitle
    )
  )
}

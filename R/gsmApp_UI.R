#' Shiny UI function
#'
#' This function defines the user interface for your Shiny web application.
#' It specifies the layout of the web page and the interface elements it contains.
#'
#' @inheritParams shared-params
#' @return A Shiny UI object
gsmApp_UI <- function(dfResults,
                      dfMetrics,
                      dfGroups,
                      intNParticipants,
                      strTitle = "GSM Deep Dive") {
  lStudy <- make_lStudy(dfGroups, dfResults)
  chrMetrics <- rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric)
  chrSites <- sort(unique(
    dfGroups[dfGroups$GroupLevel == "Site", ][["GroupID"]]
  ))
  bslib::page_fluid(
    shinyjs::useShinyjs(),
    class = "bg-light",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    html_dependency_Stylesheet(),
    html_dependency_HighlightTableRow(),
    html_dependency_TableClick(),
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

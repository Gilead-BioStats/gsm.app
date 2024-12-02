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
  lPlugins = NULL,
  strTitle = "GSM Deep Dive",
  strFavicon = "angles-up",
  strFaviconColor = colorScheme("red"),
  tagListSidebar = NULL
) {
  # Transform data for use in lower-level functions. ----
  intNParticipants <- length(unique(dfAnalyticsInput$SubjectID))
  chrMetrics <- rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric)

  bslib::page_navbar(
    id = "primary_nav_bar",
    title = strTitle,
    theme = bslib::bs_theme(version = 5),
    fillable = FALSE,
    !!!out_MainTabs(dfResults = dfResults, chrMetrics = chrMetrics, lPlugins = lPlugins),
    sidebar = out_Sidebar(
      dfGroups,
      dfResults,
      chrMetrics,
      intNParticipants,
      tagListSidebar
    ),
    header = favawesome::fav(strFavicon, fill = strFaviconColor)
  )
}

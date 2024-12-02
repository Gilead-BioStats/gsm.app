#' Main Tabbed Content
#'
#' @inheritParams shared-params
#' @returns A list of [bslib::nav_panel()] elements, containing the main tabbed
#'   content.
#' @keywords internal
out_MainTabs <- function(dfResults, chrMetrics, lPlugins = NULL) {
  MainTabs <- list(
    bslib::nav_panel(
      title = "Study Overview",
      mod_StudyOverview_UI("study_overview", dfResults, chrMetrics)
    ),
    bslib::nav_panel(
      title = "Metric Details",
      mod_MetricDetails_UI("metric_details"),
      mod_SiteDetails_UI("site_details")
    ),
    bslib::nav_panel(
      title = "Participant Details",
      mod_ParticipantDetails_UI("participant_details")
    )
  )
  MainTabs <- c(MainTabs, mod_Plugins_UI("plugins", lPlugins))

  return(MainTabs)
}

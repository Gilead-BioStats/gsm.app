#' Main Tabbed Content
#'
#' @inheritParams shared-params
#' @returns A list of [bslib::nav_panel()] elements, containing the main tabbed
#'   content.
#' @keywords internal
out_MainTabs <- function(dfResults, chrMetrics, lModules = NULL) {
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

  if (!is.null(lModules)) {
    for (lModule in lModules) {
      MainTabs <- c(
        MainTabs,
        list(
          bslib::nav_panel(
            title = lModule$lConfig$meta$Name,
            lModule$fnUI(lModule$lConfig$meta$ID, lModule$lConfig)
          )
        )
      )
    }
  }

  return(MainTabs)
}

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

  if (!is.null(lPlugins)) {
    plugin_items <- list()
    plugin_items <- purrr::map(lPlugins, function(lPlugin) {
      bslib::nav_panel(
        title = lPlugin$lConfig$meta$Name,
        lPlugin$fnUI(lPlugin$lConfig$meta$ID, lPlugin$lConfig)
      )
    })
    pluginMenu <- list(bslib::nav_menu(
      "Plugins",
      !!!plugin_items
    ))
    MainTabs <- c(MainTabs, pluginMenu)
  }

  return(MainTabs)
}

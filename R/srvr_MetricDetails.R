#' Temporary Metric Details wrapper
#'
#' This really should be a full module, but this lets me "hide" some server code
#' so it isn't all inside [gsmApp_Server()].
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] for `rctv_strSiteDetailsParticipant` from
#'   [mod_SiteDetails_Server()].
#' @keywords internal
srvr_MetricDetails <- function(
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  rctv_strMetricID,
  rctv_strPrimaryNavBar,
  rctv_strSiteID,
  rctv_strSubjectID,
  input,
  output,
  session
) {
  rctv_lMetric <- srvr_rctv_lMetric(
    dfMetrics,
    rctv_strMetricID,
    rctv_strSiteID,
    session
  )

  srvr_SyncTab(
    "primary_nav_bar",
    "Metric Details",
    rctv_strMetricID,
    rctv_strPrimaryNavBar,
    chrFromTabs = c("Study Overview", "Domain Details"),
    session = session
  )
  srvr_SyncTab(
    "primary_nav_bar",
    "Metric Details",
    rctv_strSiteID,
    rctv_strPrimaryNavBar,
    chrFromTabs = "Study Overview",
    session = session
  )

  mod_MetricDetails_Server(
    "metric_details",
    dfResults = dfResults,
    dfGroups = dfGroups,
    dfBounds = dfBounds,
    rctv_lMetric = rctv_lMetric,
    rctv_strSiteID = rctv_strSiteID,
    rctv_strMetricID = rctv_strMetricID
  )
  mod_SiteDetails_Server(
    "site_details",
    dfGroups = dfGroups,
    dfAnalyticsInput = dfAnalyticsInput,
    rctv_strSiteID = rctv_strSiteID,
    rctv_strSubjectID = rctv_strSubjectID,
    rctv_strMetricID = rctv_strMetricID,
    rctv_lMetric = rctv_lMetric
  )
}

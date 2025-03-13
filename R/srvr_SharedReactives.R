#' Reactive lMetric by metric
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, filtered by metric.
#' @keywords internal
srvr_rctv_lMetric_base <- function(
  dfMetrics,
  rctv_strMetricID,
  session = getDefaultReactiveDomain()
) {
  reactive({
    as.list(
      FilterbyMetricID(dfMetrics, rctv_strMetricID())
    )
  }) %>%
    bindCache(rctv_strMetricID())
}

#' Reactive lMetric by metric and site
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, with information about
#'   the selected site.
#' @keywords internal
srvr_rctv_lMetric <- function(
  dfMetrics,
  rctv_strMetricID,
  rctv_strSiteID,
  session = getDefaultReactiveDomain()
) {
  rctv_lMetric_base <- srvr_rctv_lMetric_base(
    dfMetrics,
    rctv_strMetricID,
    session
  )
  reactive({
    lMetric <- rctv_lMetric_base()
    site <- rctv_strSiteID()
    if (site != "All") {
      lMetric$selectedGroupIDs <- site
    }
    lMetric
  }) %>%
    bindCache(rctv_strMetricID(), rctv_strSiteID())
}

#' Reactive participant IDs
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, filtered by metric.
#' @keywords internal
srvr_rctv_chrParticipantIDs <- function(
  dfAnalyticsInput,
  rctv_strSiteID
) {
  dfParticipantGroups <- dplyr::arrange(
    dplyr::distinct(dfAnalyticsInput, .data$SubjectID, .data$GroupID),
    .data$SubjectID
  )
  reactive({
    site <- rctv_strSiteID()
    if (site == "All") {
      return(c("All", dfParticipantGroups$SubjectID))
    }
    c(
      "All",
      dfParticipantGroups$SubjectID[
        dfParticipantGroups$GroupID == site
      ]
    )
  }) %>%
    bindCache(rctv_strSiteID())
}

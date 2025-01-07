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
      filter_byMetricID(dfMetrics, rctv_strMetricID())
    )
  }) %>%
    bindCache(rctv_strMetricID())
}

#' Reactive lMetric by metric and site
#'
#' @inheritParams shared-params
#' @param rctv_lMetric_base The metric list returned by
#'   [srvr_rctv_lMetric_base()].
#' @returns A [shiny::reactive()] of dfMetrics as a list, with information about
#'   the selected site.
#' @keywords internal
srvr_rctv_lMetric <- function(
  dfMetrics,
  rctv_lMetric_base,
  rctv_strMetricID,
  rctv_strSiteID,
  session = getDefaultReactiveDomain()
) {
  reactive({
    lMetric <- rctv_lMetric_base()
    site <- rctv_strSiteID()
    if (site != "None") {
      lMetric$selectedGroupIDs <- site
    }
    lMetric
  }) %>%
    shiny::bindCache(rctv_strMetricID(), rctv_strSiteID())
}

#' Reactive participant IDs
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, filtered by metric.
#' @keywords internal
srvr_rctv_chrParticipantIDs <- function(
  dfParticipantGroups,
  rctv_strSiteID
) {
  reactive({
    site <- rctv_strSiteID()
    if (site == "None") {
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

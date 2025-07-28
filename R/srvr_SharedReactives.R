#' Reactive lMetric by metric
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, filtered by metric.
#' @keywords internal
srvr_rctv_lMetric_base <- function(
  dfMetrics,
  rctv_strMetricID
) {
  reactive({
    req(rctv_strMetricID())
    as.list(
      FilterbyMetricID(dfMetrics, rctv_strMetricID())
    )
  }) %>%
    bindCache(rctv_strMetricID())
}

#' Reactive lMetric by metric and group
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, with information about
#'   the selected group.
#' @keywords internal
srvr_rctv_lMetric <- function(
  dfMetrics,
  rctv_strMetricID,
  rctv_strGroupID,
  session = getDefaultReactiveDomain()
) {
  rctv_lMetric_base <- srvr_rctv_lMetric_base(dfMetrics, rctv_strMetricID)
  reactive({
    req(rctv_strMetricID())
    lMetric <- rctv_lMetric_base()
    lMetric$selectedGroupIDs <- NullifyEmpty(rctv_strGroupID())
    return(lMetric)
  }) %>%
    bindCache(rctv_strMetricID(), rctv_strGroupID())
}

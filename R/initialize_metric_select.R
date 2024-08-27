#' Initialize Metric Select
#'
#' @inheritParams shared-params
#'
#' @keywords internal
initialize_metric_select <- function(dfMetrics, session) {
  choices <- rlang::set_names(dfMetrics$MetricID, dfMetrics$Metric)

  updateSelectInput(
    session,
    "metric",
    choices = choices,
  )
}

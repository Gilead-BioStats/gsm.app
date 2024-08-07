#' Initialize Metric Select
#'
#' @inheritParams shared-params
#'
#' @export

initialize_metric_select <- function(input, output, session, dfMetrics) {
  choices <- setNames(dfMetrics$MetricID, dfMetrics$Metric)

  shiny::updateSelectInput(
    session,
    "metric",
    choices = choices
  )
}

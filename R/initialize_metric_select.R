#' Initialize Metric Select
#'
#' @inheritParams shared-params
#'
#' @export

initialize_metric_select <- function(input, output, session, dfMetrics) {
  choices <- with(dfMetrics, setNames(MetricID, Metric))

  shiny::updateSelectInput(
    session,
    "metric",
    choices = choices
  )
}

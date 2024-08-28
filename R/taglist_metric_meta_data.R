#' Creates taglist to summarize participants at a particular site
#' @inheritParams shared-params
#' @keywords internal
taglist_metric_meta_data <- function(dfMetrics, strMetricID) {
  sub_dfMetrics <- dfMetrics %>%
    dplyr::filter(.data$MetricID == strMetricID) %>%
    dplyr::select("Metric", "Numerator", "Denominator", "Threshold") %>%
    tidyr::pivot_longer(tidyr::everything())

  return_tags <- shiny::column(
    width = 12,
    lapply(1:length(sub_dfMetrics$name), function(i) {
      htmltools::div(
        class = "metadata-list-item",
        htmltools::div(
          class = "metadata-list-item-label",
          sub_dfMetrics[i, "name"]
        ),
        htmltools::div(class = "metadata-list-item-spacer"),
        htmltools::div(
          class = "metadata-list-item-value",
          sub_dfMetrics[i, "value"]
        )
      )
    })
  )
  return(return_tags)
}

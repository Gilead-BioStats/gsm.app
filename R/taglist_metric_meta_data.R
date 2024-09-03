#' Creates taglist to summarize participants at a particular site
#' @inheritParams shared-params
#' @keywords internal
taglist_metric_meta_data <- function(dfMetrics, strMetricID) {
  sub_dfMetrics <- dfMetrics %>%
    dplyr::filter(.data$MetricID == strMetricID) %>%
    dplyr::select("Metric", "Numerator", "Denominator", "Threshold") %>%
    tidyr::pivot_longer(tidyr::everything())

  return_tags <- column(
    width = 12,
    lapply(1:length(sub_dfMetrics$name), function(i) {
      div(
        class = "metadata-list-item",
        div(
          class = "metadata-list-item-label",
          sub_dfMetrics[i, "name"]
        ),
        div(class = "metadata-list-item-spacer"),
        div(
          class = "metadata-list-item-value",
          sub_dfMetrics[i, "value"]
        )
      )
    })
  )
  return(return_tags)
}

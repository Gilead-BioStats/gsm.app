#' Creates taglist to summarize participants at a particular site
#' @inheritParams shared-params
#' @export
#' @keywords internal
taglist_metric_meta_data <- function(dfMetrics, strMetricID) {

  sub_dfMetrics <- dfMetrics %>%
    dplyr::filter(.data$MetricID == strMetricID) %>%
    dplyr::select("Metric", "Numerator", "Denominator", "Threshold") %>%
    tidyr::pivot_longer(tidyr::everything())

  return_tags <- tagList(

    tags$div(
      class = "col-12",
      lapply(1:length(sub_dfMetrics$name), function(i) {

        tags$div(
          style = "display: flex; justify-content: space-between;",
          tags$div(class = "card-text",
                   style = "text-align: left; white-space: nowrap;",
                   sub_dfMetrics[i, "name"]),
          tags$div(class = "text-secondary",
                   style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
          tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", sub_dfMetrics[i, "value"])
        )


      })
    )
  )

  return(return_tags)
}

#' Metric Table Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [gsm::Report_MetricTable()].
#' @keywords internal
mod_MetricTable_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "MetricTable",
    gt::gt_output(ns("table"))
  )
}

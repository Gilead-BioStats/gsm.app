#' Bidirectional gt Table Selector UI
#'
#' @inheritParams shared-params
#' @returns A [gt::gt_output()] that handles updates from external inputs.
#' @keywords internal
mod_gtBidirectional_UI <- function(id) {
  ns <- NS(id)
  gt::gt_output(ns("table"))
}

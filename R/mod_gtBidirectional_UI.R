#' Bidirectional gt Table Selector UI
#'
#' @inheritParams shared-params
#' @returns A [gt::gt_output()] that handles updates from external inputs.
#' @keywords internal
mod_gtBidirectional_UI <- function(id) {
  ns <- NS(id)
  htmltools::tagList(
    htmlDependency_Stylesheet("gt.css"),
    gt::gt_output(ns("table"))
  )
}

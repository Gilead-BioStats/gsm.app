#' Participant metric summary card
#'
#' @inheritParams shared-params
#'
#' @return A [bslib::card()] with either a placeholder, or a clickable list of
#'   available metric data for this participant.
#' @keywords internal
mod_ParticipantMetricSummary_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    "Metric Summary",
    uiOutput(ns("metric_list"))
  )
}

#' Participant metric summary card
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with either a placeholder, or a clickable list of
#'   available metric data for this participant.
#' @keywords internal
mod_ParticipantMetricSummary_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    "Metric Summary",
    shinycssloaders::withSpinner(
      uiOutput(ns("metric_list")),
      type = 7,
      id = ns("spinner")
    ),
    id = ns("card")
  )
}

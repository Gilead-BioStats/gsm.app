#' Participant domain summary card
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with either a placeholder, or a clickable list of
#'   available domain data for this participant.
#' @keywords internal
mod_ParticipantDomainSummary_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    "Domain Summary",
    shinycssloaders::withSpinner(
      uiOutput(ns("domain_list")),
      type = 7,
      id = ns("spinner")
    ),
    id = ns("card")
  )
}

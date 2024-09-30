#' Participant Domain Details Card UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with either a placeholder, or a
#'   [DT::DTOutput()] table.
#' @keywords internal
mod_ParticipantDomain_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    tagTitle = textOutput(ns("title"), inline = TRUE),
    # Server chooses between placeholder card & DT table.
    uiOutput(ns("details")),
    id = ns("details-card")
  )
}

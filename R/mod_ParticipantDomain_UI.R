#' Participant Domain Details Card UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with either a placeholder, or a
#'   [gt::gt_output()] table.
#' @keywords internal
mod_ParticipantDomain_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    tagTitle = textOutput(ns("title"), inline = TRUE),
    mod_gtBidirectional_UI(ns("gt")),
    id = ns("card")
  )
}

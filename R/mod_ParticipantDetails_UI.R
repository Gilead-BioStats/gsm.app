#' Participant Details UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] with participant metadata, available
#'   metrics for this participant, and participant domain details.
#' @keywords internal
mod_ParticipantDetails_UI <- function(id) {
  ns <- NS(id)
  bslib::layout_columns(
    col_widths = c(6, 6, 12),
    shinycssloaders::withSpinner(
      uiOutput(ns("metadata")),
      type = 7,
      id = ns("metadata-spinner")
    ),
    mod_ParticipantDomainSummary_UI(ns("domain_summary")),
    mod_ParticipantDomain_UI(ns("domain"))
  )
}

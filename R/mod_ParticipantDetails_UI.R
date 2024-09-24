#' Participant Details UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_ParticipantDetails_UI <- function(id) {
  ns <- NS(id)
  ui <- bslib::layout_columns(
    col_widths = c(6, 6, 12),
    uiOutput(ns("metadata")),
    mod_ParticipantMetricSummary_UI(ns("metric_summary")),
    mod_ParticipantDomain_UI(ns("domain"))
  )
  return(ui)
}

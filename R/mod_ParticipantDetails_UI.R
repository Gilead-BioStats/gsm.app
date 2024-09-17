#' Participant Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_ParticipantDetails_UI <- function(id) {
  ns <- NS(id)
  ui <- tagList(
    fluidRow(
      column(
        width = 6,
        uiOutput(ns("metadata"))
      ),
      column(
        width = 6,
        mod_ParticipantMetricSummary_UI(ns("metric_summary"))
      )
    ),
    fluidRow(
      column(
        width = 12,
        mod_ParticipantDomain_UI(ns("domain"))
      )
    )
  )
  return(ui)
}

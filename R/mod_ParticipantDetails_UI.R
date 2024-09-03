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
        verbatimTextOutput(ns("metric_data"), TRUE)
        # mod_DataTableCard_UI(ns("metric_data"))
      )
    )
  )
  return(ui)
}

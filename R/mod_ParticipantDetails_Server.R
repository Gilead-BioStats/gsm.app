#' Participant Details server
#'
#' Update Participant Details when the selected participant changes.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the ids of rows selected in the table
#'   (currently unused but implemented as a proof-of-concept for future
#'   extensions).
#' @keywords internal
mod_ParticipantDetails_Server <- function(
  id,
  fnFetchParticipantData,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    # Reactives ----
    rctv_lParticipantData <- reactive({
      if (
        !length(rctv_strSubjectID()) ||
          rctv_strSubjectID() == "None" ||
          rctv_strSubjectID() == ""
      ) {
        return(NULL)
      }
      withProgress(
        message = "Loading participant data",
        fnFetchParticipantData(rctv_strSubjectID())
      )
    })
    rctv_lParticipantMetadata <- reactive({
      if (length(rctv_lParticipantData())) {
        rctv_lParticipantData()$metadata
      }
    })
    rctv_lParticipantMetricData <- reactive({
      if (length(rctv_lParticipantData())) {
        rctv_lParticipantData()$metric_data
      }
    })
    rctv_strSelectedMetric <- mod_ParticipantMetricSummary_Server(
      "metric_summary",
      rctv_lParticipantMetricData
    )

    # Output ----
    output$metadata <- renderUI({
      out_ParticipantMetadata(rctv_lParticipantMetadata())
    })

    rctv_intSelectedRows <- mod_ParticipantDomain_Server(
      "domain",
      rctv_lParticipantMetricData,
      rctv_strSelectedMetric
    )
    return(rctv_intSelectedRows)
  })
}

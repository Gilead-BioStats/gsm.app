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
  fnFetchData,
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
      domains <- c(
        "AdverseEvents",
        "DataEntry",
        "Enrollment",
        "Lab",
        "ProtocolDeviations",
        "Queries",
        "StudyCompletion",
        "Subject",
        "TreatmentCompletion"
      )
      SubjectID <- rctv_strSubjectID()
      withProgress(
        message = "Loading participant data",
        {
          l_dfs <- purrr::map(domains, function(this_domain) {
            fnFetchData(this_domain, strSubjectID = SubjectID)
          })
          names(l_dfs) <- domains
          l_dfs
        }
      )
    })
    rctv_lParticipantMetadata <- reactive({
      if (length(rctv_lParticipantData())) {
        as.list(rctv_lParticipantData()$Subject)
      }
    })
    rctv_lParticipantMetricData <- reactive({
      lParticipantData <- rctv_lParticipantData()
      if (length(lParticipantData)) {
        lParticipantData$Subject <- NULL
        return(lParticipantData)
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
      rctv_strSelectedMetric,
      rctv_strSubjectID
    )
    return(rctv_intSelectedRows)
  })
}

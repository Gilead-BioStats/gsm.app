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
  chrDomains = c(
    "AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP",
    "SUBJ", "DATACHG", "DATAENT", "QUERY"
  ),
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
      SubjectID <- rctv_strSubjectID()
      withProgress(
        message = "Loading participant data",
        {
          lDomains <- purrr::map(chrDomains, function(this_domain) {
            fnFetchData(this_domain, strSubjectID = SubjectID)
          })
          names(lDomains) <- chrDomains
          applyPrettyDomainNames(lDomains)
        }
      )
    })
    rctv_lParticipantMetadata <- reactive({
      if (length(rctv_lParticipantData())) {
        as.list(rctv_lParticipantData()$Subject_Metadata)
      }
    })
    rctv_lParticipantDomainData <- reactive({
      lParticipantData <- rctv_lParticipantData()
      if (length(lParticipantData)) {
        lParticipantData$Subject_Metadata <- NULL
        return(lParticipantData)
      }
    })
    rctv_strSelectedDomain <- mod_ParticipantDomainSummary_Server(
      "domain_summary",
      rctv_lParticipantDomainData
    )

    # Output ----
    output$metadata <- renderUI({
      out_ParticipantMetadata(rctv_lParticipantMetadata())
    })

    rctv_intSelectedRows <- mod_ParticipantDomain_Server(
      "domain",
      rctv_lParticipantDomainData,
      rctv_strSelectedDomain,
      rctv_strSubjectID
    )
    return(rctv_intSelectedRows)
  })
}

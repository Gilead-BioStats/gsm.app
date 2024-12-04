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
          l_dfs <- purrr::map(chrDomains, function(this_domain) {
            df <- fnFetchData(this_domain, strSubjectID = SubjectID)
            clean_colnames <- gsm::MakeParamLabelsList(
              colnames(df),
              chrFieldNames
            )
            colnames(df) <- unname(unlist(clean_colnames[colnames(df)]))
            df
          })
          names(l_dfs) <- chrDomains
          # Make the names pretty.
          domainLabels <- sort(unlist(gsm::MakeParamLabelsList(
            chrDomains,
            lParamLabels = chrDomainLabels
          )))
          domainNames <- names(domainLabels)
          l_dfs <- l_dfs[domainNames]
          names(l_dfs) <- gsub(" ", "_", unname(domainLabels))
          l_dfs
        }
      )
    })
    rctv_lParticipantMetadata <- reactive({
      if (length(rctv_lParticipantData())) {
        as.list(rctv_lParticipantData()$SUBJ)
      }
    })
    rctv_lParticipantDomainData <- reactive({
      lParticipantData <- rctv_lParticipantData()
      if (length(lParticipantData)) {
        lParticipantData$SUBJ <- NULL
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

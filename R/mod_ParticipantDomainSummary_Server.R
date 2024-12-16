#' Participant Domain Summary server
#'
#' @inheritParams shared-params
#' @returns A string identifying the selected summary as a [shiny::reactive()].
#' @keywords internal
mod_ParticipantDomainSummary_Server <- function(
  id,
  rctv_lParticipantDomainData
) {
  moduleServer(id, function(input, output, session) {
    rctv_chrParticipantDomainDataNames <- reactive({
      names(rctv_lParticipantDomainData())
    })

    output$domain_list <- renderUI({
      lParticipantDomainData <- rctv_lParticipantDomainData()
      if (!length(lParticipantDomainData)) {
        return(out_Placeholder("participant"))
      }
      domainNames <- rctv_chrParticipantDomainDataNames()
      mod_ActionList_UI(
        session$ns("domain_list_choices"),
        domainNames,
        domainNames,
        purrr::map_int(lParticipantDomainData, NROW)
      )
    })
    rctv_strSelectedDomain <- mod_ActionList_Server(
      "domain_list_choices",
      rctv_chrParticipantDomainDataNames
    )
    return(rctv_strSelectedDomain)
  })
}

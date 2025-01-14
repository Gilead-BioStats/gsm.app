mod_ParticipantDomainSummary_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    "Domain Summary",
    uiOutput(ns("domain_list")),
    id = ns("card")
  )
}

mod_ParticipantDomainSummary_Server <- function(
    id,
    l_rctvParticipantDomainData
) {
  moduleServer(id, function(input, output, session) {
    output$domain_list <- shiny::renderUI({
      out_MetadataList(
        chrLabels = names(l_rctvParticipantDomainData),
        chrValues = purrr::map_int(l_rctvParticipantDomainData, function(rctv_dfDomain) {
          NROW(rctv_dfDomain())
        })
      )
    })
  })
}

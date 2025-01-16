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
  rctv_strDomainID,
  l_rctvParticipantDomainData
) {
  moduleServer(id, function(input, output, session) {
    chrDomainNames <- names(l_rctvParticipantDomainData)
    output$domain_list <- shiny::renderUI({
      mod_ActionList_UI(
        session$ns("domain_list_choices"),
        chrDomainNames,
        chrDomainNames,
        purrr::map_int(l_rctvParticipantDomainData, function(rctv_dfDomain) {
          NROW(rctv_dfDomain())
        })
      )
    })
    rctv_strSelectedDomain <- mod_ActionList_Server(
      "domain_list_choices",
      chrDomainNames
    )
    shiny::observe({
      strSelectedDomain <- rctv_strSelectedDomain()
      if (!is.null(strSelectedDomain)) {
        rctv_strDomainID(strSelectedDomain)
      }
    })
  })
}

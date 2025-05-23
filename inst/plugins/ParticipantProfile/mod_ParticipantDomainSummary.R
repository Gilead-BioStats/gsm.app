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
  l_rctvParticipantDomainData,
  l_rctvStudyDomainData
) {
  moduleServer(id, function(input, output, session) {
    chrDomainNames <- names(l_rctvParticipantDomainData)
    output$domain_list <- renderUI({
      mod_ActionList_UI(
        session$ns("domain_list_choices"),
        chrDomainNames,
        chrDomainNames,
        purrr::map2_chr(
          l_rctvParticipantDomainData,
          l_rctvStudyDomainData,
          function(rctv_dfDomain, rctv_dfDomain_Study) {
            unclass(glue::glue(
              "{NROW(rctv_dfDomain())} ({NROW(rctv_dfDomain_Study())})"
            ))
          }
        )
      )
    })
    rctv_strSelectedDomain <- mod_ActionList_Server(
      "domain_list_choices",
      chrDomainNames
    )
    observe({
      strSelectedDomain <- rctv_strSelectedDomain()
      if (!is.null(strSelectedDomain)) {
        rctv_strDomainID(strSelectedDomain)
      }
    })
  })
}

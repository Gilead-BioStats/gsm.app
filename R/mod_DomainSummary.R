#' Domain Summary UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a [mod_ActionList_UI()] showing domains and
#'   row counts.
#' @keywords internal
mod_DomainSummary_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    "Domain Summary",
    uiOutput(ns("domain_list")),
    id = ns("card")
  )
}

#' Dynamically Generate the Domain Summary
#'
#' @inheritParams shared-params
#' @keywords internal
mod_DomainSummary_Server <- function(
  id,
  rctv_strDomainID,
  l_rctvDomains
) {
  moduleServer(id, function(input, output, session) {
    chrDomainNames <- names(l_rctvDomains)
    chrDomainLabels <- unname(unlist(
      gsm::MakeParamLabelsList(chrDomainNames, chrDomainLabels)
    ))
    output$domain_list <- renderUI({
      mod_ActionList_UI(
        session$ns("domain_list_choices"),
        chrDomainNames,
        chrDomainLabels,
        purrr::map_int(l_rctvDomains, function(rctv_dfDomain) {
          NROW(rctv_dfDomain())
        })
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

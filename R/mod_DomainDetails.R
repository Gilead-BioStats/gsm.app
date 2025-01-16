#' Domain Details UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::navset_underline()] with a tab for each available domain.
#' @keywords internal
mod_DomainDetails_UI <- function(
  id,
  chrDomains = c(
    "AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP",
    "SUBJ", "DATACHG", "DATAENT", "QUERY"
  )
) {
  ns <- NS(id)
  bslib::navset_underline(
    id = ns("selected_tab"),
    !!!purrr::map(chrDomains, function(domain) {
      mod_DomainData_UI(ns(domain), domain)
    })
  )
}

#' Domain Details server
#'
#' Update Domain Details when the selected participant changes.
#'
#' @inheritParams shared-params
#' @keywords internal
mod_DomainDetails_Server <- function(
    id,
    l_rctvDomains,
    rctv_strDomainID
) {
  moduleServer(id, function(input, output, session) {
    shiny::observe({
      mod_DomainData_Server(
        id = input$selected_tab,
        l_rctvDomains[[input$selected_tab]]
      )
    })
    shiny::observe({
      input_val <- input$selected_tab
      if (!is.null(input_val) && input_val != "") {
        rctv_strDomainID(input_val)
      }
    }) %>%
      shiny::bindEvent(
        input$selected_tab,
        ignoreInit = TRUE
      )
    shiny::observe({
      input_val <- null_for_none(rctv_strDomainID())
      if (!is.null(input_val) && input_val != input$selected_tab) {
        bslib::nav_select("selected_tab", input_val, session = session)
      }
    })
  })
}

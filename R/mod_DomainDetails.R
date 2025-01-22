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
    # Initialize domains.
    observe({
      purrr::walk(
        names(l_rctvDomains),
        function(this_domain) {
          mod_DomainData_Server(
            id = this_domain,
            l_rctvDomains[[this_domain]]
          )
        }
      )
    }) %>%
      bindEvent(
        input$selected_tab,
        ignoreNULL = FALSE,
        ignoreInit = FALSE,
        once = TRUE
      )
    observe({
      mod_DomainData_Server(
        id = input$selected_tab,
        l_rctvDomains[[input$selected_tab]]
      )
    })
    observe({
      input_val <- input$selected_tab
      if (!is.null(input_val) && input_val != "") {
        rctv_strDomainID(input_val)
      }
    }) %>%
      bindEvent(
        input$selected_tab,
        ignoreInit = TRUE
      )
    observe({
      input_val <- NullifyEmpty(rctv_strDomainID())
      if (!is.null(input_val) && input_val != input$selected_tab) {
        bslib::nav_select("selected_tab", input_val, session = session)
      }
    })
  })
}

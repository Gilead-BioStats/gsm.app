#' Domain Details UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::navset_underline()] with a tab for each available domain.
#' @keywords internal
mod_DomainDetails_UI <- function(
  id,
  chrDomains = c(
    AE = "Adverse Events",
    DATACHG = "Data Changes",
    DATAENT = "Data Entry",
    ENROLL = "Enrollment",
    LB = "Lab",
    PD = "Protocol Deviations",
    QUERY = "Queries",
    STUDCOMP = "Study Completion",
    SUBJ = "Subject Metadata",
    SDRGCOMP = "Treatment Completion"
  )
) {
  ns <- NS(id)
  domain_tabs <- purrr::imap(chrDomains, function(strDomainLabel, strDomainID) {
    mod_DomainData_UI(ns(strDomainID), strDomainLabel, strDomainID)
  }) %>%
    unname()
  bslib::layout_columns(
    col_widths = c(3, 9),
    mod_DomainSummary_UI(ns("counts")),
    bslib::navset_underline(
      id = ns("selected_tab"),
      !!!domain_tabs
    )
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
  l_rctvDomains_Selection,
  l_rctvDomainHashes,
  rctv_strDomainID,
  rctv_intDomainCounts,
  rctv_strGroupLevel,
  chrDomains
) {
  moduleServer(id, function(input, output, session) {
    observe({
      req(input$selected_tab)
      mod_DomainData_Server(
        id = input$selected_tab,
        rctv_dfDomain = l_rctvDomains_Selection[[input$selected_tab]],
        rctv_strDomainHash = l_rctvDomainHashes[[input$selected_tab]],
        rctv_strGroupLevel = rctv_strGroupLevel
      )
    })
    observe({
      req(rctv_strDomainID())
      mod_DomainSummary_Server(
        "counts",
        rctv_strDomainID,
        rctv_intDomainCounts,
        chrDomains
      )
    })
    observe({
      req(rctv_strDomainID())
      req(input$selected_tab)
      input_val <- input$selected_tab
      if (!is.null(input_val) && input_val != "") {
        rctv_strDomainID(input_val)
      }
    }) %>%
      bindEvent(
        input$selected_tab,
        ignoreInit = TRUE
      )
    # tested in shinytest2
    observe({
      req(rctv_strDomainID())
      req(input$selected_tab)
      input_val <- NullifyEmpty(rctv_strDomainID())
      if (!is.null(input_val) && input_val != input$selected_tab) {
        bslib::nav_select("selected_tab", input_val, session = session)
      }
    })
    # end of "untested"
  })
}

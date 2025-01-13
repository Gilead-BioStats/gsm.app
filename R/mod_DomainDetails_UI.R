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

#' Domain Data Tab UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::nav_panel()] with either a placeholder, or a
#'   [gt::gt_output()] table.
#' @keywords internal
mod_DomainData_UI <- function(id, strDomain) {
  ns <- NS(id)
  label <- unname(unlist(gsm::MakeParamLabelsList(strDomain, chrDomainLabels)))
  bslib::nav_panel(
    title = label,
    value = strDomain,
    mod_gtBidirectional_UI(ns("gt"))
  )
}

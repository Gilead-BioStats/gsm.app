#' Group Overview Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a [mod_RAGPillSet_UI()] and a corresponding
#'   [Widget_GroupOverviewOutput()].
#' @keywords internal
mod_GroupOverview_UI <- function(id, dfResults) {
  ns <- NS(id)
  bslib::card(
    full_screen = TRUE,
    bslib::card_body(
      mod_RAGPillSet_UI(
        ns("kri_counts"),
        intRed = sum(abs(dfResults$Flag) == 2, na.rm = TRUE),
        intAmber = sum(abs(dfResults$Flag) == 1, na.rm = TRUE)
      ),
      Widget_GroupOverviewOutput(ns("group_overview"))
    ),
    id = id
  )
}

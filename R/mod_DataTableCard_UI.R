#' Card with DTOutput
#'
#' @inheritParams shared-params
#'
#' @return A [bslib::card()] with either a placeholder, or a [DT::DTOutput()]
#'   table.
#' @keywords internal
mod_DataTableCard_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    full_screen = TRUE,
    bslib::card_title(textOutput(ns("title"), inline = TRUE)),
    DT::DTOutput(ns("table"), fill = FALSE)
  )
}

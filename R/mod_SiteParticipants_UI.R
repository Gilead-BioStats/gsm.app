#' Site Participants UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a placeholder or a clickable table of site
#'   participants.
#' @keywords internal
mod_SiteParticipants_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    bslib::card_header(
      bslib::card_title(shiny::textOutput(ns("title"), inline = TRUE)),
      shiny::uiOutput(ns("subtitle"))
    ),
    mod_gtBidirectional_UI(ns("gt")),
    full_screen = TRUE,
    id = ns("gt_card")
  )
}

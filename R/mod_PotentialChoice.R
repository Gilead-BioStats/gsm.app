#' Potential Choice Select Input UI
#'
#' Renders a select input only if there is more than one choice.
#'
#' @inheritParams shared-params
#' @returns An [input_NavbarExtra()] element or `NULL`.
#' @keywords internal
mod_PotentialChoice_UI <- function(id, chrChoices, strLabel) {
  if (length(chrChoices) > 1) {
    ns <- NS(id)
    input_NavbarExtra(
      ns("select"),
      chrChoices = chrChoices,
      strLabel = strLabel
    )
  }
}

#' Potential Choice Select Input Server
#'
#' Manages the state of a select input that may or may not be rendered in the
#' UI.
#'
#' @inheritParams shared-params
#' @returns No returns, but this server creates [shiny::observe()] elements to
#'   keep inputs in sync.
#' @keywords internal
mod_PotentialChoice_Server <- function(id, chrChoices, rctv_strSelection) {
  moduleServer(id, function(input, output, session) {
    if (length(chrChoices) > 1) {
      observe(rctv_strSelection(input$select))

      srvr_SyncVirtualSelectInput(
        "select",
        rctv_strSelected = rctv_strSelection,
        session = session
      )
    } else if (length(chrChoices) == 1) {
      rctv_strSelection(chrChoices[[1]])
    }
  })
}

#' Cascading Select Input UI
#'
#' @inheritParams shared-params
#' @param strLabel `character` The initial label for the select input.
#'
#' @returns A `bslib::nav_item()`.
#' @keywords internal
mod_CascadingSelect_UI <- function(id, strLabel, chrChoices = "All") {
  ns <- NS(id)
  input_NavbarExtra(
    ns("select"),
    chrChoices = chrChoices,
    strLabel = strLabel
  )
}

#' Cascading Select Input Server
#'
#' @inheritParams shared-params
#' @param rctv_strDependent `reactive` The reactive string value that this
#'   module's selection depends on.
#' @param l_chrChoices `list` A named list where names correspond to values from
#'   `rctv_strDependent` and values are the character vectors of choices.
#' @param lglUpdateLabel `logical` A flag indicating whether to update the
#'   select input's label with the value of `rctv_strDependent`.
#'
#' @returns The server function does not return a value.
#' @keywords internal
mod_CascadingSelect_Server <- function(
  id,
  rctv_strDependent,
  l_chrChoices,
  rctv_strSelection,
  lglUpdateLabel = FALSE
) {
  moduleServer(id, function(input, output, session) {
    l_rctvState <- mod_SelectState_Server(
      "state",
      rctv_strDependent,
      l_chrChoices,
      lglUpdateLabel,
      reactive(input$select)
    )

    # Sync the input with this module's internally calculated state.
    srvr_SyncVirtualSelectInput(
      "select",
      rctv_chrChoices = l_rctvState$rctv_chrChoices,
      rctv_strLabel = l_rctvState$rctv_strLabel,
      rctv_strSelected = l_rctvState$rctv_strSelected,
      session = session
    )

    observe(rctv_strSelection(l_rctvState$rctv_strSelected()))
    observe(rctv_strSelection(input$select))

    # Sync the input when state is set externally.
    srvr_SyncVirtualSelectInput(
      "select",
      rctv_strSelected = rctv_strSelection,
      session = session
    )
  })
}

#' Cascading Select Input UI
#'
#' @param id `character` The module ID.
#' @param strLabel `character` The initial label for the select input.
#' @param chrChoices `character` The initial set of choices for the select
#'   input.
#'
#' @returns A `bslib::nav_item()`
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
#' @param id `character` The module ID.
#' @param rctv_strDependent `reactive` The reactive string value that this
#'   module's selection depends on.
#' @param l_chrChoices `list` A named list where names correspond to values from
#'   `rctv_strDependent` and values are the character vectors of choices.
#' @param rctv_strSelection `reactiveVal` A `reactiveVal` from the parent scope
#'   that this module will update with its selection.
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

    srvr_SyncVirtualSelectInput(
      "select",
      rctv_chrChoices = l_rctvState$rctv_chrChoices,
      rctv_strLabel = l_rctvState$rctv_strLabel,
      rctv_strSelected = l_rctvState$rctv_strSelected,
      session = session
    )

    observe(rctv_strSelection(l_rctvState$rctv_strSelected()))
    observe(rctv_strSelection(input$select))

    srvr_SyncVirtualSelectInput(
      "select",
      rctv_strSelected = rctv_strSelection,
      session = session
    )
  })
}

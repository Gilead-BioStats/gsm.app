#' Inline virtual select input
#'
#' @inheritParams shared-params
#' @param strLabel `character` The initial label for the select input.
#' @param chrSelected `character` The initially selected value (or multiple
#'   values if multiple = TRUE). If not specified then defaults to the first
#'   value for single-select lists and no values for multiple select lists.
#' @param ... Additional parameters passed on to
#'   [shinyWidgets::virtualSelectInput()].
#' @returns A [htmltools::span()] element containing necessary elements for an
#'   inline [shinyWidgets::virtualSelectInput()].
#' @keywords internal
mod_InlineSelect_UI <- function(
  id,
  strLabel = NULL,
  chrChoices = "",
  chrSelected = NULL,
  ...
) {
  ns <- NS(id)
  span(
    id = id,
    class = "inline-select",
    htmlDependency_Stylesheet("inlineSelect.css"),
    shinyWidgets::virtualSelectInput(
      inputId = ns("select"),
      label = strLabel,
      choices = chrChoices,
      selected = chrSelected,
      inline = TRUE,
      ...
    )
  )
}

#' Inline virtual select input server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_InlineSelect_Server <- function(
  id,
  rctv_chrChoices = NULL,
  rctv_strLabel = NULL,
  rctv_strSelected = NULL,
  rctv_lglDisable = NULL,
  rctv_chrDisabledChoices = NULL,
  rctv_lglOpen = NULL
) {
  moduleServer(id, function(input, output, session) {
    srvr_SyncVirtualSelectInput(
      "select",
      session = session,
      rctv_chrChoices = rctv_chrChoices,
      rctv_strLabel = rctv_strLabel,
      rctv_strSelected = rctv_strSelected,
      rctv_lglDisable = rctv_lglDisable,
      rctv_chrDisabledChoices = rctv_chrDisabledChoices,
      rctv_lglOpen = rctv_lglOpen
    )
    return(reactive(input$select))
  })
}

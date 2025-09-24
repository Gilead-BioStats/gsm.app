#' Navigation Select Input UI
#'
#' @inheritParams shared-params
#' @param strLabel `character` The initial label for the select input.
#'
#' @returns A [bslib::nav_item()] with a formatted
#'   [shinyWidgets::virtualSelectInput()].
#' @keywords internal
mod_NavSelect_UI <- function(id, chrChoices, strLabel = NULL) {
  ns <- NS(id)
  bslib::nav_item(
    id = id,
    class = "inline-select",
    htmlDependency_Stylesheet("inlineSelect.css"),
    shinyWidgets::virtualSelectInput(
      inputId = ns("select"),
      label = strLabel,
      choices = chrChoices,
      inline = TRUE
    )
  )
}

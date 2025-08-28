#' A pass-through for a type of inline select
#'
#' @inheritParams shared-params
#' @returns A [htmltools::span()] element containing necessary elements for an
#'   inline [shinyWidgets::virtualSelectInput()].
#' @keywords internal
mod_SelectDataCategory_UI <- function(id) {
  ns <- NS(id)
  mod_InlineSelect_UI(id = ns("select"))
}

#' Choose categories and update the dropdown
#'
#' @inheritParams shared-params
#' @keywords internal
mod_SelectDataCategory_Server <- function(
  id,
  rctv_dfDomain
) {
  moduleServer(id, function(input, output, session) {
    # Update these as a reactiveVal to make sure they don't change when new data
    # is loaded but nothing really changes.
    rctv_chrCategoricalFields <- reactiveVal()
    observe({
      req(NROW(rctv_dfDomain()) > 0)
      chrCategoricalFields <- FindCategoricalFieldNames(
        rctv_dfDomain()
      )
      chrCategoricalFields <- rlang::set_names(
        chrCategoricalFields,
        MakeParamLabelsChr(chrCategoricalFields, chrFieldNames)
      )
      current_fields <- rctv_chrCategoricalFields()
      if (!setequal(chrCategoricalFields, current_fields)) {
        rctv_chrCategoricalFields(chrCategoricalFields)
      }
    })

    rctv_strSelected <- mod_InlineSelect_Server(
      "select",
      rctv_chrChoices = rctv_chrCategoricalFields,
      rctv_strSelected = reactive(rctv_chrCategoricalFields()[[1]])
    )

    return(rctv_strSelected)
  })
}

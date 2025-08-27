mod_SelectDataCategory_UI <- function(id) {
  ns <- NS(id)
  span(
    id = id,
    class = "inline-select",
    htmlDependency_Stylesheet("inlineSelect.css"),
    shinyWidgets::virtualSelectInput(
      ns("select"),
      NULL,
      "",
      inline = TRUE
    )
  )
}

mod_SelectDataCategory_Server <- function(
  id,
  rctv_dfDomain_Combined
) {
  moduleServer(id, function(input, output, session) {
    # Update these as a reactiveVal to make sure they don't change when new data
    # is loaded but nothing really changes.
    rctv_chrCategoricalFields <- reactiveVal()
    observe({
      req(NROW(rctv_dfDomain_Combined()) > 0)
      chrCategoricalFields <- FindCategoricalFieldNames(
        rctv_dfDomain_Combined()
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

    srvr_SyncVirtualSelectInput(
      "select",
      session = session,
      rctv_chrChoices = rctv_chrCategoricalFields,
      rctv_strSelected = reactive({rctv_chrCategoricalFields()[[1]]})
    )

    return(reactive(input$select))
  })
}

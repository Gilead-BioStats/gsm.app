mod_ChartTitleSelect_UI <- function(id) {
  ns <- NS(id)
  div(
    id = id,
    class = "inline-select",
    htmlDependency_Stylesheet("inlineSelect.css"),
    shinyWidgets::virtualSelectInput(
      ns("select"),
      NULL,
      "",
      inline = TRUE
    ),
    mod_DynamicLabelKey_UI(ns("key"))
  )
}

mod_ChartTitleSelect_Server <- function(id, l_rctvLabels, rctv_chrChoices) {
  moduleServer(id, function(input, output, session) {
    # Update the available choices whenever the list of choices changes.
    srvr_SyncVirtualSelectInput(
      "select",
      session = session,
      rctv_chrChoices = rctv_chrChoices,
      rctv_strSelected = reactive({rctv_chrChoices()[[1]]})
    )
    mod_DynamicLabelKey_Server("key", l_rctvLabels = l_rctvLabels)
    return(reactive({
      input$select
    }))
  })
}

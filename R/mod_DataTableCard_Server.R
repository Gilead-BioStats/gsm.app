#' DataTable Card Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_DataTableCard_Server <- function(id, rctv_lData, rctv_strName) {
  moduleServer(id, function(input, output, session) {
    output$title <- renderText({
      title <- gsm::MakeParamLabelsList(rctv_strName())
      if (length(title)) {
        return(title[[1]])
      }
    })
    rctv_selectedTable <- reactive({
      if (length(rctv_strName()) && length(rctv_lData())) {
        rctv_lData()[[rctv_strName()]]
      }
    })
    output$table <- DT::renderDT({
      if (length(colnames(rctv_selectedTable()))) {
        df <- rctv_selectedTable()
        colnames(df) <- gsm::MakeParamLabelsList(colnames(df))
        df
      }
    })
    rctv_intSelectedRows <- reactive(
      input$table_rows_selected
    )
    return(rctv_intSelectedRows)
  })
}

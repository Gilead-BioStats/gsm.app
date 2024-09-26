#' Participant Domain Server
#'
#' Display a specific (named) table, or a placeholder.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the index(es) of any rows selected by the
#'   user.
#' @keywords internal
mod_ParticipantDomain_Server = function(id, rctv_lData, rctv_strName) {
  moduleServer(id, function(input, output, session) {
    output$details <- renderUI({
      if (!length(rctv_lData())) {
        return(out_Placeholder("participant and a domain"))
      }
      if (!length(rctv_strName())) {
        return(out_Placeholder("domain")) # Covered but pkg-level says it isn't
      }
      return(DT::DTOutput(session$ns("table"), fill = FALSE))
    })
    output$title <- renderText({
      title <- gsm::MakeParamLabelsList(rctv_strName())
      if (length(title)) {
        return(title[[1]])
      } else {
        return("Participant Domain")
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
    rctv_intSelectedRows <- reactive(input$table_rows_selected)
    return(rctv_intSelectedRows)
  })
}

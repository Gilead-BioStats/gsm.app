#' Participant Domain Server
#'
#' Display a specific (named) table, or a placeholder.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the index(es) of any rows selected by the
#'   user.
#' @keywords internal
mod_ParticipantDomain_Server <- function(id, rctv_lData, rctv_strName) {
  moduleServer(id, function(input, output, session) {
    valid_lData <- reactive({
      length(rctv_lData()) > 0
    })
    valid_selection <- reactive({
      valid_lData() &&
        length(rctv_strName()) &&
        rctv_strName() %in% names(rctv_lData())
    })
    output$details <- renderUI({
      if (valid_selection()) {
        return(DT::DTOutput(session$ns("table"), fill = FALSE))
      }
      return(out_Placeholder(
        c(
          if (!valid_lData()) "participant",
          "domain"
        )
      ))
    })
    output$title <- renderText({
      if (!valid_selection()) {
        return("Participant Domain")
      }
      title <- gsm::MakeParamLabelsList(rctv_strName())
      return(title[[1]])
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

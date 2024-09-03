mod_DataTableCard_Server <- function(id, rctv_strTitle, rctv_dfData) {
  moduleServer(id, function(input, output, session) {
    output$title <- renderText({rctv_strTitle()})
    output$table <- DT::renderDT({rctv_dfData()})
  })
}

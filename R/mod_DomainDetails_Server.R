#' Domain Details server
#'
#' Update Domain Details when the selected participant changes.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the ids of rows selected in the table
#'   (currently unused but implemented as a proof-of-concept for future
#'   extensions).
#' @keywords internal
mod_DomainDetails_Server <- function(
  id,
  l_rctvDomains
) {
  moduleServer(id, function(input, output, session) {
    shiny::observe({
      mod_DomainData_Server(
        id = input$selected_tab,
        l_rctvDomains[[input$selected_tab]]
      )
    })
    return(shiny::reactive(input$selected_tab))
  })
}

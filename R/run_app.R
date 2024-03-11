#' Run App
#'
#' @param snapshot A `list` object containing the data for a snapshot. It funnels into every function of the application.
#'
#' @export

run_app <- function(snapshot = gsmApp::snapshot) {
  shinyApp(
    ui = gsmApp::ui(),
    server = function(input, output, session) {
      gsmApp::server(input, output, session, snapshot)
    }
  )
}

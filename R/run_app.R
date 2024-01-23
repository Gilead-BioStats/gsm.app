#' Run App
#'
#' @export

run_app <- function(snapshot = gsmApp::snapshot) {
    shiny::shinyApp(
        ui = ui(snapshot),
        server = function(input, output, session) {
            server(input, output, session, snapshot)
        }
    )
}

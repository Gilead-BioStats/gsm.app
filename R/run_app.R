#' Run App
#'
#' @inheritParams shared-params
#' @export

run_app <- function(snapshot = NULL) {
    if (is.null(snapshot)) {
        snapshot <- gsmApp::read_snapshot()
    }

    shinyApp(
        ui = ui(),
        server = function(input, output, session) {
            gsmApp::server(input, output, session, snapshot)
        }
    )
}

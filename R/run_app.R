#' Run App
#'
#' @import shiny
#' @import shinyjs
#' @import bslib
#' @import dplyr
#' @import purrr
#' @import stringr
#'
#' @export

run_app <- function(snapshot = gsmApp::snapshot) {
    shinyApp(
        ui = ui(),
        server = function(input, output, session) {
            server(input, output, session, snapshot)
        }
    )
}

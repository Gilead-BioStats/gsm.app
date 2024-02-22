#' Run App
#'
#' @param snapshot A `list` object containing the data for a snapshot. It funnels into every function of the application.
#'
#' @import shiny
#' @importFrom shinyjs hide hidden show useShinyjs
#' @import bslib
#' @import dplyr
#' @import purrr
#' @import stringr
#' @import tidyr
#' @importFrom utils read.csv
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

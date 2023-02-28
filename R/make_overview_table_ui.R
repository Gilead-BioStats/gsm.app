#' Define a Shiny UI function given an assessment
#'
#' @param assessment `list` assessment specification
#'
#' @importFrom DT DTOutput
#' @import shiny
#'
#' @return `function` Shiny UI function
#'
#' @export

make_overview_table_ui <- function(workflows) {
    overview_table_ui <- function(id) {
        ns <- shiny::NS(id)

        shiny::sidebarLayout(
            shiny::sidebarPanel(
                width = 0
            ),
            shiny::mainPanel(
                DT::DTOutput(ns('overview_table')),
                width = 12
            )
        )
    }

    overview_table_ui
}

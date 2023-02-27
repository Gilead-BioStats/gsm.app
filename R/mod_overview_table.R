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

#' Define a Shiny server function given an assessment
#'
#' @param assessment `list` assessment specification
#'
#' @importFrom DT renderDT
#' @importFrom gsm Study_Assess Overview_Table
#' @import shiny
#'
#' @return `function` Shiny server function
#'
#' @export

overview_table_server <- function(input, output, session, params) {
    output$overview_table <- DT::renderDT({
        data <- params()$data
        mapping <- params()$settings
browser()
        # TODO: pull assessments from other modules
        assessment <- gsm::Study_Assess(
            lData = data,
            lMapping = mapping
            #bQuiet = FALSE
        )

        gsm::Overview_Table(assessment)
    })
}

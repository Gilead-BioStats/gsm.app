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

make_overview_table_server <- function(workflows) {
    overview_table_server <- function(input, output, session, params) {
        output$overview_table <- DT::renderDT({
            #req(workflows)
            data <- params()$data
            mapping <- params()$settings

            # TODO: pull assessments from other modules
            #assessment <- gsm::Study_Assess(
            #    lData = data,
            #    lMapping = mapping
            #    #bQuiet = FALSE
            #)
            # TODO: map workflows to module server output
            #assessment <- workflows %>%
            #    purrr::map(~.x$workflow$server) %>%
            #    rlang::set_names(names(workflows))

            #gsm::Overview_Table(
            #    workflows
            #)
        })
    }

    overview_table_server
}

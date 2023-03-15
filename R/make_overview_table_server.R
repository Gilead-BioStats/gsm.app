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
    overview_table_server <- function(input, output, session, params, module_outputs) {
        output$overview_table <- DT::renderDT({
            workflow_ids <- intersect(
                map_chr(workflows, ~.x$name),
                names(module_outputs)
            )

            cli::cli_alert_info('workflows: {workflow_ids}')

            assessment <- list()
            for (workflow_id in workflow_ids) {
                cli::cli_alert_info('running {workflow_id}')
                #req(module_outputs[[ workflow_id ]])
                result <- module_outputs[[ workflow_id ]]()
                assessment[[ workflow_id ]] <- result
            }

            gsm::Overview_Table(
                assessment
            )
        })
    }

    overview_table_server
}

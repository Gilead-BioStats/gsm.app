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
            workflow_ids <- map_chr(workflows, ~.x$name)
            cli::cli_alert_info('workflows: {workflow_ids}')
            cli::cli_alert_info('module_outputs: {names(module_outputs)}')

            data <- params()$data
            mapping <- params()$settings

            # TODO: figure out how to retrieve non-null module outputs
            active_workflows <- names(workflows) %>%
                map(~module_outputs[[ .x ]]) %>%
                keep(~!is.null(.x))
            cli::cli_alert_info('active workflows: {names(active_workflows)}')

            if (length(active_workflows)) {
                inactive_workflows <- setdiff(workflow_ids, names(active_workflows))
            } else {
                inactive_workflows <- workflow_ids
            }
            cli::cli_alert_info('inactive workflows: {inactive_workflows}')

            # TODO: pull assessments from other modules
            assessment <- active_workflows
            if (length(inactive_workflows)) {
                walk(inactive_workflows, function(workflow_id) {
                    workflow <- workflows[
                        map_chr(workflows, ~.x$name) == workflow_id
                    ][[1]]$workflow
                    assessment[[ workflow_id ]] <- gsm::RunWorkflow(
                        workflow,
                        data,
                        mapping
                    )
                    browser()
                })
            }
            # TODO: map workflows to module server output
            #assessment <- workflows %>%
            #    purrr::map(~.x$workflow$server) %>%
            #    rlang::set_names(names(workflows))
browser()
            gsm::Overview_Table(
                assessment
            )
        })
    }

    overview_table_server
}

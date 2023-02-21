#' Define a Shiny server function given an workflow
#'
#' @param workflow `list` workflow specification
#'
#' @importFrom DiagrammeR renderGrViz
#' @importFrom DT renderDT
#' @importFrom gsm RunWorkflow
#' @importFrom plotly config ggplotly renderPlotly
#' @importFrom purrr imap keep map_dbl
#' @importFrom shiny renderPlot
#'
#' @return `function` Shiny server function
#'
#' @export

make_workflow_server <- function(
    workflow,
    assess_parameters,
    method_thresholds
) {
    workflow_server <- function(input, output, session, params) {
        #observe_method(input, session)

        output$workflow_steps <- shiny::renderPrint({
            jsonlite::toJSON(
                workflow$steps,
                auto_unbox = TRUE,
                digits = 4,
                pretty = TRUE
            )
        })

        run_workflow <- reactive({
            data <- params()$data
            settings <- params()$settings

            assessment <- workflow$steps[[
                match(
                    'assess',
                    workflow$steps %>%
                        map_chr(~sub('^.*_', '', .x$name)) %>%
                        tolower()
                )
            ]]

            # TODO: allow for nonexistent assessment
            defaults <- assess_parameters[[ tolower(assessment$name) ]]

            params <- assessment$params %>%
                purrr::imap(function(param, key) {
                    default <- defaults[[ key ]]
                    value <- NULL

                    # TODO: helper functions for each input type
                    if (default$type == 'character') {
                        value = input[[ key ]]
                    } else if (default$type == 'numeric') {
                        if (length(default$default) > 1) {
                            value = names(input) %>%
                                keep(~grepl(key, .x)) %>%
                                map_dbl(~input[[ .x ]]) %>%
                                sort()
                        } else {
                            value = input[[ key ]]
                        }
                    }

                    value
                })

            workflow$steps[[ 
                match(
                    'assess',
                    workflow$steps %>%
                        map_chr(~sub('^.*_', '', .x$name)) %>%
                        tolower()
                )
            ]]$params <- params

            result <- RunWorkflow(
                lWorkflow = workflow,
                lData = data,
                lMapping = settings,
                #bQuiet = FALSE,
                bFlowchart = TRUE
            )

            result
        })

        # Charts
        output$scatter_plot <- gsm::renderScatterPlot({ run_workflow()$lResults$lCharts$scatterJS })
        output$bar_chart_score <- gsm::renderBarChart({ run_workflow()$lResults$lCharts$barScoreJS })
        output$bar_chart_metric <- gsm::renderBarChart({ run_workflow()$lResults$lCharts$barMetricJS })

        # Flowchart
        output$flowchart <- DiagrammeR::renderGrViz({ run_workflow()$lChecks$flowchart[[1]] })

        # Data
        output$data_summary <- DT::renderDT({ run_workflow()$lResults$lData$dfSummary })
        output$data_flagged <- DT::renderDT({ run_workflow()$lResults$lData$dfFlagged })
        output$data_analyzed <- DT::renderDT({ run_workflow()$lResults$lData$dfAnalyzed })
        output$data_transformed <- DT::renderDT({ run_workflow()$lResults$lData$dfTransformed })
        output$data_input <- DT::renderDT({ run_workflow()$lData$dfInput })

        run_workflow
    }

    workflow_server
}

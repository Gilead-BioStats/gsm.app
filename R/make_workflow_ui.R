#' Define a Shiny UI function given an workflow
#'
#' @param workflow `list` workflow specification
#'
#' @importFrom gsm scatterPlotOutput barChartOutput
#' @importFrom DiagrammeR grVizOutput
#' @importFrom DT DTOutput
#' @importFrom plotly plotlyOutput
#' @importFrom purrr imap map_chr
#' @import shiny
#'
#' @return `function` Shiny UI function
#'
#' @export

make_workflow_ui <- function(
    workflow,
    assess_parameters
) {
    workflow_ui <- function(id) {
        ns <- shiny::NS(id)

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

        inputs <- assessment$params %>%
            purrr::imap(function(value, key) {
                default <- defaults[[ key ]]
                input <- NULL

                # TODO: helper functions for each input type
                if (default$type == 'character') {
                    input = shiny::selectInput(
                        inputId = ns(key),
                        label = default$label,
                        selected = default$default,
                        choices = default$options
                    )
                } else if (default$type == 'numeric') {
                    if (length(default$default) > 1) {
                        input = default$default %>%
                            purrr::imap(function(x, i) {
                                shiny::numericInput(
                                    inputId = paste0(ns(key), '_', i),
                                    label = ifelse(
                                        i == 1,
                                        default$label,
                                        ''
                                    ),
                                    value = x,
                                    min = default$min,
                                    max = default$max,
                                    step = .1
                                )
                            })
                    } else {
                        input = shiny::numericInput(
                            inputId = ns(key),
                            label = default$label,
                            value = default$default,
                            min = default$min,
                            max = default$max,
                            step = 1
                        )
                    }
                }

                input
            })

        shiny::sidebarLayout(
            shiny::sidebarPanel(inputs),
            shiny::mainPanel(
                shiny::tabsetPanel(type = 'tabs',
                    shiny::tabPanel('Scatter Plot', gsm::scatterPlotOutput(ns('scatter_plot'))),
                    shiny::tabPanel('Bar Chart - Score', gsm::barChartOutput(ns('bar_chart_score'))),
                    shiny::tabPanel('Bar Chart - Metric', gsm::barChartOutput(ns('bar_chart_metric'))),
                    shiny::tabPanel('Flowchart', DiagrammeR::grVizOutput(ns('flowchart'))),
                    shiny::tabPanel('Data',
                        shiny::tabsetPanel(type = 'tabs',
                            shiny::tabPanel('Input', DT::DTOutput(ns('data_input'))),
                            shiny::tabPanel('Transformed', DT::DTOutput(ns('data_transformed'))),
                            shiny::tabPanel('Analyzed', DT::DTOutput(ns('data_analyzed'))),
                            shiny::tabPanel('Flagged', DT::DTOutput(ns('data_flagged'))),
                            shiny::tabPanel('Summary', DT::DTOutput(ns('data_summary')))
                        )
                    ),
                    shiny::tabPanel('Workflow', shiny::verbatimTextOutput(ns('workflow_steps')))
                )
            )
        )
    }

    workflow_ui
}

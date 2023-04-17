#' Define a Shiny UI function given an workflow
#'
#' @param workflow `list` workflow specification
#'
#' @importFrom gsm Widget_ScatterPlotOutput Widget_BarChartOutput
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
    assessments
) {
    workflow_ui <- function(id) {
        ns <- shiny::NS(id)

        assessment <- workflow$steps[[
            match(
                'assess',
                workflow$steps %>%
                    map_chr(~sub('.*(assess).*', '\\1', .x$name, TRUE)) %>%
                    tolower()
            )
        ]]

        # TODO: allow for nonexistent assessment
        defaults <- assessments[[ assessment$name ]]

        inputs <- assessment$params %>%
            purrr::imap(function(param, key) {
                default <- defaults[[ key ]]
                input <- NULL

                if (default$type == 'character') {
                    input = input_character(ns(key), default)
                } else if (default$type == 'numeric') {
                    input = input_numeric(ns(key), default)
                }

                div(
                    strong(get_input_label(default$label)),
                    input,
                    title = get_input_tooltip(default$label)
                )
            })

        shiny::sidebarLayout(
            shiny::sidebarPanel(
            #    selectInput(
            #        'site_select',
            #        'Site',
            #        'None'
            #    ),
                inputs
            ),
            # TODO: figure out how to define custom widgets rather than gsm::widgets
            shiny::mainPanel(
                shiny::tabsetPanel(type = 'tabs',
                    shiny::tabPanel('KRI Score', gsm::Widget_BarChartOutput(ns('bar_chart_score'))),
                    shiny::tabPanel('KRI Metric', gsm::Widget_BarChartOutput(ns('bar_chart_metric'))),
                    shiny::tabPanel('Scatter Plot', gsm::Widget_ScatterPlotOutput(ns('scatter_plot'))),
                    #shiny::tabPanel('Scatter Plot - Experimental', htmlwidgets::shinyWidgetOutput(ns('scatter_plot_experimental'))),
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

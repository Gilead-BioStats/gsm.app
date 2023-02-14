#' Define a Shiny UI function given an workflow
#'
#' @param workflow `list` workflow specification
#'
#' @importFrom DiagrammeR grVizOutput
#' @importFrom DT DTOutput
#' @importFrom plotly plotlyOutput
#' @importFrom purrr imap map_chr
#' @import shiny
#'
#' @return `function` Shiny UI function
#'
#' @export

make_workflow_ui <- function(workflow) {
    workflow_ui <- function(id) {
        ns <- shiny::NS(id)

        #inputs <- workflow$param %>%
        #    purrr::imap(function(value, key) {
        #        input <- NULL

        #        # TODO: helper functions for each input type
        #        if (value$type == 'character') {
        #            input = shiny::selectInput(
        #                inputId = ns(key),
        #                label = value$label,
        #                selected = value$default,
        #                choices = value$options
        #            )
        #        } else if (value$type == 'numeric') {
        #            if (length(value$default) > 1) {
        #                input = purrr::imap(value$default, function(x, i) {
        #                    shiny::numericInput(
        #                        inputId = paste0(ns(key), '_', i),
        #                        label = ifelse(
        #                            i == 1,
        #                            value$label,
        #                            ''
        #                        ),
        #                        value = x,
        #                        min = value$min,
        #                        max = value$max,
        #                        step = 1
        #                    )
        #                })
        #            } else {
        #                input = shiny::numericInput(
        #                    inputId = ns(key),
        #                    label = value$label,
        #                    value = value$default,
        #                    min = value$min,
        #                    max = value$max,
        #                    step = 1
        #                )
        #            }
        #        }

        #        input
        #    })

        #shiny::sidebarLayout(
        #    shiny::sidebarPanel(
        #        shiny::selectInput(
        #            ns('workflow'),
        #            'KRI',
        #            choices = purrr::map_chr(
        #                workflow$workflows,
        #                ~.x$tags$Label
        #            ),
        #            selected = workflow$workflows[[1]]$tags$Label
        #        ),
        #        inputs
        #    ),
        #    shiny::mainPanel(
        #        shiny::tabsetPanel(type = 'tabs',
        #            shiny::tabPanel('Chart', shiny::plotOutput(ns('chart'))),
        #            shiny::tabPanel('Chartly', plotly::plotlyOutput(ns('chartly'))),
        #            shiny::tabPanel('Flowchart', DiagrammeR::grVizOutput(ns('flowchart'))),
        #            shiny::tabPanel('Data',
        #                shiny::tabsetPanel(type = 'tabs',
        #                    shiny::tabPanel('Input', DT::DTOutput(ns('data_input'))),
        #                    shiny::tabPanel('Transformed', DT::DTOutput(ns('data_transformed'))),
        #                    shiny::tabPanel('Analyzed', DT::DTOutput(ns('data_analyzed'))),
        #                    shiny::tabPanel('Flagged', DT::DTOutput(ns('data_flagged'))),
        #                    shiny::tabPanel('Summary', DT::DTOutput(ns('data_summary')))
        #                )
        #            )
        #        )
        #    )
        #)
    }

    workflow_ui
}

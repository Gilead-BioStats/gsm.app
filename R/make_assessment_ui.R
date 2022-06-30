#' Define a Shiny UI function given an assessment
#'
#' @param assessment `list` assessment specification
#'
#' @importFrom DiagrammeR grVizOutput
#' @importFrom DT DTOutput
#' @importFrom purrr imap map_chr
#' @import shiny
#'
#' @return `function` Shiny UI function
#'
#' @export

make_assessment_ui <- function(assessment) {
    assessment_ui <- function(id) {
        ns <- shiny::NS(id)

        inputs <- assessment$param %>%
            purrr::imap(function(value, key) {
                input <- NULL

                # TODO: helper functions for each input type
                if (value$type == 'character') {
                    input = shiny::selectInput(
                        inputId = ns(key),
                        label = value$label,
                        selected = value$default,
                        choices = value$options
                    )
                } else if (value$type == 'numeric') {
                    if (length(value$default) > 1) {
                        input = purrr::imap(value$default, function(x, i) {
                            shiny::numericInput(
                                inputId = paste0(ns(key), '_', i),
                                label = ifelse(
                                    i == 1,
                                    value$label,
                                    ''
                                ),
                                value = x,
                                min = value$min,
                                max = value$max,
                                step = 1
                            )
                        })
                    } else {
                        input = shiny::numericInput(
                            inputId = ns(key),
                            label = value$label,
                            value = value$default,
                            min = value$min,
                            max = value$max,
                            step = 1
                        )
                    }
                }

                input
            })

        shiny::sidebarLayout(
            shiny::sidebarPanel(
                shiny::selectInput(
                    ns('workflow'),
                    'KRI',
                    choices = purrr::map_chr(
                        assessment$workflows,
                        ~.x$tags$Label
                    ),
                    selected = assessment$workflows[[1]]$tags$Label
                ),
                inputs
            ),
            shiny::mainPanel(
                tabsetPanel(type = "tabs",
                    tabPanel("Chart", shiny::plotOutput(ns("chart"))),
                    tabPanel("Flowchart", DiagrammeR::grVizOutput(ns("flowchart"))),
                    tabPanel("Data: Summary", DT::DTOutput(ns("data_summary"))),
                    tabPanel("Data: Flagged", DT::DTOutput(ns("data_flagged"))),
                    tabPanel("Data: Analyzed", DT::DTOutput(ns("data_analyzed"))),
                    tabPanel("Data: Transformed", DT::DTOutput(ns("data_transformed"))),
                    tabPanel("Data: Input", DT::DTOutput(ns("data_input")))
                )
            )
        )
    }

    assessment_ui
}

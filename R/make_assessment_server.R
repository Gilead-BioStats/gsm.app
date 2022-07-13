#' Define a Shiny server function given an assessment
#'
#' @param assessment `list` assessment specification
#'
#' @importFrom DiagrammeR renderGrViz
#' @importFrom DT renderDT
#' @importFrom gsm RunAssessment
#' @importFrom plotly config ggplotly renderPlotly
#' @importFrom purrr imap keep map_dbl
#' @importFrom shiny renderPlot
#'
#' @return `function` Shiny server function
#'
#' @export

make_assessment_server <- function(
    assessment
) {
    assessment_server <- function(input, output, session, params) {
        observe_method(input, session)

        run_workflow <- reactive({
            data <- params()$data
            settings <- params()$settings %>%
                map_meta_to_gsm()

            # Get selected workflow.
            workflow <- assessment$workflows %>%
                purrr::keep(~.x$tags$Label == input$workflow) %>%
                unlist(recursive = FALSE)

            # Update parameters.
            workflow$workflow[[ length(workflow$workflow) ]]$params <- assessment$params %>%
                purrr::imap(function(value, key) {
                    arg <- NULL

                    if (length(value$default) > 1) {
                        arg = purrr::map_dbl(
                            1:length(value$default),
                            ~input[[ paste0(key, '_', .x) ]]
                        )
                    } else {
                        arg = input[[ key ]]
                    }

                    arg
                })

            result <- gsm::RunAssessment(
                workflow,
                data,
                settings
            )

            result
        })

        # Chart
        output$chart <- shiny::renderPlot({ run_workflow()$lResults$chart })
        output$chartly <- plotly::renderPlotly({
            plotly::ggplotly(run_workflow()$lResults$chart, tooltip = 'text') %>%
                plotly::config(
                    displayModeBar = FALSE
                )
        })

        # Flowchart
        output$flowchart <- DiagrammeR::renderGrViz({
            result <- run_workflow()
            result$lChecks$flowchart[[1]]
        })

        # Data
        output$data_summary <- DT::renderDT({ run_workflow()$lResults$dfSummary })
        output$data_flagged <- DT::renderDT({ run_workflow()$lResults$dfFlagged })
        output$data_analyzed <- DT::renderDT({ run_workflow()$lResults$dfAnalyzed })
        output$data_transformed <- DT::renderDT({ run_workflow()$lResults$dfTransformed })
        output$data_input <- DT::renderDT({ run_workflow()$lResults$dfInput })
    }

    assessment_server
}

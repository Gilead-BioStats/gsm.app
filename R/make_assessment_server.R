make_assessment_server <- function(
    assessment
) {
    assessment_server <- function(input, output, session, params) {
        observe_method(input, session)

        # TODO: make assessment a reactive that passes objects to various outputs
        output$chart <- renderPlot({
            #req(input$method)

            data <- params()$data
            settings <- params()$settings

            # Get selected workflow.
            workflow <- assessment$workflows %>%
                keep(~.x$tags$Label == input$workflow) %>%
                unlist(recursive = FALSE)

            # Update parameters.
            workflow$workflow[[ length(workflow$workflow) ]]$params <- assessment$params %>%
                imap(function(value, key) {
                    arg <- NULL

                    if (length(value$default) > 1) {
                        arg = map_dbl(
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
                # TODO: either pass around metadata in list structure (like {gsm} expects) or map
                # metadata (like {safetyGraphics} expects) from data frame back to list
                clindata::mapping_rawplus
            )

            # TODO: make chart interactive
            result$lResults$chart
        })
    }

    assessment_server
}

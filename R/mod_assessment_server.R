mod_assessment_server <- function(
) {
    mod_assessment_server <- function(input, output, session, params) {
        observe_method(input, session)

        # TODO: make assessment a reactive that passes objects to various outputs
        output$chart <- renderPlot({
            req(input$method)

            data <- params()$data
            settings <- params()$settings

            # TODO: pull in workflow YAML
            # TODO: modify arguments to assessment
            # TODO: RunAssessment(assessment)
            # Define list of data frames.
            dfs <- list(
                dfSUBJ = data$dfSUBJ
            )
            dfs[[ domain ]] <- data[[ domain ]]

            # Run {gsm} data mapping function.
            dfInput <- get(assessment$map_function, envir = as.environment('package:gsm'))(
                dfs = dfs,
                lMapping = clindata::mapping_rawplus # TODO: convert settings to mapping
            )
            #dfInput <- gsm::AE_Map_Raw(dfs)

            # Run {gsm} assessment function.
            result <- get(assessment$assess_function, envir = as.environment('package:gsm'))(
                dfInput,
                strMethod = input$method,
                vThreshold = c( # threshold()
                    input$threshold_lower,
                    ifelse(input$method == 'poisson', input$threshold_upper, NA)
                )
            )

            #assessment <- gsm::AE_Assess(
            #    dfInput,
            #    strMethod = input$method,
            #    vThreshold = c( # threshold()
            #        input$threshold_lower,
            #        ifelse(input$method == 'poisson', input$threshold_upper, NA)
            #    )
            #)

            # TODO: make chart interactive
            result$chart
        })
    }

    mod_assessment_server
}

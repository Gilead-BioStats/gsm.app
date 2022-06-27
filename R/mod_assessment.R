
mod_ae_assessment_server <- function(input, output, session, params) {
#mod_assessment_server <- function(id) {
#    moduleServer(id, function(input, output, session, params) {
        #assessment <- prepare_assessment(
        #    map_metadata(),
        #    assessment = list(
        #        domain_name = 'dfAE',
        #        map_function = 'AE_Map_Raw',
        #        assess_function = 'AE_Assess'
        #    )
        #)

    observe_method(input, session)

        # TODO: make assessment a reactive that passes objects to various outputs
        output$chart <- renderPlot({
            req(input$method)

            # TODO: pull in workflow YAML
            # TODO: modify arguments to assessment
            # TODO: RunAssessment(assessment)
            dfs <- list(
                dfSUBJ = clindata::rawplus_subj,
                dfAE = clindata::rawplus_ae
            )

            dfInput <- gsm::AE_Map_Raw(dfs)

            assessment <- gsm::AE_Assess(
                dfInput,
                strMethod = input$method,
                vThreshold = c( # threshold()
                    input$threshold_lower,
                    ifelse(input$method == 'poisson', input$threshold_upper, NA)
                )
            )

            # TODO: make chart interactive
            assessment$chart
        })
    #})
}

mod_pd_assessment_server <- function(input, output, session, params) {
#mod_assessment_server <- function(id) {
#    moduleServer(id, function(input, output, session, params) {
        #assessment <- prepare_assessment(
        #    map_metadata(),
        #    assessment = list(
        #        domain_name = 'dfAE',
        #        map_function = 'AE_Map_Raw',
        #        assess_function = 'AE_Assess'
        #    )
        #)

        #threshold <- reactive({
        observeEvent(input$method, {
            if (input$method == 'poisson') {
                updateNumericInput(
                    session,
                    'threshold_lower',
                    value = -5,
                    min = -Inf,
                    max = Inf
                )
                shinyjs::enable('threshold_upper')
                updateNumericInput(
                    session,
                    'threshold_upper',
                    value = 5,
                    min = -Inf,
                    max = Inf
                )
            } else if (input$method == 'wilcoxon') {
                updateNumericInput(
                    session,
                    'threshold_lower',
                    value = 0.0001,
                    min = 0,
                    max = 1
                )
                updateNumericInput(
                    session,
                    'threshold_upper',
                    value = NA,
                    min = 0,
                    max = 1
                )
                shinyjs::disable('threshold_upper')
            }

            #c(
            #    input$threshold_lower,
            #    ifelse(input$method == 'poisson', input$threshold_upper, NA)
            #)
        })# %>%
        #bindCache(input$threshold_lower, input$threshold_upper) %>%
        #bindEvent(input$method)

        # TODO: make assessment a reactive that passes objects to various outputs
        output$chart <- renderPlot({
            req(input$method)

            # TODO: pull in workflow YAML
            # TODO: modify arguments to assessment
            # TODO: RunAssessment(assessment)
            dfs <- list(
                dfSUBJ = clindata::rawplus_subj,
                dfPD = clindata::rawplus_pd
            )

            dfInput <- gsm::PD_Map_Raw(dfs)

            assessment <- gsm::PD_Assess(
                dfInput,
                strMethod = input$method,
                vThreshold = c( # threshold()
                    input$threshold_lower,
                    ifelse(input$method == 'poisson', input$threshold_upper, NA)
                )
            )

            # TODO: make chart interactive
            assessment$chart
        })
    #})
}

make_input_row <- function(inputId, label, value = 0) {
    div(
        style = 'display:inline-block',
        tags$label(
            label,
            `for` = inputId
        ),
        tags$input(
            id = inputId,
            type = 'number',
            value = value,
            class = 'input-small'
        )
        #numericInput(
        #    inputId, # ns('threshold_upper'),
        #    '', # 'Lower',
        #    value = value#,
        #    #class = 'input-small'
        #)
    )
}

mod_assessment_ui <- function(id) {
    ns <- NS(id)

    #tagList(
    sidebarLayout(
        sidebarPanel(
            selectInput(
                ns('method'),
                'Method',
                choices = c('poisson', 'wilcoxon')
            ),
            div(
                h4('Threshold'),
                span('('),
                make_input_row(inputId = ns('threshold_lower'), label = '', value = -5),
                span(':'),
                make_input_row(inputId = ns('threshold_upper'), label = '', value = 5),
                span(')')
            )
        ),
        mainPanel(
            plotOutput(ns('chart'))
        )
    )
}

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

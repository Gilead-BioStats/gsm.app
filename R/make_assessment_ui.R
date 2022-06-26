make_assessment_ui <- function(assessment) {
    assessment_ui <- function(id) {
        ns <- NS(id)

        sidebarLayout(
            sidebarPanel(
                selectInput(
                    ns('workflow'),
                    'KRI',
                    choices = map_chr(
                        assessment$workflows,
                        ~.x$tags$Label
                    ),
                    selected = assessment$workflows[[1]]$tags$Label
                )
                #selectInput(
                #    ns('method'),
                #    'Method',
                #    choices = c('poisson', 'wilcoxon')
                #),
                #div(
                #    h4('Threshold'),
                #    span('('),
                #    make_input_row(inputId = ns('threshold_lower'), label = '', value = -5),
                #    span(':'),
                #    make_input_row(inputId = ns('threshold_upper'), label = '', value = 5),
                #    span(')')
                #)
            ),
            mainPanel(
                plotOutput(ns('chart'))
            )
        )
    }

    assessment_ui
}

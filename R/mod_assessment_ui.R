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

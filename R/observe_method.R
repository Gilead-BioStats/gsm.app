observe_method <- function(input, session) {
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
}

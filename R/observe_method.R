#' Update numeric inputs given change to method input.
#'
#' @param input `list` Shiny input
#' @param session `list` Shiny session
#'
#' @importFrom shiny observeEvent updateNumericInput
#' @importFrom shinyjs disable enable

observe_method <- function(input, session) {
    observeEvent(input$strMethod, {
        if (input$strMethod == 'poisson') {
            updateNumericInput(
                session,
                'vThreshold_1',
                value = -5,
                min = -Inf,
                max = Inf
            )
            shinyjs::enable('vThreshold_2')
            updateNumericInput(
                session,
                'vThreshold_2',
                value = 5,
                min = -Inf,
                max = Inf
            )
        } else if (input$strMethod == 'wilcoxon') {
            updateNumericInput(
                session,
                'vThreshold_1',
                value = 0.0001,
                min = 0,
                max = 1
            )
            updateNumericInput(
                session,
                'vThreshold_2',
                value = NA,
                min = 0,
                max = 1
            )
            shinyjs::disable('vThreshold_2')
        }
    })
}

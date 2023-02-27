#' Update numeric inputs given change to method input.
#'
#' @param input `list` Shiny input
#' @param session `list` Shiny session
#'
#' @importFrom shiny observeEvent updateNumericInput
#' @importFrom shinyjs disable enable

# TODO: avoid runnning assessment twice - once on method change and again on threshold change
observe_method <- function(input, session, workflow, thresholds) {
    observeEvent(input$strMethod, {
        if (!is.null(workflow)) {
            assessment_step <- workflow$steps[[
                match(
                    'assess',
                    workflow$steps %>%
                        map_chr(~sub('.*(assess).*', '\\1', .x$name, TRUE)) %>%
                        tolower()
                )
            ]]

            thresholds <- thresholds[[ input$strMethod ]]

            if (assessment_step$name %in% names(thresholds)) {
                assessment_thresholds <- thresholds[[ assessment_step$name ]]
            } else {
                assessment_thresholds <- thresholds$default
            }

            for (i in 1:4) {
                if (i <= (length(assessment_thresholds))) {
                    shinyjs::enable(glue::glue('vThreshold_{i}'))
                    updateNumericInput(
                        session,
                        glue::glue('vThreshold_{i}'),
                        value = assessment_thresholds[i]
                    )
                } else {
                    updateNumericInput(
                        session,
                        glue::glue('vThreshold_{i}'),
                        value = NA
                    )
                    shinyjs::disable(glue::glue('vThreshold_{i}'))
                }
            }
        }
    })
}

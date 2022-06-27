make_assessment_ui <- function(assessment) {
    assessment_ui <- function(id) {
        ns <- NS(id)

        inputs <- assessment$param %>%
            imap(function(value, key) {
                input <- NULL

                # TODO: helper functions for each input type
                if (value$type == 'character') {
                    input = selectInput(
                        inputId = ns(key),
                        label = value$label,
                        selected = value$default,
                        choices = value$options
                    )
                } else if (value$type == 'numeric') {
                    if (length(value$default) > 1) {
                        input = imap(value$default, function(x, i) {
                            numericInput(
                                inputId = paste0(ns(key), '_', i),
                                label = ifelse(
                                    i == 1,
                                    value$label,
                                    ''
                                ),
                                value = x,
                                min = value$min,
                                max = value$max,
                                step = 1
                            )
                        })
                    } else {
                        input = numericInput(
                            inputId = ns(key),
                            label = value$label,
                            value = value$default,
                            min = value$min,
                            max = value$max,
                            step = 1
                        )
                    }
                }

                input
            })

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
                ),
                inputs
            ),
            mainPanel(
                plotOutput(ns('chart'))
            )
        )
    }

    assessment_ui
}

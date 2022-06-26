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


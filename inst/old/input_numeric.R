#' Generates nuemric input
#'
#' @param id `character` Input ID
#' @param default `numeric` Input metadata
#'
#' @export
input_numeric <- function(id, default) {
    input <- NULL

    if (length(default$default) > 1) {
        inputs <- default$default %>%
            purrr::imap(function(value, i) {
                div(
                    style = 'width: 24%',
                    shiny::numericInput(
                        inputId = paste0(id, '_', i),
                        label = '',
                        value = value,
                        min = default$min,
                        max = default$max,
                        step = .1
                    )
                )
            })

        input = #div(
            #tag('label', get_input_label(default$label)),
            div(
                inputs,
                style = 'display: flex; justify-content: space-between'
            )
        #)
    } else {
        input = shiny::numericInput(
            inputId = id,
            label = '',#get_input_label(default$label),
            value = default$default,
            min = default$min,
            max = default$max,
            step = 1
        )
    }

    input
}

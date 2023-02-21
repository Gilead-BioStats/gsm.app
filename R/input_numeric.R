#' Generates nuemric input
#'
#' @param id `character` Input ID
#' @param default `numeric` Input metadata
#'
#' @export
input_numeric <- function(id, default) {
    input <- NULL

    if (length(default$default) > 1) {
        input = default$default %>%
            purrr::imap(function(value, i) {
                div(
                    style = 'display: inline-block; width: 24%',
                    shiny::numericInput(
                        inputId = paste0(id, '_', i),
                        label = ifelse(
                            i == 1,
                            default$label,
                            ''
                        ),
                        value = value,
                        min = default$min,
                        max = default$max,
                        step = .1
                    )
                )
            })
    } else {
        input = shiny::numericInput(
            inputId = id,
            label = default$label,
            value = default$default,
            min = default$min,
            max = default$max,
            step = 1
        )
    }

    input
}

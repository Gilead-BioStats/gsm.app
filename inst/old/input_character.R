#' Generates character input
#'
#' @param id `character` Input ID
#' @param default `character` Input metadata
#'
#' @export
input_character <- function(id, default) {
    shiny::selectInput(
        inputId = id,
        label = '',
        selected = default$default,
        choices = default$options
    )
}

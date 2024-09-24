#' Remove a namespace from an id.
#'
#' @inheritParams shared-params
#' @param ns A function to apply a namespace to an object, such as the ones
#'   produced using [shiny::NS()] or the one available as `session$ns()` in a
#'   Shiny server function.
#'
#' @return `id` minus the namespace.
#' @keywords internal
un_ns <- function(id, ns) {
  sub(paste0("^", ns("")), "", id)
}

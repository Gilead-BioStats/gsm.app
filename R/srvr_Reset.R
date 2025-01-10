#' Reload app from reset button
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] to apply the reset.
#' @keywords internal
srvr_Reset <- function(input, session) {
  observe({
    session$reload()
  }) %>%
    bindEvent(input$reset)
}

#' Domain Tab Count UI
#'
#' @inheritParams shared-params
#' @returns A [shiny::uiOutput()] to show as the count of rows in this domain.
#' @keywords internal
mod_DomainCount_UI <- function(id, strDomainLabel, strDomainID) {
  ns <- NS(id)
  shiny::HTML(
    paste0(
      strDomainLabel,
      " (",
      shiny::uiOutput(ns("count"), inline = TRUE),
      ")"
    )
  )
}

#' Domain Tab Count Server
#'
#' Display a count of rows in a given domain.
#'
#' @inheritParams shared-params
#' @returns Nothing. Called to update the output to the number.
#' @keywords internal
mod_DomainCount_Server <- function(id, rctv_intDomainCount) {
  moduleServer(id, function(input, output, session) {
    output$count <- renderUI({
      rctv_intDomainCount()
    })
  })
}

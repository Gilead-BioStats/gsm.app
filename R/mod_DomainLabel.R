#' Domain Tab Label UI
#'
#' @inheritParams shared-params
#' @returns A [shiny::HTML()] that includes a dynamic [shiny::uiOutput()] with
#' the count of rows in this domain.
#' @keywords internal
mod_DomainLabel_UI <- function(id, strDomainLabel, strDomainID) {
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

#' Domain Tab Label Server
#'
#' Display a count of rows in a given domain's label.
#'
#' @inheritParams shared-params
#' @returns Nothing. Called to update the output to the number.
#' @keywords internal
mod_DomainLabel_Server <- function(id, rctv_intDomainCount) {
  moduleServer(id, function(input, output, session) {
    output$count <- renderUI({
      rctv_intDomainCount()
    })
  })
}

#' Metric Table Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [gsm::Report_MetricTable()].
#' @keywords internal
mod_MetricTable_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "MetricTable",
    gtIO(ns("table"))
  )
}

#' gt Table Input and Output
#'
#' @param id
#'
#' @return An [htmltools::tagList()] containing the dependencies needed to use
#'   gt as both an input and an output, and a [shiny::htmlOutput()] with class
#'   "gtIO".
#' @keywords internal
gtIO <- function(id) {
  htmltools::tagList(
    htmlDependency_gtIO(),
    shiny::htmlOutput(id, class = "gtIO")
  )
}

#' gt Input-Output Dependencies
#'
#' Attach CSS and JavaScript necessary for gtIO to an app or other HTML exactly
#' once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_gtIO <- function() {
  htmltools::tagList(
    htmlDependency_gtIOjs(),
    htmlDependency_gtIOInput(),
    htmlDependency_Stylesheet("gtIOStyle.css")
  )
}

#' gt JavaScript
#'
#' Attach `gtIO.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_gtIOjs <- function() {
  htmltools::htmlDependency(
    name = "gtIO",
    version = "0.0.1",
    src = "js",
    package = "gsm.app",
    script = "gtIO.js"
  )
}


#' gt Input JavaScript
#'
#' Attach `gtIOInput.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_gtIOInput <- function() {
  htmltools::htmlDependency(
    name = "gtShinyInput",
    version = "0.0.1",
    src = "inputs",
    package = "gsm.app",
    script = "gtIOInput.js"
  )
}

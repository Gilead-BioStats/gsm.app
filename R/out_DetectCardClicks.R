#' Card click detection JavaScript
#'
#' @inheritParams shared-params
#'
#' @returns A [shiny::tagList()] with the JavaScript required to enable card
#'   click detection within the specified container. Clicks will be reported to
#'   the Shiny input named `strInputID`.
#' @keywords internal
out_DetectCardClicks <- function(strContainerID, strInputID) {
  tagList(
    htmlDependency_DetectCardClicks(),
    tags$script(
      HTML(sprintf(
        "detectCardClicks('%s', '%s')",
        strContainerID,
        strInputID
      ))
    )
  )
}

#' DetectCardClicks JavaScript
#'
#' Attach `detectCardClicks.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless of how many
#'   times it is added.
#' @keywords internal
htmlDependency_DetectCardClicks <- function() {
  htmltools::htmlDependency(
    name = "DetectCardClicks",
    version = "0.0.1",
    src = "js",
    package = "gsm.app",
    script = "detectCardClicks.js"
  )
}

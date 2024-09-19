#' Default stylesheet
#'
#' Attach a default stylesheet to an app or other HTML exactly once.
#'
#' @return An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_Stylesheet <- function() {
  htmltools::htmlDependency(
    name = "Stylesheet",
    version = "1.0.0",
    src = "www",
    package = "gsm.app",
    stylesheet = "styles.css"
  )
}

#' HighlightTableRow javascript
#'
#' Attach `highlightTableRow.js` to an app or other HTML exactly once.
#'
#' @return An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_HighlightTableRow <- function() {
  htmltools::htmlDependency(
    name = "HighlightTableRow",
    version = "1.0.0",
    src = "js",
    package = "gsm.app",
    script = "highlightTableRow.js"
  )
}

#' TableClick javascript
#'
#' Attach `tableClick.js` to an app or other HTML exactly once.
#'
#' @return An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_TableClick <- function() {
  htmltools::htmlDependency(
    name = "TableClick",
    version = "1.0.0",
    src = "js",
    package = "gsm.app",
    script = "tableClick.js"
  )
}

#' DetectCardClicks javascript
#'
#' Attach `detectCardClicks.js` to an app or other HTML exactly once.
#'
#' @return An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
htmlDependency_DetectCardClicks <- function() {
  htmltools::htmlDependency(
    name = "DetectCardClicks",
    version = "0.0.1",
    src = "js",
    package = "gsm.app",
    script = "detectCardClicks.js"
  )
}

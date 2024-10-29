#' Default stylesheet
#'
#' Attach a default stylesheet to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_Default_Stylesheet <- function() {
  htmlDependency_Stylesheet("defaultStyles.css")
}

#' gsm.app stylesheet
#'
#' Attach a stylesheet from this package to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_Stylesheet <- function(
  filename,
  name = sub("\\.css$", "", filename),
  version = "1.0.0"
) {
  htmltools::htmlDependency(
    name = name,
    version = version,
    src = "css",
    package = "gsm.app",
    stylesheet = filename
  )
}

#' DetectCardClicks JavaScript
#'
#' Attach `detectCardClicks.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
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

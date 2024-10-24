#' Toggle Pill Module UI
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] with a specialized [shiny::actionLink()]
#'   and the necessary CSS and JavaScript to manage the link.
#' @keywords internal
mod_TogglePill_UI <- function(id, strLabel, strColorCode) {
  ns <- shiny::NS(id)
  htmltools::tagList(
    shiny::actionLink(
      ns("toggle_pill"),
      label = strLabel,
      style = glue::glue("background-color: {strColorCode}; opacity: 0.5;"),
      class = "badge rounded-pill toggle-pill text-dark fs-6 p-2"
    ),
    htmlDependency_TogglePill()
  )
}

#' TogglePill Dependencies
#'
#' Attach CSS and JavaScript necessary for TogglePill to an app or other HTML
#' exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_TogglePill <- function() {
  htmltools::tagList(
    htmlDependency_updateStyleJS(),
    htmlDependency_Stylesheet("togglePill.css")
  )
}

#' Style JavaScript
#'
#' Attach `updateStyle.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_updateStyleJS <- function() {
  htmltools::htmlDependency(
    name = "updateStyle",
    version = "1.0.0",
    src = "js",
    package = "gsm.app",
    script = "updateStyle.js"
  )
}

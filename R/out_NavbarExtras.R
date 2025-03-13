#' Things on the right side of navbar
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] with app inputs.
#' @keywords internal
out_NavbarExtras <- function(chrSites) {
  tagList(
    htmlDependency_NavbarExtras(),
    bslib::layout_columns(
      id = "custom-navbar-extra",
      class = "navbar-extras",
      shinyWidgets::virtualSelectInput(
        inputId = "site",
        label = strong("Site"),
        choices = c("All", chrSites),
        inline = TRUE,
        width = "fit-content"
      ),
      shinyWidgets::virtualSelectInput(
        inputId = "participant",
        label = strong("Participant"),
        choices = NULL,
        inline = TRUE,
        width = "fit-content"
      )
    )
  )
}

#' NavbarExtras Dependencies
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless of how many times they are added.
#' @keywords internal
htmlDependency_NavbarExtras <- function() {
  tagList(
    htmlDependency_Stylesheet("navbarExtras.css"),
    htmlDependency_NavbarExtrasPosition(),
  )
}

#' NavbarExtrasPosition JavaScript
#'
#' Attach `navbarExtrasPosition.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless of how many
#'   times it is added.
#' @keywords internal
htmlDependency_NavbarExtrasPosition <- function() {
  tagList(
    htmltools::htmlDependency(
      name = "navbarExtrasPosition",
      version = "1.0.0",
      src = "js",
      package = "gsm.app",
      script = "navbarExtrasPosition.js"
    )
  )
}

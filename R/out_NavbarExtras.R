#' Things on the right side of navbar
#'
#' @inheritParams shared-params
#' @returns A list of [bslib::nav_item()] with
#'   [shinyWidgets::virtualSelectInput()].
#' @keywords internal
out_NavbarExtras <- function(dfGroups) {
  c(
    mod_GroupInput_UI("group", dfGroups),
    list(
      mod_CascadingSelect_UI("participant", strLabel = "Participant"),
      bslib::nav_item(
        class = "navbar-extras",
        htmlDependency_Stylesheet("navbarExtras.css"),
        actionButton(
          "reset",
          label = NULL,
          icon = icon("rotate", title = "Reset all inputs"),
          class = "btn-primary"
        )
      )
    )
  )
}

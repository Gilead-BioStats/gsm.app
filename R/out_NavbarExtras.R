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

#' Individual input within the right navbar
#'
#' @inheritParams shared-params
#' @returns A [bslib::nav_item()] with a [shinyWidgets::virtualSelectInput()].
#' @keywords internal
input_NavbarExtra <- function(
  strInputID,
  chrChoices = NULL,
  strLabel = MakeParamLabelsChr(strInputID)
) {
  bslib::nav_item(
    class = "navbar-extras",
    htmlDependency_Stylesheet("navbarExtras.css"),
    shinyWidgets::virtualSelectInput(
      inputId = strInputID,
      label = strong(strLabel),
      choices = unique(chrChoices),
      inline = TRUE
    )
  )
}

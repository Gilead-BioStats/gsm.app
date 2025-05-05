#' Things on the right side of navbar
#'
#' @inheritParams shared-params
#' @returns A list of [bslib::nav_item()] with
#'   [shinyWidgets::virtualSelectInput()].
#' @keywords internal
out_NavbarExtras <- function(dfGroups) {
  purrr::compact(c(
    mod_GroupInput_UI("group", dfGroups),
    list(
      input_NavbarExtra("participant"),
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
  ))
}

#' Individual input within the right navbar
#'
#' @inheritParams shared-params
#' @returns A [bslib::nav_item()] with a [shinyWidgets::virtualSelectInput()].
#' @keywords internal
input_NavbarExtra <- function(
  strInputID,
  chrChoices = NULL,
  label = MakeParamLabelsChr(strInputID)
) {
  bslib::nav_item(
    class = "navbar-extras",
    htmlDependency_Stylesheet("navbarExtras.css"),
    shinyWidgets::virtualSelectInput(
      inputId = strInputID,
      label = strong(label),
      choices = chrChoices,
      inline = TRUE
    )
  )
}

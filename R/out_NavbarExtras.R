#' Things on the right side of navbar
#'
#' @inheritParams shared-params
#' @returns A list of [bslib::nav_item()] with
#'   [shinyWidgets::virtualSelectInput()].
#' @keywords internal
out_NavbarExtras <- function(chrSites) {
  list(
    input_NavbarExtra("site", c("All", chrSites)),
    input_NavbarExtra("participant")
  )
}

#' Individual input within the right navbar
#'
#' @inheritParams shared-params
#' @returns A [bslib::nav_item()] with a [shinyWidgets::virtualSelectInput()].
#' @keywords internal
input_NavbarExtra <- function(strInputID, chrChoices = NULL) {
  bslib::nav_item(
    class = "navbar-extras",
    htmlDependency_Stylesheet("navbarExtras.css"),
    shinyWidgets::virtualSelectInput(
      inputId = strInputID,
      label = strong(MakeParamLabelsChr(strInputID)),
      choices = chrChoices,
      inline = TRUE
    )
  )
}

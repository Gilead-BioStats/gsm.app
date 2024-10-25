mod_GroupOverview_UI = function(id, dfResults) {
  ns <- NS(id)
  bslib::card(
    full_screen = TRUE,
    bslib::card_body(
      mod_RAGPillSet_UI(
        ns("kri_counts"),
        intRed = sum(abs(dfResults$Flag) == 2, na.rm = TRUE),
        intAmber = sum(abs(dfResults$Flag) == 1, na.rm = TRUE)
      ),
      htmlDependency_GroupOverview(),
      Widget_GroupOverviewOutput(ns("group_overview"))
    ),
    id = id
  )
}

htmlDependency_GroupOverview <- function() {
  htmltools::tagList(
    htmlDependency_WidgetInputHelpers(),
    htmlDependency_GroupOverviewInput()
  )
}

#' Group Overview Input JavaScript
#'
#' Attach `groupOverviewInput.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_GroupOverviewInput <- function() {
  htmltools::tagList(
    htmlDependency_WidgetInputHelpers(),
    htmltools::htmlDependency(
      name = "groupOverviewInput",
      version = "1.0.0",
      src = "inputs",
      package = "gsm.app",
      script = "groupOverviewInput.js"
    )
  )
}

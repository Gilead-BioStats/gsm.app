#' Widget Plot Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [Widget_BarChartOutput()].
#' @keywords internal
mod_WidgetPlot_UI <- function(
  id,
  fnHtmlDependency,
  fnWidgetOutput,
  strPlotTitle = NULL
) {
  ns <- NS(id)
  card_header <- if (!is.null(strPlotTitle)) {
    bslib::card_header(strPlotTitle)
  }
  bslib::card(
    id = id,
    full_screen = TRUE,
    class = "chart",
    card_header,
    fnHtmlDependency(),
    fnWidgetOutput(ns("plot"))
  )
}

#' Widget Plot Input JavaScript
#'
#' Attach the appropriate `*Input.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_WidgetPlotInput <- function(strWidgetName) {
  strBaseName <- sub("Widget_", "", strWidgetName)
  substr(strBaseName, 1, 1) <- tolower(substr(strBaseName, 1, 1))
  htmltools::tagList(
    htmlDependency_WidgetInputHelpers(),
    htmltools::htmlDependency(
      name = paste0(strBaseName, "Input"),
      version = "1.0.0",
      src = "inputs",
      package = "gsm.app",
      script = paste0(strBaseName, "Input.js")
    )
  )
}

#' Widget Input JavaScript
#'
#' Attach `widgetInputHelpers.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_WidgetInputHelpers <- function() {
  htmltools::htmlDependency(
    name = "widgetInputHelpers",
    version = "1.0.0",
    src = "inputs",
    package = "gsm.app",
    script = "widgetInputHelpers.js"
  )
}

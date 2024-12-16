#' ScatterPlot Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [Widget_ScatterPlotOutput()].
#' @keywords internal
mod_ScatterPlot_UI <- function(id, strPlotTitle = NULL) {
  mod_WidgetPlot_UI(
    id = id,
    fnHtmlDependency = htmlDependency_ScatterPlotInput,
    fnWidgetOutput = Widget_ScatterPlotOutput,
    strPlotTitle = strPlotTitle
  )
}

#' Scatter Plot Input JavaScript
#'
#' Attach `scatterPlotInput.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_ScatterPlotInput <- function() {
  htmlDependency_WidgetPlotInput("Widget_ScatterPlot")
}

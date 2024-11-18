#' BarChart Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [Widget_BarChartOutput()].
#' @keywords internal
mod_BarChart_UI <- function(id, strPlotTitle = NULL) {
  mod_WidgetPlot_UI(
    id = id,
    fnHtmlDependency = htmlDependency_BarChartInput,
    fnWidgetOutput = Widget_BarChartOutput,
    strPlotTitle = strPlotTitle
  )
}

#' Bar Chart Input JavaScript
#'
#' Attach `barChartInput.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_BarChartInput <- function() {
  htmlDependency_WidgetPlotInput("Widget_BarChart")
}

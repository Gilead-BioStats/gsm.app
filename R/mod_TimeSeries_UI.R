#' TimeSeries Module UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an optional title and a
#'   [Widget_TimeSeriesOutput()].
#' @keywords internal
mod_TimeSeries_UI <- function(id, strPlotTitle = NULL) {
  mod_WidgetPlot_UI(
    id = id,
    fnHtmlDependency = htmlDependency_TimeSeriesInput,
    fnWidgetOutput = Widget_TimeSeriesOutput,
    strPlotTitle = strPlotTitle
  )
}

#' Time Series Input JavaScript
#'
#' Attach `timeSeriesInput.js` to an app or other HTML exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_TimeSeriesInput <- function() {
  htmlDependency_WidgetPlotInput("Widget_TimeSeries")
}

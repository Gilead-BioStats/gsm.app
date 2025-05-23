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
#'   app exactly once, regardless of how many times they are added.
#' @keywords internal
htmlDependency_ScatterPlotInput <- function() {
  htmlDependency_WidgetPlotInput("Widget_ScatterPlot")
}

#' ScatterPlot Module Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_ScatterPlot_Server <- function(
  id,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds,
  rctv_strGroupID
) {
  mod_WidgetPlot_Server(
    id,
    fn_Widget = Widget_ScatterPlot,
    fn_WidgetOutput = Widget_ScatterPlotOutput,
    rctv_dfResults = rctv_dfResults,
    rctv_lMetric = rctv_lMetric,
    dfGroups = dfGroups,
    rctv_dfBounds = rctv_dfBounds,
    rctv_strGroupID = rctv_strGroupID
  )
}

#' Scatter Plot Widget
#'
#' @inheritParams shared-params
#' @keywords internal
Widget_ScatterPlot <- function(
  id,
  dfResults,
  lMetric = list(),
  dfGroups = NULL,
  dfBounds = NULL
) {
  stopifnot(
    "dfResults is not a data.frame" = is.data.frame(dfResults),
    "lMetric must be a list, but not a data.frame" = is.list(lMetric) && !is.data.frame(lMetric),
    "dfGroups is not a data.frame" = is.null(dfGroups) || is.data.frame(dfGroups),
    "dfBounds is not a data.frame" = is.null(dfBounds) || is.data.frame(dfBounds)
  )
  if (length(dfResults)) {
    dfResults <- gsm.kri::FilterByLatestSnapshotDate(dfResults)
  }
  if (length(dfBounds)) {
    dfBounds <- gsm.kri::FilterByLatestSnapshotDate(dfBounds)
  }
  Widget_Plot(
    "Widget_ScatterPlot",
    id = id,
    dfResults = dfResults,
    lMetric = lMetric,
    dfGroups = dfGroups,
    dfBounds = dfBounds,
    strFootnote = "Point size is relative to the number of enrolled participants."
  )
}

#' Shiny bindings for ScatterPlot Widget
#'
#' @inheritParams Widget_PlotOutput
#' @keywords internal
Widget_ScatterPlotOutput <- function(
  outputId,
  width = "100%",
  height = "400px"
) {
  Widget_PlotOutput("Widget_ScatterPlot", outputId, width, height)
}

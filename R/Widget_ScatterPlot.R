#' Scatter Plot Widget
#'
#' @description `r lifecycle::badge("stable")`
#'
#' A widget that generates a scatter plot of group-level metric results,
#' plotting the denominator on the x-axis and the numerator on the y-axis.
#'
#' @inheritParams shared-params
#'
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

#' @rdname Widget_PlotOutput
#' @keywords internal
Widget_ScatterPlotOutput <- function(
  outputId,
  width = "100%",
  height = "400px"
) {
  Widget_PlotOutput("Widget_ScatterPlot", outputId, width, height)
}

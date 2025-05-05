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
#'   app exactly once, regardless of how many times they are added.
#' @keywords internal
htmlDependency_TimeSeriesInput <- function() {
  htmlDependency_WidgetPlotInput("Widget_TimeSeries")
}

#' TimeSeries Module Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_TimeSeries_Server <- function(
    id,
    rctv_dfResults,
    rctv_lMetric,
    dfGroups,
    rctv_strGroupID,
    strOutcome = "Score",
    rctv_dfBounds = shiny::reactive(NULL)
) {
  mod_WidgetPlot_Server(
    id,
    fn_Widget = Widget_TimeSeries,
    fn_WidgetOutput = Widget_TimeSeriesOutput,
    rctv_dfResults = rctv_dfResults,
    rctv_lMetric = rctv_lMetric,
    dfGroups = dfGroups,
    rctv_dfBounds = rctv_dfBounds,
    rctv_strGroupID = rctv_strGroupID,
    strOutcome = strOutcome
  )
}

#' Time Series Widget
#'
#' @inheritParams shared-params
#' @keywords internal
Widget_TimeSeries <- function(
    id,
    dfResults,
    strOutcome = "Score",
    lMetric = list(),
    dfGroups = NULL,
    dfBounds = NULL
) {
  stopifnot(
    "dfResults is not a data.frame" = is.data.frame(dfResults),
    "lMetric must be a list, but not a data.frame" = is.list(lMetric) && !is.data.frame(lMetric),
    "dfGroups is not a data.frame" = is.null(dfGroups) || is.data.frame(dfGroups),
    "strOutcome must be length 1" = length(strOutcome) == 1,
    "strOutcome is not a character" = is.character(strOutcome),
    "dfBounds is not a data.frame" = is.null(dfBounds) || is.data.frame(dfBounds)
  )
  vThreshold <- NULL
  if (
    strOutcome == "Score" &&
    !is.null(dfBounds) &&
    "Threshold" %in% colnames(dfBounds)
  ) {
    vThreshold <- dfBounds$Threshold
  }
  Widget_Plot(
    "Widget_TimeSeries",
    id = id,
    dfResults = dfResults,
    lMetric = lMetric,
    dfGroups = dfGroups,
    strOutcome = strOutcome,
    vThreshold = vThreshold,
    strFootnote = "Only data from the most recent snapshot is included in the Group Subjects table."
  )
}

#' Shiny bindings for TimeSeries Widget
#'
#' @inheritParams Widget_PlotOutput
#' @keywords internal
Widget_TimeSeriesOutput <- function(
    outputId,
    width = "100%",
    height = "400px"
) {
  Widget_PlotOutput("Widget_TimeSeries", outputId, width, height)
}

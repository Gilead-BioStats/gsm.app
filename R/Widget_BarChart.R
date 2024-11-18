#' Bar Chart Widget
#'
#' @description `r lifecycle::badge("stable")`
#'
#' A widget that generates a bar chart of group-level metric results,
#' plotting the denominator on the x-axis and the numerator on the y-axis.
#'
#' @inheritParams shared-params
#'
#' @keywords internal
Widget_BarChart <- function(
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
    "Widget_BarChart",
    id = id,
    dfResults = dfResults,
    lMetric = lMetric,
    dfGroups = dfGroups,
    strOutcome = strOutcome,
    vThreshold = vThreshold
  )
}

#' @rdname Widget_PlotOutput
#' @keywords internal
Widget_BarChartOutput <- function(
  outputId,
  width = "100%",
  height = "400px"
) {
  Widget_PlotOutput("Widget_BarChart", outputId, width, height)
}

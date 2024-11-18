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

  input <- list(
    id = id,
    dfResults = dfResults,
    lMetric = lMetric,
    dfGroups = dfGroups,
    strOutcome = strOutcome,
    vThreshold = vThreshold
  )
  # Get rid of bits we don't use from the main widget.
  excludes <- c(
    "addSelectControl",
    "addWidgetControls",
    "clickCallback",
    "getGroups",
    "getCountries"
  )

  htmlwidgets::createWidget(
    name = "Widget_BarChart",
    purrr::map(
      input,
      ~ jsonlite::toJSON(
        .x,
        null = "null",
        na = "string",
        auto_unbox = TRUE
      )
    ),
    package = "gsm.app",
    dependencies = gsmDependencies("Widget_BarChart", excludes)
  )
}

#' Shiny bindings for Widget_BarChart
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Output and render functions for using Widget_BarChart within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like `'100%'`, `'400px'`,
#'   `'auto'`) or a number, which will be coerced to a string and have `'px'`
#'   appended.
#' @param expr An expression that generates a Widget_BarChart
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with [quote()])? This is useful
#'   if you want to save an expression in a variable.
#'
#' @name Widget_BarChart-shiny
#'
#' @keywords internal
Widget_BarChartOutput <- function(
  outputId,
  width = "100%",
  height = "400px"
) {
  gsmWidgetOutput(
    "Widget_BarChart",
    outputId,
    width,
    height,
    excludes = c(
      "addSelectControl",
      "addWidgetControls",
      "clickCallback",
      "getGroups",
      "getCountries"
    )
  )
}

#' @rdname Widget_BarChart-shiny
#' @keywords internal
renderWidget_BarChart <- function(
  expr,
  env = parent.frame(),
  quoted = FALSE
) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    Widget_BarChartOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

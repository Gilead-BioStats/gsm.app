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
  input <- list(
    id = id,
    dfResults = dfResults,
    lMetric = lMetric,
    dfGroups = dfGroups,
    dfBounds = dfBounds,
    bAddGroupSelect = FALSE,
    strFootnote = "Point size is relative to the number of enrolled participants."
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
    name = "Widget_ScatterPlot",
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
    dependencies = gsmDependencies("Widget_ScatterPlot", excludes)
  )
}

#' Shiny bindings for Widget_ScatterPlot
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Output and render functions for using Widget_ScatterPlot within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like `'100%'`, `'400px'`,
#'   `'auto'`) or a number, which will be coerced to a string and have `'px'`
#'   appended.
#' @param expr An expression that generates a Widget_ScatterPlot
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with [quote()])? This is useful
#'   if you want to save an expression in a variable.
#'
#' @name Widget_ScatterPlot-shiny
#'
#' @keywords internal
Widget_ScatterPlotOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(
    outputId,
    "Widget_ScatterPlot",
    width,
    height,
    package = "gsm.app"
  )
}

#' @rdname Widget_ScatterPlot-shiny
#' @keywords internal
renderWidget_ScatterPlot <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    Widget_ScatterPlotOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

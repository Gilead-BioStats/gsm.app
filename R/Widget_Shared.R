Widget_Plot <- function(
    id,
    strWidgetName,
    ...
) {

  input <- list(id = id, ...)
  # Get rid of bits we don't use from the main widget.
  excludes <- c(
    "addSelectControl",
    "addWidgetControls",
    "clickCallback",
    "getGroups",
    "getCountries"
  )

  htmlwidgets::createWidget(
    name = strWidgetName,
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
    dependencies = gsmDependencies(strWidgetName, excludes)
  )
}


#' Shiny bindings for Widgets
#'
#' @description `r lifecycle::badge("stable")`
#'
#'   Output and render functions for using Widgets within Shiny applications and
#'   interactive Rmd documents.
#'
#' @param strWidgetName Widget to load.
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like `'100%'`, `'400px'`,
#'   `'auto'`) or a number, which will be coerced to a string and have `'px'`
#'   appended.
#' @param expr An expression that generates a Widget_ScatterPlot
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with [quote()])? This is useful
#'   if you want to save an expression in a variable.
#'
#' @keywords internal
Widget_PlotOutput <- function(
    strWidgetName,
    outputId,
    width = "100%",
    height = "400px"
) {
  gsmWidgetOutput(
    strWidgetName,
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

#' @rdname Widget_PlotOutput
#' @keywords internal
renderWidgetPlot <- function(
  expr,
  fn_WidgetOutput,
  env = parent.frame(),
  quoted = FALSE
) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    fn_WidgetOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

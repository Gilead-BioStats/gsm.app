Widget_GroupOverview <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  strGroupLevel = NULL,
  strGroupSubset = "red",
  strGroupLabelKey = "InvestigatorLastName"
) {
  # set strGroupLevel if NULL and dfMetrics is not NULL
  if (is.null(strGroupLevel) && !is.null(dfMetrics)) {
    strGroupLevel <- unique(dfMetrics$GroupLevel)
  }

  if (is.null(strGroupLevel) || length(strGroupLevel) != 1) {
    stop("A single group level must be provided to create group-level output.")
  }

  input <- list(
    id = id,
    dfResults = dfResults,
    dfMetrics = dfMetrics,
    dfGroups = dfGroups,
    strGroupLevel = strGroupLevel,
    strGroupSubset = strGroupSubset,
    strGroupLabelKey = strGroupLabelKey
  )

  htmlwidgets::createWidget(
    name = "Widget_GroupOverview",
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
    width = "100%",
    dependencies = gsmDependencies("Widget_GroupOverview")
  )
}

#' Shiny bindings for Widget_GroupOverview
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Output and render functions for using Widget_GroupOverview within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like `'100%'`, `'400px'`,
#'   `'auto'`) or a number, which will be coerced to a string and have `'px'`
#'   appended.
#' @param expr An expression that generates a Widget_GroupOverview
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with [quote()])? This is useful
#'   if you want to save an expression in a variable.
#'
#' @name Widget_GroupOverview-shiny
#'
#' @keywords internal
Widget_GroupOverviewOutput <- function(outputId, width = "100%", height = "100%") {
  gsmWidgetOutput(
    "Widget_GroupOverview",
    outputId,
    width,
    height
  )
}

#' @rdname Widget_GroupOverview-shiny
#' @keywords internal
renderWidget_GroupOverview <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    Widget_GroupOverviewOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

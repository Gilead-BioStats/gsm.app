#' Adapt a gsm widget for use here
#'
#' This should go away eventually by making sure everything from gsm is
#' compatible here.
#'
#' @inheritParams shared-params
#' @param ... Additional parameters passed on to the widgetas JSON.
#' @returns An htmlwidget object as created by [htmlwidgets::createWidget()].
#' @keywords internal
Widget_Plot <- function(id, strWidgetName, ...) {
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
#' @inheritParams shared-params
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

#' Get dependencies for a gsm widget
#'
#' @inheritParams shared-params
#' @param excludes An optional vector of named dependencies to *not* include.
#'
#' @returns A list of `htmltools::htmlDependency` objects for use in
#'   [htmlwidgets::createWidget()].
#' @keywords internal
gsmDependencies <- function(strWidgetName, excludes = character()) {
  gsm_dependencies <- yaml::read_yaml(
    system.file("htmlwidgets", paste0(strWidgetName, ".yaml"), package = "gsm.kri")
  )$dependencies
  dependency_is_included <- function(dependency) {
    !(dependency$name %in% excludes)
  }
  gsm_dependencies <- purrr::keep(gsm_dependencies, dependency_is_included)
  dependencies <- purrr::map(
    gsm_dependencies,
    function(dependency) {
      rlang::inject({
        htmltools::htmlDependency(!!!dependency, package = "gsm.kri")
      })
    }
  )
  dependencies
}

#' Pick Up Dependencies for Rendered Output
#'
#' @inheritParams gsmDependencies
#' @inheritParams htmlwidgets::shinyWidgetOutput
#' @inheritDotParams htmlwidgets::shinyWidgetOutput inline reportSize
#'   reportTheme fill
#'
#' @returns A [htmltools::tagList()] with the [htmlwidgets::shinyWidgetOutput()]
#'   and its dependencies.
#' @keywords internal
gsmWidgetOutput <- function(
  strWidgetName,
  outputId,
  width = "100%",
  height = "400px",
  excludes = character(),
  ...
) {
  tagList(
    htmlwidgets::shinyWidgetOutput(
      outputId,
      strWidgetName,
      width,
      height,
      package = "gsm.app",
      ...
    ),
    # Can't automatically pick up css dependencies without this.
    gsmDependencies(strWidgetName, excludes)
  )
}

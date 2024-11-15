#' Get dependencies for a gsm widget
#'
#' @param strWidgetName The name of a widget in the gsm package.
#' @param excludes An optional vector of named dependencies to *not* include.
#'
#' @returns A list of `htmltools::htmlDependency` objects for use in
#'   [htmlwidgets::createWidget()].
#' @keywords internal
gsmDependencies <- function(strWidgetName, excludes = character()) {
  gsm_dependencies <- yaml::read_yaml(
    system.file("htmlwidgets", paste0(strWidgetName, ".yaml"), package = "gsm")
  )$dependencies
  dependency_is_included <- function(dependency) {
    !(dependency$name %in% excludes)
  }
  gsm_dependencies <- purrr::keep(gsm_dependencies, dependency_is_included)
  dependencies <- purrr::map(
    gsm_dependencies,
    function(dependency) {
      rlang::inject({
        htmltools::htmlDependency(!!!dependency, package = "gsm")
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
#' @return A [htmltools::tagList()] with the [htmlwidgets::shinyWidgetOutput()]
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
  htmltools::tagList(
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

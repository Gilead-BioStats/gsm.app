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

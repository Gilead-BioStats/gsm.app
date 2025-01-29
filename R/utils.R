#' Remove a namespace from an id.
#'
#' @inheritParams shared-params
#' @param ns A function to apply a namespace to an object, such as the ones
#'   produced using [shiny::NS()] or the one available as `session$ns()` in a
#'   Shiny server function.
#'
#' @returns `id` minus the namespace.
#' @keywords internal
UnNS <- function(id, ns) {
  sub(paste0("^", ns("")), "", id)
}

#' Replace empty values with NULL
#'
#' @inheritParams shared-params
#' @returns The value, or `NULL` if the value is "None", "All", or an empty
#'   string.
#' @keywords internal
NullifyEmpty <- function(strValue) {
  if (
    length(strValue) == 0 ||
    identical(strValue, "None") ||
    identical(strValue, "All") ||
    identical(strValue, "")
  ) {
    return(NULL)
  }
  return(strValue)
}

#' gsm Color Scheme
#'
#' Eventually this should have a single home, but it doesn't make sense yet for
#' anything to export it, so it exists in both gsm and gsm.app.
#'
#' @inheritParams shared-params
#' @returns The hex code of a color.
#' @keywords internal
ColorScheme <- function(
  strColorName = c("gray", "green", "amber", "red"),
  strColorFamily = c("dark", "light")
) {
  strColorName <- tolower(strColorName)
  strColorFamily <- tolower(strColorFamily)
  strColorName <- rlang::arg_match(strColorName)
  strColorFamily <- rlang::arg_match(strColorFamily)
  colors <- list(
    light = c(
      red = "#FFABAC",
      amber = "#FED480",
      green = "#9ED782",
      gray = "#E5E5E5"
    ),
    dark = c(
      red = "#FF5859",
      amber = "#FEAA02",
      green = "#3DAF06",
      gray = "#828282"
    )
  )
  colors[[strColorFamily]][[strColorName]]
}

#' Load a Function for a Plugin
#'
#' @inheritParams shared-params
#'
#' @returns The function, if it can be found.
#' @keywords internal
AsFunction <- function(strFunction) {
  UseMethod("AsFunction")
}

#' @export
AsFunction.default <- function(strFunction) {
  rlang::as_function(strFunction)
}

#' @export
AsFunction.character <- function(strFunction) {
  fnFunction <- gsm::GetStrFunctionIfNamespaced(strFunction)
  # Extra step to work around things that are still character.
  rlang::as_function(fnFunction)
}

#' Load a Function for a Plugin
#'
#' @inheritParams shared-params
#'
#' @returns The function, if it can be found.
#' @keywords internal
util_AsFunction <- function(strFunction) {
  UseMethod("util_AsFunction")
}

#' @export
util_AsFunction.default <- function(strFunction) {
  rlang::as_function(strFunction)
}

#' @export
util_AsFunction.character <- function(strFunction) {
  fnFunction <- gsm::GetStrFunctionIfNamespaced(strFunction)
  # Extra step to work around things that are still character.
  rlang::as_function(fnFunction)
}

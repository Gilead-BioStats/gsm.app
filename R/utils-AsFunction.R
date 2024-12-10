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
  search_env <- rlang::global_env()
  fn_pieces <- strsplit(strFunction, "::")[[1]]
  if (length(fn_pieces) > 1) {
    pkg <- fn_pieces[[1]]
    if (!rlang::is_attached(rlang::pkg_env_name(pkg))) {
      rlang::check_installed(pkg, "for use by a gsm.app plugin.")
      attachNamespace(pkg) # nocov
    }
    search_env <- rlang::pkg_env(pkg)
    fn_pieces <- fn_pieces[[2]]
  }
  rlang::as_function(fn_pieces, env = search_env)
}

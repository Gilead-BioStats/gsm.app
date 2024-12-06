plugin_AsFunction <- function(strFunction) {
  UseMethod("plugin_AsFunction")
}

#' @export
plugin_AsFunction.default <- function(strFunction) {
  rlang::as_function(strFunction)
}

#' @export
plugin_AsFunction.character <- function(strFunction) {
  search_env <- rlang::global_env()
  fn_pieces <- strsplit(strFunction, "::")[[1]]
  if (length(fn_pieces) > 1) {
    search_env <- rlang::pkg_env(fn_pieces[[2]])
  }
  rlang::as_function(fn_pieces[[1]], env = search_env)
}

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

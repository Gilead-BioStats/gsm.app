#' Plugins Wrapper UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_Plugins_UI <- function(id, lPlugins = NULL) {
  ns <- NS(id)
  if (!is.null(lPlugins)) {
    plugin_items <- purrr::imap(lPlugins, function(lPlugin, id) {
      fnUI <- rlang::as_function(lPlugin$fnUI)
      bslib::nav_panel(
        title = lPlugin$strTitle,
        rlang::inject({
          fnUI(
            ns(id),
            !!!lPlugin$lConfig
          )
        })
      )
    })
    if (length(plugin_items) > 1) {
      plugin_items <- list(bslib::nav_menu(
        "Plugins",
        !!!plugin_items
      ))
    }
    return(plugin_items)
  }
}

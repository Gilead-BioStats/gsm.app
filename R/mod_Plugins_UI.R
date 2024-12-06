#' Plugins Wrapper UI
#'
#' @inheritParams shared-params
#' @keywords internal
mod_Plugins_UI <- function(id, lPlugins = NULL) {
  ns <- NS(id)
  if (!is.null(lPlugins)) {
    plugin_items <- purrr::imap(lPlugins, function(lPlugin, i) {
      fnUI <- plugin_AsFunction(lPlugin$shiny$UI)
      bslib::nav_panel(
        title = lPlugin$meta$Name,
        rlang::inject({
          fnUI(
            ns(i),
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

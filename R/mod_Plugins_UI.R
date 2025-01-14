#' Plugins Wrapper UI
#'
#' @inheritParams shared-params
#' @returns Plugins UI elements, either as a tab (if there is only one plugin)
#'   or in a drop-down list (for multiple plugins).
#' @keywords internal
mod_Plugins_UI <- function(id, lPlugins = NULL) {
  ns <- NS(id)
  if (!is.null(lPlugins)) {
    plugin_items <- purrr::imap(lPlugins, function(lPlugin, i) {
      if (length(lPlugin$required_inputs)) {
        # Allow for a placeholder instead of the plugin.
        pluginUI <- shiny::uiOutput(ns(i))
      } else {
        fnUI <- util_AsFunction(lPlugin$shiny$UI)
        pluginUI <- rlang::inject({
          fnUI(
            ns(paste0("plugin-", i)),
            !!!lPlugin$lConfig
          )
        })
      }
      bslib::nav_panel(title = lPlugin$meta$Name, pluginUI)
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

#' Read a Plugin Definition
#'
#' Plugins are defined by a named `list` with elements `strTitle` (a title to
#' show in the plugin menu), `fnUI` (a function or the name of a function to use
#' as the plugin's module UI), and `fnServer` (a function or the name of a
#' function to use as the plugin's module server). Use `pluginRead()` to read
#' these element definitions and any R files in the same directory.
#'
#' @param path The directory that contains the plugin.
#'
#' @returns A `list` with elements `strTitle`, `fnUi`, `fnServer`, and
#'   (optionally) `lConfig`, read from the YAML file in `path`. As a side
#'   effect, any `R` files in `path` are also loaded using `source()`.
#' @export
pluginRead <- function(path) {
  plugin_files <- list.files(path, full.names = TRUE)
  file_is_yaml <- grepl("\\.ya?ml$", plugin_files, ignore.case = TRUE)
  if (sum(file_is_yaml) != 1) {
    gsmapp_abort(
      c(
        "Plugin definition not found in {.file {path}}.",
        i = "Plugins must be defined by exactly 1 YAML file."
      ),
      strClass = "plugin-yaml"
    )
  }

  # Source any R files included in the definition.
  file_is_r <- grepl("\\.r$", plugin_files, ignore.case = TRUE)
  if (any(file_is_r)) {
    for (r_file in plugin_files[file_is_r]) {
      source(r_file)
    }
  }

  plugin_definition <- yaml::read_yaml(plugin_files[file_is_yaml])
  req_fields <- c("strTitle", "fnUI", "fnServer")
  if (!all(req_fields %in% names(plugin_definition))) {
    gsmapp_abort(
      "Plugin definitions must include these fields: {.field {req_fields}}.",
      strClass = "plugin-definition"
    )
  }
  plugin_fields <- c(req_fields, "lConfig")
  if (!all(names(plugin_definition) %in% plugin_fields)) {
    gsmapp_abort(
      "Plugin definitions can only include these fields: {.field {plugin_fields}}.",
      strClass = "plugin-definition"
    )
  }
  return(plugin_definition)
}

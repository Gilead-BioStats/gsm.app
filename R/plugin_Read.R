#' Read a Plugin Definition
#'
#' Plugins are defined by a named `list` with elements `strTitle` (a title to
#' show in the plugin menu), `fnUI` (a function or the name of a function to use
#' as the plugin's module UI), and `fnServer` (a function or the name of a
#' function to use as the plugin's module server). Use `plugin_Read()` to read
#' these element definitions and any R files in the same directory.
#'
#' @param path The directory that contains the plugin.
#'
#' @returns A `list` with elements `strTitle`, `fnUi`, `fnServer`, and
#'   (optionally) `lConfig`, read from the YAML file in `path`. As a side
#'   effect, any `R` files in `path` are also loaded using `source()`.
#' @export
plugin_Read <- function(path) {
  plugin_files <- list.files(path, full.names = TRUE)
  plugin_definition <- plugin_Read_yaml(plugin_files)

  # Source any R files included in the definition. Covr doesn't see most of the
  # code below here as covered when I check this single file, but it's covered
  # in overall pacakge coverage.
  file_is_r <- grepl("\\.r$", plugin_files, ignore.case = TRUE)
  if (any(file_is_r)) {
    for (r_file in plugin_files[file_is_r]) {
      source(r_file)
    }
  }
  return(plugin_definition)
}

plugin_Read_yaml <- function(plugin_files, envCall = rlang::caller_env()) {
  plugin_definition <- plugin_Read_yaml_file(plugin_files, envCall)
  req_fields <- c("strTitle", "fnUI", "fnServer")
  plugin_Read_yaml_has_all(plugin_definition, req_fields, envCall)
  plugin_Read_yaml_has_only(plugin_definition, c(req_fields, "lConfig"), envCall)

  return(plugin_definition)
}

plugin_Read_yaml_file <- function(plugin_files, envCall = rlang::caller_env()) {
  file_is_yaml <- grepl("\\.ya?ml$", plugin_files, ignore.case = TRUE)
  if (sum(file_is_yaml) != 1) {
    gsmapp_abort(
      c(
        "Plugin definition not found in {.file {path}}.",
        i = "Plugins must be defined by exactly 1 YAML file."
      ),
      strClass = "plugin-yaml",
      envCall = envCall,
      envEvaluate = envCall
    )
  }
  return(yaml::read_yaml(plugin_files[file_is_yaml]))
}

plugin_Read_yaml_has_all <- function(
  plugin_definition,
  req_fields = c("strTitle", "fnUI", "fnServer"),
  envCall = rlang::caller_env()
) {
  missing_fields <- setdiff(req_fields, names(plugin_definition))
  if (length(missing_fields)) {
    gsmapp_abort(
      c(
        "Plugin definitions must include these fields: {.field {req_fields}}.",
        x = "Missing fields: {.field {missing_fields}}."
      ),
      strClass = "plugin-definition",
      envCall = envCall
    )
  }
}

plugin_Read_yaml_has_only <- function(
  plugin_definition,
  plugin_fields = c("strTitle", "fnUI", "fnServer", "lConfig"),
  envCall = rlang::caller_env()
) {
  extra_fields <- setdiff(names(plugin_definition), plugin_fields)
  if (!all(names(plugin_definition) %in% plugin_fields)) {
    gsmapp_abort(
      c(
        "Plugin definitions can only include these fields: {.field {plugin_fields}}.",
        x = "Extra fields: {.field {extra_fields}}."
      ),
      strClass = "plugin-definition",
      envCall = envCall
    )
  }
  return(plugin_definition)
}

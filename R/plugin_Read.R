#' Read a Plugin Definition
#'
#' Plugins are defined by a named `list` with elements `strTitle` (a title to
#' show in the plugin menu), `fnUI` (a function or the name of a function to use
#' as the plugin's module UI), and `fnServer` (a function or the name of a
#' function to use as the plugin's module server). Use `plugin_Read()` to read
#' these element definitions and any R files in the same directory.
#'
#' @param strPath The directory that contains the plugin.
#'
#' @returns A `list` with elements `strTitle`, `fnUi`, `fnServer`, and
#'   (optionally) `lConfig`, read from the YAML file in `strPath`. As a side
#'   effect, any `R` files in `strPath` are also loaded using `source()`.
#' @export
#' @examples
#' aePlugin <- plugin_Read(system.file("plugins", "AE", package = "gsm.app"))
plugin_Read <- function(strPath) {
  chrPluginFiles <- list.files(strPath, full.names = TRUE)
  lPluginDefinition <- plugin_Read_yaml(chrPluginFiles)

  # Source any R files included in the definition. Covr doesn't see most of the
  # code below here as covered when I check this single file, but it's covered
  # in overall pacakge coverage.
  file_is_r <- grepl("\\.r$", chrPluginFiles, ignore.case = TRUE)
  if (any(file_is_r)) {
    for (r_file in chrPluginFiles[file_is_r]) {
      source(r_file)
    }
  }
  return(lPluginDefinition)
}

#' Process a Plugin YAML
#'
#' @inheritParams shared-params
#' @return A list with the validated plugin definition.
#' @keywords internal
plugin_Read_yaml <- function(chrPluginFiles, envCall = rlang::caller_env()) {
  lPluginDefinition <- plugin_Read_yaml_file(chrPluginFiles, envCall)
  chrRequiredFields <- c("strTitle", "fnUI", "fnServer")
  lPluginDefinition <- plugin_Read_yaml_has_all(
    lPluginDefinition,
    chrRequiredFields,
    envCall
  )
  lPluginDefinition <- plugin_Read_yaml_has_only(
    lPluginDefinition,
    c(chrRequiredFields, "lConfig"),
    envCall
  )

  return(lPluginDefinition)
}

#' Read a Plugin YAML
#'
#' @inheritParams shared-params
#' @return A list with a potential plugin definition.
#' @keywords internal
plugin_Read_yaml_file <- function(chrPluginFiles, envCall = rlang::caller_env()) {
  file_is_yaml <- grepl("\\.ya?ml$", chrPluginFiles, ignore.case = TRUE)
  if (sum(file_is_yaml) != 1) {
    gsmapp_abort(
      c(
        "Plugin definition not found in {.file {strPath}}.",
        i = "Plugins must be defined by exactly 1 YAML file."
      ),
      strClass = "plugin-yaml",
      envCall = envCall,
      envEvaluate = envCall
    )
  }
  return(yaml::read_yaml(chrPluginFiles[file_is_yaml]))
}

#' Check that a plugin definition has all required fields
#'
#' @inheritParams shared-params
#' @return A list with a plugin definition.
#' @keywords internal
plugin_Read_yaml_has_all <- function(
  lPluginDefinition,
  chrRequiredFields = c("strTitle", "fnUI", "fnServer"),
  envCall = rlang::caller_env()
) {
  missing_fields <- setdiff(chrRequiredFields, names(lPluginDefinition))
  if (length(missing_fields)) {
    gsmapp_abort(
      c(
        "Plugin definitions must include these fields: {.field {chrRequiredFields}}.",
        x = "Missing fields: {.field {missing_fields}}."
      ),
      strClass = "plugin-definition",
      envCall = envCall
    )
  }
  return(lPluginDefinition)
}

#' Check that a plugin definition has only the allowed fields
#'
#' @inheritParams shared-params
#' @return A list with a plugin definition.
#' @keywords internal
plugin_Read_yaml_has_only <- function(
  lPluginDefinition,
  chrPluginFields = c("strTitle", "fnUI", "fnServer", "lConfig"),
  envCall = rlang::caller_env()
) {
  extra_fields <- setdiff(names(lPluginDefinition), chrPluginFields)
  if (!all(names(lPluginDefinition) %in% chrPluginFields)) {
    gsmapp_abort(
      c(
        "Plugin definitions can only include these fields: {.field {chrPluginFields}}.",
        x = "Extra fields: {.field {extra_fields}}."
      ),
      strClass = "plugin-definition",
      envCall = envCall
    )
  }
  return(lPluginDefinition)
}

#' Define a plugin
#'
#' @inheritParams shared-params
#' @param strName `length-1 character` The name of the plugin, as it will
#'   display to the user in the menu of tabs and plugins.
#' @param ... Additional named arguments passed on to `fnShinyUI` and/or
#'   `fnShinyServer` by name.
#'
#' @returns A `list` with elements `meta`, `shiny`, `spec`, `workflows`,
#'   `config`, `required_inputs`, and `packages`.
#' @export
#'
#' @examples
#' aePlugin <- plugin_Define(
#'   strName = "Adverse Events",
#'   lSpec = list("AE" = list(), "SUBJ" = list()),
#'   fnShinyUI = "mod_AE_UI",
#'   fnShinyServer = "mod_AE_Server"
#' )
#' aePlugin
plugin_Define <- function(
  strName,
  lSpec,
  fnShinyUI,
  fnShinyServer,
  ...,
  lWorkflows = list(),
  chrRequiredInputs = character(),
  envCall = rlang::caller_env()
) {
  dots <- rlang::list2(...)
  lPlugin <- list(
    meta = list(Name = strName),
    shiny = list(
      UI = fnShinyUI,
      Server = fnShinyServer
    ),
    spec = lSpec,
    required_inputs = chrRequiredInputs
  )
  return(
    plugin_Prepare(lPlugin, lWorkflows, ..., envCall = envCall)
  )
}

#' Finish Plugin Definition
#'
#' @inheritParams shared-params
#' @param ... Additional named arguments passed on to `fnShinyUI` and/or
#'   `fnShinyServer` by name.
#' @returns The validated `lPlugin`.
#' @keywords internal
plugin_Prepare <- function(
  lPlugin,
  lWorkflows = list(),
  ...,
  envCall = rlang::caller_env()
) {
  lPlugin$workflows <- lWorkflows
  lPlugin$config <- rlang::list2(...)
  return(plugin_ValidateDefinition(lPlugin, envCall))
}

#' Validate Plugin Definition
#'
#' @inheritParams shared-params
#' @returns The validated `lPlugin`.
#' @keywords internal
plugin_ValidateDefinition <- function(lPlugin, envCall = rlang::caller_env()) {
  lPlugin <- purrr::keep(lPlugin, rlang::has_length)
  chrRequiredFields <- c("meta", "shiny")
  chrOptionalFields <- c(
    "spec", "packages", "required_inputs", "workflows", "config"
  )
  CheckHasAllFields(
    lPlugin,
    chrRequiredFields,
    "Plugin definitions",
    envCall
  )
  CheckHasOnlyFields(
    lPlugin,
    c(chrRequiredFields, chrOptionalFields),
    "Plugin definitions",
    envCall
  )
  lPlugin$meta <- plugin_ValidateMeta(lPlugin$meta, envCall)
  lPlugin$shiny <- plugin_ValidateShiny(lPlugin$shiny, envCall)
  # TODO: Validate spec
  lPlugin$spec <- lPlugin$spec %||% list()
  lPlugin$packages <- plugin_ValidatePackages(lPlugin$packages, envCall)
  lPlugin$required_inputs <- plugin_ValidateReqs(lPlugin$required_inputs, envCall)
  # TODO: Validate workflows
  lPlugin$workflows <- lPlugin$workflows %||% list()
  lPlugin$config <- lPlugin$config %||% list()

  return(lPlugin)
}

#' Validate Plugin Definition Meta
#'
#' @inheritParams shared-params
#' @param lPluginMeta `list` The plugin metadata.
#' @returns The validated `lPlugin$meta`.
#' @keywords internal
plugin_ValidateMeta <- function(lPluginMeta, envCall = rlang::caller_env()) {
  CheckHasAllFields(
    lPluginMeta,
    "Name",
    "Plugin definitions",
    envCall
  )
  CheckIsString(lPluginMeta$Name)
  return(lPluginMeta)
}

#' Validate Plugin Definition Shiny
#'
#' @inheritParams shared-params
#' @param lPluginShiny `list` The UI and Server function of the plugin.
#' @returns The validated `lPlugin$shiny`.
#' @keywords internal
plugin_ValidateShiny <- function(lPluginShiny, envCall = rlang::caller_env()) {
  CheckHasAllFields(
    lPluginShiny,
    c("UI", "Server"),
    "Plugin definition shiny sections",
    envCall
  )
  CheckHasOnlyFields(
    lPluginShiny,
    c("UI", "Server"),
    "Plugin definition shiny sections",
    envCall
  )
  return(lPluginShiny)
}

#' Validate Plugin Definition Packages
#'
#' @inheritParams shared-params
#' @param lPluginPackages `list` The names and sources of packages used by the
#'   plugin.
#' @returns The validated `lPlugin$packages`.
#' @keywords internal
plugin_ValidatePackages <- function(
  lPluginPackages,
  envCall = rlang::caller_env()
) {
  if (length(lPluginPackages)) {
    for (pkg in lPluginPackages) {
      CheckHasAllFields(
        pkg,
        "name",
        "Plugin definition package requirements",
        envCall
      )
      CheckHasOnlyFields(
        pkg,
        c("name", "remote"),
        "Plugin definition package requirements",
        envCall
      )
    }
  }
  return(lPluginPackages %||% list())
}

#' Validate Plugin Definition Required Inputs
#'
#' @inheritParams shared-params
#' @returns The validated `lPlugin$required_inputs`.
#' @keywords internal
plugin_ValidateReqs <- function(
  chrRequiredInputs,
  envCall = rlang::caller_env()
) {
  if (length(chrRequiredInputs)) {
    chrRequiredInputs <- tolower(chrRequiredInputs)
    CheckIsIn(
      chrRequiredInputs,
      c("metric", "group", "group level", "participant", "domain"),
      "Requird inputs",
      envCall
    )
  }
  return(chrRequiredInputs %||% character())
}

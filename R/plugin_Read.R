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
#' aePlugin
plugin_Read <- function(strPath) {
  chrPluginFiles <- list.files(strPath, full.names = TRUE)
  lPluginDefinition <- plugin_ReadYaml(chrPluginFiles)

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
#' @returns A list with the validated plugin definition.
#' @keywords internal
plugin_ReadYaml <- function(chrPluginFiles, envCall = rlang::caller_env()) {
  lPluginDefinition <- plugin_ReadYamlFile(chrPluginFiles, envCall)
  return(plugin_ValidateDefinition(lPluginDefinition, envCall))
}

#' Read a Plugin YAML
#'
#' @inheritParams shared-params
#' @returns A list with a potential plugin definition.
#' @keywords internal
plugin_ReadYamlFile <- function(chrPluginFiles, envCall = rlang::caller_env()) {
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

#' Validate Plugin Definition
#'
#' @inheritParams shared-params
#' @returns The validated `lPluginDefinition`.
#' @keywords internal
plugin_ValidateDefinition <- function(
  lPluginDefinition,
  envCall = rlang::caller_env()
) {
  chrRequiredFields <- c("meta", "shiny", "domains")
  chrOptionalFields <- c("lConfig", "packages")
  validate_hasAllFields(
    lPluginDefinition,
    c("meta", "shiny", "domains"),
    "Plugin defitions",
    envCall
  )
  validate_hasOnlyFields(
    lPluginDefinition,
    c(chrRequiredFields, chrOptionalFields),
    "Plugin defitions",
    envCall
  )
  validate_hasAllFields(
    lPluginDefinition$meta,
    "Name",
    "Plugin defitions",
    envCall
  )
  validate_hasAllFields(
    lPluginDefinition$shiny,
    c("UI", "Server"),
    "Plugin defition shiny sections",
    envCall
  )
  validate_hasOnlyFields(
    lPluginDefinition$shiny,
    c("UI", "Server"),
    "Plugin defition shiny sections",
    envCall
  )
  validate_in(
    lPluginDefinition$domains,
    names(chrDomainLabels),
    "Domains",
    envCall
  )
  if (length(lPluginDefinition$packages)) {
    for (pkg in lPluginDefinition$packages) {
      validate_hasAllFields(
        pkg,
        "name",
        "Plugin definition package requirements",
        envCall
      )
      validate_hasOnlyFields(
        pkg,
        c("name", "remote"),
        "Plugin definition package requirements",
        envCall
      )
    }
  }
  return(lPluginDefinition)
}

#' Load Plugin Dependencies
#'
#' Load the package dependencies of a plugin. This is designed to be used in an
#' `app.R` file to ensure that the dependencies are detected by packages like
#' rsconnect.
#'
#' @inheritParams shared-params
#'
#' @returns `lPluginDefinition`, invisibly. This function is called for its side
#'   effects.
#' @export
#'
#' @examplesIf interactive()
#' plugin_LoadDependencies(list(packages = list(list(name = "gsm.app"))))
plugin_LoadDependencies <- function(lPluginDefinition) {
  for (pkg in lPluginDefinition$packages) {
    suppressPackageStartupMessages(library(pkg$name, character.only = TRUE))
  }
  return(invisible(lPluginDefinition))
}

#' Get Plugin Package Dependency Sources
#'
#' Retrieve a vector of sources for plugin package dependencies, to make it
#' easier to install those sources. This function is intended for use in
#' automated deployment systems, such as GitHub Actions.
#'
#' @inheritParams shared-params
#'
#' @returns A character vector of package sources, such as "ggplot2" (to install
#'   from CRAN) or
#'   "url::https://safetygraphics.r-universe.dev/src/contrib/safetyCharts_0.4.0.tar.gz"
#'   (to install from a specific URL on r-universe).
#' @export
#' @examples
#' plugin_GetDependencySources(
#'   list(packages = list(
#'     list(name = "ggplot2"),
#'     list(name = "gsm", remote = "Gilead-BioStats/gsm")
#'   ))
#' )
plugin_GetDependencySources <- function(lPluginDefinition) {
  purrr::map_chr(lPluginDefinition$packages, function(pkg) {
    if (length(pkg$remote)) {
      return(pkg$remote)
    }
    return(pkg$name)
  })
}

#' Install Plugin Package Dependencies
#'
#' Plugins can have additional dependencies that are invisible to the usual
#' CI/CD pipelines. Use this function to install any such dependencies using the
#' pak package.
#'
#' @inheritParams shared-params
#'
#' @returns `lPluginDefinition`, invisibly. This function is called for its side
#'   effects.
#' @export
plugin_InstallDependencySources <- function(lPluginDefinition) {
  # nocov start
  rlang::check_installed("pak", "to install plugin dependencies")
  chrSources <- plugin_GetDependencySources(lPluginDefinition)
  for (pkg in chrSources) {
    pak::pak(pkg)
  }
  return(invisible(lPluginDefinition))
  # nocov end
}

# covr thinks a lot of this stuff isn't covered, but it is. Confirm that things
# are covered in the overall coverage report.

#' Read a Plugin Definition
#'
#' Plugins are defined by a named `list` with elements `meta` (containing at
#' least a `Name` to show in the plugin menu), `shiny` (containing `UI` and
#' `Server` fields to define the Shiny UI and Server functions for the plugin),
#' and `spec` (a specification of the data domains that the plugin uses), plus
#' optional fields `packages`, and `required_inputs`. Use `plugin_Read()` to
#' read these element definitions and any R files in the same directory. and
#' `spec` (a specification of the data domains that the plugin uses), plus
#' optional fields `packages`, and `required_inputs`. Use `plugin_Read()` to
#' read these element definitions and any R files in the same directory.
#'
#' @inheritParams shared-params
#' @param strPath The directory that contains the plugin.
#' @param ... Additional named arguments passed on to `fnShinyUI` and/or
#'   `fnShinyServer` by name.
#'
#' @returns A `list` with elements `meta`, `shiny`, `spec`, `workflows`,
#'   `config`, `required_inputs`, and `packages`, read from the YAML file in
#'   `strPath`. As a side effect, any `R` files in `strPath` are also loaded
#'   using `source()`.
#' @export
#' @examples
#' subjPlugin <- plugin_Read(
#'   system.file("plugins", "ParticipantProfile", package = "gsm.app")
#' )
#' subjPlugin
plugin_Read <- function(strPath, lWorkflows = list(), ...) {
  chrPluginFiles <- list.files(strPath, full.names = TRUE)
  lPlugin <- plugin_ReadYamlFile(chrPluginFiles)
  lPlugin <- plugin_Prepare(lPlugin, lWorkflows = lWorkflows, ...)

  # Source any R files included in the definition. Covr doesn't see most of the
  # code below here as covered when I check this single file, but it's covered
  # in overall package coverage.
  file_is_r <- grepl("\\.r$", chrPluginFiles, ignore.case = TRUE)
  if (any(file_is_r)) {
    for (r_file in chrPluginFiles[file_is_r]) {
      source(r_file)
    }
  }
  return(lPlugin)
}

#' Read a Plugin YAML
#'
#' @inheritParams shared-params
#' @returns A list with a potential plugin definition.
#' @keywords internal
plugin_ReadYamlFile <- function(chrPluginFiles, envCall = rlang::caller_env()) {
  file_is_yaml <- grepl("\\.ya?ml$", chrPluginFiles, ignore.case = TRUE)
  if (sum(file_is_yaml) != 1) {
    gsmappAbort(
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

#' Load Plugin Dependencies
#'
#' Load the package dependencies of a plugin. This is designed to be used in an
#' `app.R` file to ensure that the dependencies are detected by packages like
#' rsconnect.
#'
#' @inheritParams shared-params
#'
#' @returns `lPlugin`, invisibly. This function is called for its side effects.
#' @export
#'
#' @examplesIf interactive()
#' plugin_LoadDependencies(list(packages = list(list(name = "gsm.app"))))
plugin_LoadDependencies <- function(lPlugin) {
  for (pkg in lPlugin$packages) {
    suppressPackageStartupMessages(library(pkg$name, character.only = TRUE))
  }
  return(invisible(lPlugin))
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
#'     list(name = "gsm.core", remote = "Gilead-BioStats/gsm.core")
#'   ))
#' )
plugin_GetDependencySources <- function(lPlugin) {
  purrr::map_chr(lPlugin$packages, function(pkg) {
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
#' @returns `lPlugin`, invisibly. This function is called for its side effects.
#' @export
plugin_InstallDependencySources <- function(lPlugin) {
  # nocov start
  rlang::check_installed("pak", "to install plugin dependencies")
  chrSources <- plugin_GetDependencySources(lPlugin)
  for (pkg in chrSources) {
    pak::pak(pkg)
  }
  return(invisible(lPlugin))
  # nocov end
}

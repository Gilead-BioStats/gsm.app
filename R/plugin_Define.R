#' Title
#'
#' @inheritParams shared-params
#' @inheritParams rlang::args_dots_empty
#' @param strName `length-1 character` The name of the plugin, as it will
#'   display to the user in the menu of tabs and plugins.
#' @param chrDomains `character` Names of the data domains that are used by the
#'   plugin. Supported values: "AE" (Adverse Events), "DATACHG" (Data Changes),
#'   "DATAENT" (Data Entry), "ENROLL" (Enrollment), "LB" (Lab), "PD" (Protocol
#'   Deviations), "QUERY" (Queries), "STUDCOMP" (Study Completion), "SUBJ"
#'   (Subject Metadata), "SDRGCOMP" (Treatment Completion).
#' @param fnShinyUI `function or character` A shiny module UI function for the
#'   plugin, or the name of such a function in the current session.
#' @param fnShinyServer `function or character` A shiny module server function
#'   for the plugin, or the name of such a function in the current session.
#' @param chrRequiredInputs `character` An optional vector of any inputs
#'   ("Metric", "Site", "Participant", or "Domain") that must have a non-empty
#'   value before the plugin can load. "None" and "All" count as "empty" for
#'   this check. If the user has not set a value for that input, the app will
#'   display a placeholder instructing the user to make a selection.
#' @param lConfig `list` Optional additional arguments to pass to `fnShinyUI`
#'   and `fnShinyServer`.
#'
#' @returns A `list` with elements `meta`, `shiny`, `domains`, and (optionally)
#'   `required_inputs`.
#' @export
#'
#' @examples
#' aePlugin <- plugin_Define(
#'   strName = "Adverse Events",
#'   chrDomains = c("AE", "SUBJ"),
#'   fnShinyUI = "mod_AE_UI",
#'   fnShinyServer = "mod_AE_Server"
#' )
#' aePlugin
plugin_Define <- function(
  strName,
  chrDomains,
  fnShinyUI,
  fnShinyServer,
  ...,
  chrRequiredInputs = character(),
  lConfig = list(),
  envCall = rlang::caller_env()
) {
  rlang::check_dots_empty()
  CheckIsString(strName)
  CheckIsIn(
    chrDomains,
    names(chrDomainLabels),
    envCall = envCall
  )
  if (length(chrRequiredInputs)) {
    CheckIsIn(
      tolower(chrRequiredInputs),
      c("metric", "site", "participant", "domain"),
      "chrRequiredInputs",
      envCall
    )
  }

  lPluginDefinition <- list(
    meta = list(Name = strName),
    shiny = list(
      UI = fnShinyUI,
      Server = fnShinyServer
    ),
    domains = chrDomains,
    lConfig = lConfig,
    required_inputs = chrRequiredInputs
  )
  return(purrr::keep(lPluginDefinition, rlang::has_length))
}

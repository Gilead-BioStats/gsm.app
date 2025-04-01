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
        pluginUI <- uiOutput(ns(i))
      } else {
        fnUI <- AsFunction(lPlugin$shiny$UI)
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

#' Plugins Wrapper Server
#'
#' @inheritParams shared-params
#' @keywords internal
mod_Plugins_Server <- function(
  id,
  lPlugins,
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  l_rctvDomains,
  rctv_dateSnapshot,
  rctv_strMetricID,
  rctv_strSiteID,
  rctv_strSubjectID,
  rctv_strDomainID
) {
  moduleServer(id, function(input, output, session) {
    if (!is.null(lPlugins)) {
      purrr::imap(
        lPlugins,
        function(lPlugin, i) {
          chrRequiredInputs <- tolower(lPlugin$required_inputs)
          if (length(chrRequiredInputs)) {
            shiny_UI <- reactive({
              missing_inputs <- CompileUnsetInputs(
                chrRequiredInputs = chrRequiredInputs,
                rctv_strSiteID = rctv_strSiteID,
                rctv_strSubjectID = rctv_strSubjectID,
                rctv_strDomainID = rctv_strDomainID
              )
              if (length(missing_inputs)) {
                return(out_Placeholder(missing_inputs))
              }
              fnUI <- AsFunction(lPlugin$shiny$UI)
              rlang::inject({
                fnUI(
                  session$ns(paste0("plugin-", i)),
                  !!!lPlugin$lConfig
                )
              })
            })
            output[[i]] <- renderUI({shiny_UI()})
          }
          fnServer <- AsFunction(lPlugin$shiny$Server)
          names(l_rctvDomains) <- glue::glue("rctv_df{names(l_rctvDomains)}")
          args_available <- c(
            dfAnalyticsInput = dfAnalyticsInput,
            dfBounds = dfBounds,
            dfGroups = dfGroups,
            dfMetrics = dfMetrics,
            dfResults = dfResults,
            l_rctvDomains,
            rctv_dateSnapshot = rctv_dateSnapshot,
            rctv_strMetricID = rctv_strMetricID,
            rctv_strSiteID = rctv_strSiteID,
            rctv_strSubjectID = rctv_strSubjectID,
            rctv_strDomainID = rctv_strDomainID
          )
          args_used <- intersect(
            names(args_available),
            rlang::fn_fmls_names(fnServer)
          )
          rlang::inject(
            fnServer(
              paste0("plugin-", i),
              !!!lPlugin$lConfig,
              !!!args_available[args_used]
            )
          )
        }
      )
    }
  })
}

#' Figure out which required inputs aren't available
#'
#' @inheritParams shared-params
#' @returns A character vector of missing inputs.
#' @keywords internal
CompileUnsetInputs <- function(
  chrRequiredInputs,
  rctv_strSiteID,
  rctv_strSubjectID,
  rctv_strDomainID
) {
  missing_inputs <- c(
    CheckInputUnset("site", chrRequiredInputs, rctv_strSiteID),
    CheckInputUnset("participant", chrRequiredInputs, rctv_strSubjectID),
    CheckInputUnset("domain", chrRequiredInputs, rctv_strDomainID)
  )
  return(missing_inputs)
}

#' Check whether an input is set
#'
#' @inheritParams shared-params
#' @returns `strInputName` if the input is required and is not set, or
#'   `character()` if it isn't required or is set.
#' @keywords internal
CheckInputUnset <- function(
  strInputName,
  chrRequiredInputs,
  rctv_strValue
) {
  if (
    strInputName %in% chrRequiredInputs &&
    is.null(NullifyEmpty(rctv_strValue()))
  ) {
    return(strInputName)
  }
  return(character())
}

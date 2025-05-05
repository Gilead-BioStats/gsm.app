#' Plugins Wrapper UI
#'
#' @inheritParams shared-params
#' @returns Plugins UI elements, either as a tab (if there is only one plugin)
#'   or in a drop-down list (for multiple plugins).
#' @keywords internal
mod_Plugins_UI <- function(id, lPlugins = NULL) {
  ns <- NS(id)
  if (!is.null(lPlugins)) {
    names(lPlugins) <- ns(rlang::names2(lPlugins))
    plugin_items <- unname(purrr::imap(lPlugins, mod_Plugin_UI))
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
  l_rctvDomainHashes,
  rctv_dSnapshotDate,
  rctv_strMetricID,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  rctv_strDomainID
) {
  # nocov start
  #
  # Temporarily skipping tests because the UI works. Need concrete examples to
  # make this make more sense in testing.
  moduleServer(id, function(input, output, session) {
    if (!is.null(lPlugins)) {
      purrr::imap(
        lPlugins,
        function(lPlugin, id) {
          mod_Plugin_Server(
            lPlugin = lPlugin,
            id = id,
            lDataModel = list(
              dfAnalyticsInput = dfAnalyticsInput,
              dfBounds = dfBounds,
              dfGroups = dfGroups,
              dfMetrics = dfMetrics,
              dfResults = dfResults
            ),
            l_rctvDomains = l_rctvDomains,
            l_rctvDomainHashes = l_rctvDomainHashes,
            l_rctvInputs = list(
              rctv_dSnapshotDate = rctv_dSnapshotDate,
              rctv_strDomainID = rctv_strDomainID,
              rctv_strMetricID = rctv_strMetricID,
              rctv_strGroupID = rctv_strGroupID,
              rctv_strGroupLevel = rctv_strGroupLevel,
              rctv_strSubjectID = rctv_strSubjectID
            ),
            chrInputNamesPretty = c(
              "snapshot date",
              "domain",
              "metric",
              "group",
              "group level",
              "participant"
            )
          )
        }
      )
    }
  })
  # nocov end
}

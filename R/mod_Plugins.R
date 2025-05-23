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
    # Temporarily do this nullification JUST for plugins while I untangle it
    # throughout the rest of the app.

    ## Repeated unit to clean up/delete.
    rctv_dSnapshotDate_Nullified <- reactiveVal(NULL)
    observe({
      rctv_dSnapshotDate_Nullified(NullifyEmpty(rctv_dSnapshotDate()))
    }) %>%
      bindEvent(rctv_dSnapshotDate())
    observe({
      rctv_dSnapshotDate(NullifyEmpty(rctv_dSnapshotDate_Nullified()))
    }) %>%
      bindEvent(rctv_dSnapshotDate_Nullified())

    ## Repeated unit to clean up/delete.
    rctv_strDomainID_Nullified <- reactiveVal(NULL)
    observe({
      rctv_strDomainID_Nullified(NullifyEmpty(rctv_strDomainID()))
    }) %>%
      bindEvent(rctv_strDomainID())
    observe({
      rctv_strDomainID(NullifyEmpty(rctv_strDomainID_Nullified()))
    }) %>%
      bindEvent(rctv_strDomainID_Nullified())

    ## Repeated unit to clean up/delete.
    rctv_strMetricID_Nullified <- reactiveVal(NULL)
    observe({
      rctv_strMetricID_Nullified(NullifyEmpty(rctv_strMetricID()))
    }) %>%
      bindEvent(rctv_strMetricID())
    observe({
      rctv_strMetricID(NullifyEmpty(rctv_strMetricID_Nullified()))
    }) %>%
      bindEvent(rctv_strMetricID_Nullified())

    ## Repeated unit to clean up/delete.
    rctv_strGroupID_Nullified <- reactiveVal(NULL)
    observe({
      rctv_strGroupID_Nullified(NullifyEmpty(rctv_strGroupID()))
    }) %>%
      bindEvent(rctv_strGroupID())
    observe({
      rctv_strGroupID(NullifyEmpty(rctv_strGroupID_Nullified()))
    }) %>%
      bindEvent(rctv_strGroupID_Nullified())

    ## Repeated unit to clean up/delete.
    rctv_strGroupLevel_Nullified <- reactiveVal(NULL)
    observe({
      rctv_strGroupLevel_Nullified(NullifyEmpty(rctv_strGroupLevel()))
    }) %>%
      bindEvent(rctv_strGroupLevel())
    observe({
      rctv_strGroupLevel(NullifyEmpty(rctv_strGroupLevel_Nullified()))
    }) %>%
      bindEvent(rctv_strGroupLevel_Nullified())

    ## Repeated unit to clean up/delete.
    rctv_strSubjectID_Nullified <- reactiveVal(NULL)
    observe({
      rctv_strSubjectID_Nullified(NullifyEmpty(rctv_strSubjectID()))
    }) %>%
      bindEvent(rctv_strSubjectID())
    observe({
      rctv_strSubjectID(NullifyEmpty(rctv_strSubjectID_Nullified()))
    }) %>%
      bindEvent(rctv_strSubjectID_Nullified())

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
              rctv_dSnapshotDate = rctv_dSnapshotDate_Nullified,
              rctv_strDomainID = rctv_strDomainID_Nullified,
              rctv_strMetricID = rctv_strMetricID_Nullified,
              rctv_strGroupID = rctv_strGroupID_Nullified,
              rctv_strGroupLevel = rctv_strGroupLevel_Nullified,
              rctv_strSubjectID = rctv_strSubjectID_Nullified
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

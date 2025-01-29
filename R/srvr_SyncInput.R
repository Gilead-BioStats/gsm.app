#' Synchronize selectInput with reactive
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] that triggers [shiny::updateSelectInput()] when
#'   the connected reactive changes.
#' @keywords internal
srvr_SyncSelectInput <- function(
  id,
  rctv_strValue,
  session = getDefaultReactiveDomain()
) {
  bindEvent(
    observe({
      updateSelectInput(
        inputId = id,
        selected = rctv_strValue(),
        session = session
      )
    }),
    rctv_strValue()
  )
}

#' Synchronize selected tab with reactive
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] that triggers [bslib::nav_select()]
#'   when the connected reactive changes.
#' @keywords internal
srvr_SyncTab <- function(
  id,
  strTargetTab,
  rctv_strValue,
  rctv_strCurrentTab,
  chrFromTabs,
  session = getDefaultReactiveDomain()
) {
  observe({
    if (rctv_strCurrentTab() %in% chrFromTabs) {
      bslib::nav_select(id, strTargetTab, session = session)
    }
  }) %>%
    bindEvent(
      NullifyEmpty(rctv_strValue()),
      ignoreInit = TRUE
    )
}

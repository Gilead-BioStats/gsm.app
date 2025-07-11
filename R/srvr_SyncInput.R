#' Synchronize virtualSelectInput with reactive
#'
#' @inheritParams shared-params
#' @param rctv_chrChoices `reactive character` Choices to set.
#' @param rctv_strLabel `reactive character` Label to set.
#' @param rctv_strSelected `reactive character` Selected value to set.
#' @returns A [shiny::observe()] that triggers
#'   [shinyWidgets::updateVirtualSelect()] when the connected reactive changes.
#' @keywords internal
srvr_SyncVirtualSelectInput <- function(
  id,
  session = getDefaultReactiveDomain(),
  rctv_chrChoices = reactive(NULL, domain = session),
  rctv_strLabel = reactive(NULL, domain = session),
  rctv_strSelected = reactive(NULL, domain = session)
) {
  observe({
    chrChoices <- rctv_chrChoices()
    strLabel <- rctv_strLabel()
    strSelected <- rctv_strSelected()
    shinyWidgets::updateVirtualSelect(
      inputId = id,
      label = strLabel,
      choices = chrChoices,
      selected = strSelected,
      session = session
    )
  }, domain = session)
}

#' Synchronize selected tab with reactive
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] that triggers [bslib::nav_select()]
#'  when the connected reactive changes.
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

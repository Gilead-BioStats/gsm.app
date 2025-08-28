#' Synchronize virtualSelectInput with reactive
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] that triggers
#'   [shinyWidgets::updateVirtualSelect()] when the connected reactives change.
#' @keywords internal
srvr_SyncVirtualSelectInput <- function(
  id,
  session = getDefaultReactiveDomain(),
  rctv_chrChoices = NULL,
  rctv_strLabel = NULL,
  rctv_strSelected = NULL,
  rctv_lglDisable = NULL,
  rctv_chrDisabledChoices = NULL,
  rctv_lglOpen = NULL
) {
  observe(
    {
      shinyWidgets::updateVirtualSelect(
        inputId = id,
        label = CallIfReactive(rctv_strLabel),
        choices = CallIfReactive(rctv_chrChoices),
        selected = CallIfReactive(rctv_strSelected),
        disable = CallIfReactive(rctv_lglDisable),
        disabledChoices = CallIfReactive(rctv_chrDisabledChoices),
        open = CallIfReactive(rctv_lglOpen),
        session = session
      )
    },
    domain = session
  )
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

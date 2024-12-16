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
  observe({
    updateSelectInput(
      inputId = id,
      selected = rctv_strValue(),
      session = session
    )
  })
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
  session = getDefaultReactiveDomain()
) {
  observe({
    main_tabs <- c("Study Overview", "Metric Details", "Participant Details")
    if (rctv_strCurrentTab() %in% main_tabs) {
      bslib::nav_select(id, strTargetTab, session = session)
    }
  }) %>%
    bindEvent(
      null_for_none(rctv_strValue()),
      ignoreInit = TRUE
    )
}

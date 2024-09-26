#' Synchronize selectInput with reactive
#'
#' @inheritParams shared-params
#' @return A [shiny::observe()] that triggers [shiny::updateSelectInput()] when
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

#' Synchronize selectizeInput with reactive
#'
#' @inheritParams shared-params
#' @return A [shiny::observe()] that triggers [shiny::updateSelectizeInput()]
#'   when the connected reactive changes.
#' @keywords internal
srvr_SyncSelectizeInput <- function(
  id,
  rctv_strValue,
  chrChoices,
  ...,
  session = getDefaultReactiveDomain()
) {
  observe({
    strValue <- rctv_strValue()
    if (length(strValue) && strValue != "") {
      updateSelectizeInput(
        inputId = id,
        choices = chrChoices,
        selected = strValue,
        ...,
        session = session
      )
    }
  })
}

#' Synchronize selectizeInput with reactive
#'
#' @inheritParams shared-params
#' @return A [shiny::observe()] that triggers [bslib::nav_select()]
#'   when the connected reactive changes.
#' @keywords internal
srvr_SyncTab <- function(
    id,
    strTargetTab,
    rctv_strValue,
    session = getDefaultReactiveDomain()
) {
  observe(
    bslib::nav_select(id, strTargetTab, session = session)
  ) %>%
    bindEvent(
      null_for_none(rctv_strValue()),
      ignoreInit = TRUE
    )
}

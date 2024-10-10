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

#' Synchronize selectizeInput with reactive
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] that triggers [bslib::nav_select()]
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

#' Reset app
#'
#' @inheritParams shared-params
#' @returns A [shiny::observe()] that resets the app when the reset input
#'   changes.
#' @keywords internal
srvr_Reset <- function(
  dfMetrics,
  dfParticipantGroups,
  rctv_intReset,
  session = getDefaultReactiveDomain()
) {
  observe({
    updateSelectInput(session, "metric", selected = dfMetrics$MetricID[[1]])
    updateSelectInput(session, "site", selected = "None")
    updateSelectizeInput(
      "participant",
      choices = c("None", dfParticipantGroups$SubjectID),
      selected = "None",
      server = TRUE,
      session = session
    )
    bslib::nav_select("primary_nav_bar", "Study Overview")
  }) %>%
    bindEvent(rctv_intReset())
}

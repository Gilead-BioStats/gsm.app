#' Initialize Participant Select
#'
#' @inheritParams shared-params
#'
#' @keywords internal
initialize_participant_select <- function(dfAnalyticsInput, session) {
  participant_ids <- sort(dfAnalyticsInput$SubjectID)
  shiny::updateSelectizeInput(
    session,
    "participant",
    choices = c("None", participant_ids),
    selected = "None",
    server = TRUE
  )
}

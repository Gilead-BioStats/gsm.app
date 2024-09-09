#' Initialize Participant Select
#'
#' @inheritParams shared-params
#'
#' @keywords internal
initialize_participant_select <- function(dfAnalyticsInput, session) {
  participant_ids <- sort(unique(dfAnalyticsInput$SubjectID))
  updateSelectizeInput(
    session,
    "participant",
    choices = c("None", participant_ids),
    selected = "None",
    server = TRUE
  )
}
